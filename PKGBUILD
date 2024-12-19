# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: peippo <christoph+aur@christophfink.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname=rJava
_pkgver=1.0-11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
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
md5sums=('4d8eff03a23cb797f01e710ea7528dd2')
b2sums=('13ecb4a3c545505f047474027d586e0bf7ca02676bbe0bcd142bba786b3380714937f71efa2ca324fcf6efa0c20112f9ef8bc01d8093d3eea17e63176048d6b4')


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
