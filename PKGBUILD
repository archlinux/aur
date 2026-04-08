# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: peippo <christoph+aur@christophfink.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname=rJava
_pkgver=1.0-18
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Low-Level R to Java Interface"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.1-only')
depends=(
  java-runtime
  r
)
makedepends=(
  java-environment
  patchelf
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0e18ef3ee05425927ef5ec229e86ad7b')
b2sums=('f4c56b60a49b9eb80b87633e8b4037a726ce51efde981465687e711f4a7891c77fd13e019bf768abfb6133d6ef70d076d01ff85450c59a78b9770d30e50789e6')


build() {
  export JAVA_HOME=/usr/lib/jvm/default
  export JAR=$JAVA_HOME/bin/jar
  export JAVA=$JAVA_HOME/bin/java
  export JAVAC=$JAVA_HOME/bin/javac
  export JAVA_CPPFLAGS="-I$JAVA_HOME/include -I$JAVA_HOME/include/linux"
  export JAVA_LD_LIBRARY_PATH=$JAVA_HOME/lib/server
  export JAVA_LIBS="-L$JAVA_HOME/lib/server -ljvm"
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$JAVA_HOME/lib/server"

  mkdir build
  R CMD INSTALL -l build "$_pkgname"

  patchelf --set-rpath "$JAVA_LD_LIBRARY_PATH" "build/$_pkgname/libs/rJava.so"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
