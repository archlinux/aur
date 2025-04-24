# Maintainer: Hao Zhang <hao [at] hao-zhang [dot] com>
# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=python-quantlib
_pkgname=QuantLib-SWIG
pkgver=1.38
pkgrel=1
pkgdesc="QuantLib wrappers to Python"
arch=(x86_64)
url="http://quantlib.org"
license=(BSD-3-Clause)
depends=("quantlib>=$pkgver" python openmp)
makedepends=(clang boost python-installer python-build python-setuptools)
checkdepends=(python-tox python-pytest)
source=(https://github.com/lballabio/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=("405a4f9c6ef730589fe1c017a1fb7e24fa4a53f6815d9c6d0f071c9ef591bcf5")
options=(!libtool)

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  autoreconf -if
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    CC=clang \
    CXX=clang++ \
    CXXFLAGS="$CXXFLAGS -std=c++17"

  make -C Python
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i 's/, ql.Date()//g' Python/test/test_date.py
  make -C Python check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    Python/dist/*.whl

  install -Dm755 LICENSE.TXT -t \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}
