# Maintainer: Hao Zhang <hao [at] hao-zhang [dot] com>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=python-quantlib
_pkgname=QuantLib-SWIG
pkgver=1.29
pkgrel=1
pkgdesc="A Python binding for QuantLib."
arch=("x86_64")
url="http://quantlib.org"
license=("BSD")
options=(!libtool)
depends=("quantlib>=$pkgver" "python" "openmp")
makedepends=("clang" "boost")
source=(https://github.com/lballabio/$_pkgname/releases/download/$_pkgname-v$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=("77b3eadc0e956740f8d84c9bb9c884e4e4aec3e9f97464b8f79e08efe2672525")

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  autoreconf -if
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
