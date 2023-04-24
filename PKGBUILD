# Maintainer: Hao Zhang <hao [at] hao-zhang [dot] com>
# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=python-quantlib
_pkgname=QuantLib-SWIG
pkgver=1.30
pkgrel=1
pkgdesc="QuantLib wrappers to Python"
arch=("x86_64")
url="http://quantlib.org"
license=("BSD")
depends=("quantlib>=$pkgver" "python" "openmp")
makedepends=("clang" "boost")
source=(https://github.com/lballabio/$_pkgname/releases/download/$_pkgname-v$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=("1697c13467a7eea0375ed113bd6b35157c568368dba8e8763597a4ef7116fa48")
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
