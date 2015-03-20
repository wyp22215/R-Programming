#See README.md for instructions on running the code and output from it

#makeCacheMatrix  function will return a list of functions
#Its purpose is to store a matrix and cached value of the inverse of the matrix
#including:
#setMatrix :set the value of a matrix
#getMatrix :get the value of a matrix
#cacheInverse:
#getInverse:get the cached value(inverse of the matrix)

makeCacheMatrix<-function(x=numeric()){
#initial NULL to the cache value
cache<-NULL

#store a matrix
setMatrix<-function(nValue){
x<<-nValue
#flush the cache
cache<<-NULL
}


#returns the stored matrix
getMatrix<-function(){
x
}

#cache the given argument
cacheInverse<-function(solve){
cache<<-solve
}

#get the cached value
getInverse<-function(){
cache
}

#return a list,each named element of the lis is a function
list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}

cacheSolve<-function(y,...){
#get the cached value
inverse<-y$getInverse()
if(!is.null(inverse)){
message("getting cached data")
return(inverse)
}

data<-y$getMatrix()
inverse<-solve(data)
y$cacheInverse(inverse)

inverse
}

