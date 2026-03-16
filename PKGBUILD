# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: peippo <christoph+aur@christophfink.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname=rJava
_pkgver=1.0-16
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
md5sums=('842985261aeaeece3dd543c537d90dc8')
b2sums=('29509ac1d410a6525b0edcdd509b02d878033da8947b0a084cc75711d5dec5bdb7e5a4c8ab57658ee4ccac5ffe704cacec631b419e488c703565af27faf55553')


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
