# Maintainer: Hao Zhang <hao [at] hao-zhang [dot] com>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=python-quantlib
_pkgname=QuantLib-SWIG
pkgver=1.27
pkgrel=1
pkgdesc="A Python binding for QuantLib."
arch=("x86_64")
url="http://quantlib.org"
license=("BSD")
options=(!libtool)
depends=("quantlib>=1.27" "python" "openmp")
makedepends=("clang" "boost")
source=(https://github.com/lballabio/$_pkgname/releases/download/$_pkgname-v$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=("d6d927389265a0aa13d087124a7fb8fb2b58758f621a38f60e13a642be9bdc0f")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i "s#boost::dynamic_pointer_cast#ext::dynamic_pointer_cast#g" \
    Python/QuantLib/quantlib_wrap.cpp
  ./configure --prefix=/usr CC=clang CXX=clang++
  make -C Python
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i "s#setup.py install#setup.py install --root=\"${pkgdir}\"#g" \
    Python/Makefile
  make -C Python install
  install -Dm755 LICENSE.TXT -t \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}
