# Maintainer: Duama <i@rvf6.com>

pkgname=python-pdftopng
_pkgname=pdftopng
pkgver=0.2.3
pkgrel=1
pkgdesc="A PDF to PNG conversion library (based on pdftoppm from poppler)"
arch=('x86_64')
url="https://github.com/vinayak-mehta/pdftopng"
license=('GPL2')
depends=('poppler' 'python-click')
makedepends=('pybind11' 'python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/vinayak-mehta/$_pkgname/archive/v$pkgver.tar.gz"
        "https://github.com/freedesktop/poppler/raw/fcdff7bb19e2ac0fab6505f17e0c18c8faa86323/utils/numberofcharacters.h")
sha256sums=('2b0cda9b7e151d67a182bb753138309c3a6b035939577c5527a34a2c1ef96b64'
            '285258e387080c775e4f6f5bca652e9e707c3beac83c6625d3b840c4e13c6440')

prepare() {
  cd $_pkgname-$pkgver
  sed -i '/^\#include "config\.h"/d' src/pdftopng/pdftopng.cpp
  sed -i 's/^poppler_dir = .*$/poppler_dir = "\/usr\/include\/poppler"/g' setup.py
  #sed -i 's/^build_dir = .*$/build_dir = "\/usr\/lib"/g' setup.py
  sed -i 's/lib\/poppler\/build/\/usr\/lib/g' setup.py
  cp "$srcdir"/numberofcharacters.h src/pdftopng/
}

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}

