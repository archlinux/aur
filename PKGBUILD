# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pkgname=quantlib
_PkgName=QuantLib-SWIG
pkgname=java-$_pkgname
pkgver=1.31.1
pkgrel=1
pkgdesc="Java bindings for QuantLib"
arch=(x86_64)
url="http://quantlib.org"
license=(BSD)
depends=("quantlib>=$pkgver" "java-environment")
makedepends=(gcc boost)
provides=(scala-$_pkgname)
source=(https://github.com/lballabio/$_PkgName/releases/download/v$pkgver/$_PkgName-$pkgver.tar.gz)
sha256sums=("6cc5874e674697c0cf3043e744b9269c8bc1e8b521888a1c9d7a711041c7d959")
options=(!libtool)

prepare() {
  unset _JAVA_OPTIONS
  cd "$srcdir/$_PkgName-$pkgver"
  autoreconf -if
}

build() {
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
