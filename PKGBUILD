# Maintainer: Hao Zhang <hao [at] hao-zhang [dot] com>
# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=python-quantlib
_pkgname=QuantLib-SWIG
pkgver=1.32
pkgrel=1
pkgdesc="QuantLib wrappers to Python"
arch=(x86_64)
url="http://quantlib.org"
license=(BSD)
depends=("quantlib>=$pkgver" python openmp)
makedepends=(clang boost python-setuptools)
source=(https://github.com/lballabio/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=("9d312ab51ab63b47982e31dc06b6c27224d4f7a7e237f0964225b9c6c6b7d86c")
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
