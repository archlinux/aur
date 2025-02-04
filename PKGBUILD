# Maintainer: Hao Zhang <hao [at] hao-zhang [dot] com>
# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=python-quantlib
_pkgname=QuantLib-SWIG
pkgver=1.37
pkgrel=1
pkgdesc="QuantLib wrappers to Python"
arch=(x86_64)
url="http://quantlib.org"
license=(BSD-3-Clause)
depends=("quantlib>=$pkgver" python openmp)
makedepends=(clang boost python-installer python-build python-setuptools)
checkdepends=(python-tox python-pytest)
source=(https://github.com/lballabio/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=("90b9623d1165ad3f6ae6bfc431ea215d9b8075c3174bcbb628b1dffde40473eb")
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
