# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: peippo <christoph+aur@christophfink.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname=rJava
_pkgver=1.0-14
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
md5sums=('388a04055f74b07dac76aabc8b433cff')
b2sums=('83c315cc0779b90a4cfb46b861137111bffac86c1451fee85590691c7cb2e041cb2927eef1af99f042d1a1b54d4e831d27fe8038973d384d3959fc1684aa7007')


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
