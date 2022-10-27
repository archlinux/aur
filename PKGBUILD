# Maintainer: Hao Zhang <hao [at] hao-zhang [dot] com>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=python-quantlib
_pkgname=QuantLib-SWIG
pkgver=1.28
pkgrel=1
pkgdesc="A Python binding for QuantLib."
arch=("x86_64")
url="http://quantlib.org"
license=("BSD")
options=(!libtool)
depends=("quantlib>=$pkgver" "python" "openmp")
makedepends=("clang" "boost")
source=(https://github.com/lballabio/$_pkgname/releases/download/$_pkgname-v$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=("e3dec686bd3e42767d955dae78f8b8e1ffca13a0d58985d6ac541a2593e58b3f")

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  autoreconf -if
  sed -i "s#boost::dynamic_pointer_cast#ext::dynamic_pointer_cast#g" \
    Python/QuantLib/quantlib_wrap.cpp
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr CC=clang CXX=clang++
  make -C Python
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make -C Python check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i "s#setup.py install#setup.py install --root=\"${pkgdir}\"#g" \
    Python/Makefile
  make -C Python install
  install -Dm755 LICENSE.TXT -t \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}
