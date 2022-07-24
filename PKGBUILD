# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=quantlib
pkgname=java-$_pkgname
_PkgName=QuantLib-SWIG
pkgver=1.26
pkgrel=1
pkgdesc="Java bindings for QuantLib"
arch=("x86_64")
url="http://quantlib.org"
license=("BSD")
depends=("quantlib>=$pkgver" "java-environment")
makedepends=("gcc" "boost")
provides=("scala-$_pkgname")
source=("https://github.com/lballabio/$_PkgName/releases/download/$_PkgName-v$pkgver/$_PkgName-$pkgver.tar.gz")
sha256sums=("84838a1d0ad3994a195646c04e9c85bfc9314b8b3987c26853ea5d645fb62a8e")
options=(!libtool)

build() {
  unset _JAVA_OPTIONS
  cd "$srcdir/$_PkgName-$pkgver"
  ./configure \
    --prefix=/usr \
    CC=gcc \
    CXX=g++ \
    CXXFLAGS="-I/usr/lib/jvm/default/include -I/usr/lib/jvm/default/include/linux $CXXFLAGS"
  make -C Java
}

check() {
  cd "$srcdir/$_PkgName-$pkgver"
  make -C Java check
}

package() {
  cd "$srcdir/$_PkgName-$pkgver"
  make -C Java install prefix="$pkgdir/usr"
  install -Dm755 LICENSE.TXT -t \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
  install -dm755 "$pkgdir/usr/share/java/$_pkgname"
  mv "$pkgdir/usr/lib/QuantLib.jar" "$pkgdir/usr/share/java/$_pkgname"
}
