# Maintainer: Duama <i@rvf6.com>

pkgname=python-pdftopng
_pkgname=pdftopng
pkgver=0.2.3
pkgrel=5
pkgdesc="A PDF to PNG conversion library (based on pdftoppm from poppler)"
arch=('x86_64')
url="https://github.com/vinayak-mehta/pdftopng"
license=('GPL2')
depends=('poppler' 'python-click')
makedepends=('pybind11' 'python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/vinayak-mehta/$_pkgname/archive/v$pkgver.tar.gz"
        "https://gitlab.freedesktop.org/poppler/poppler/-/raw/48914b5d5fc12ae96d4f3ac3fc9c6fd08a1d6496/utils/numberofcharacters.h"
        "setOverprintPreview.patch"
        "c++17.patch")
sha256sums=('2b0cda9b7e151d67a182bb753138309c3a6b035939577c5527a34a2c1ef96b64'
            '285258e387080c775e4f6f5bca652e9e707c3beac83c6625d3b840c4e13c6440'
            'a64e9acf757f4ca2edcf6c16e11abcdf827a704dd0a66acb7c71a270fd4da0b0'
            '45579a1d5a5bfc984997900945c8aa51636eaa5b49b49184145a81c3ab60a9f3')

prepare() {
  cd $_pkgname-$pkgver
  sed -i '/^\#include "config\.h"/d' src/pdftopng/pdftopng.cpp
  sed -i 's/^poppler_dir = .*$/poppler_dir = "\/usr\/include\/poppler"/g' setup.py
  #sed -i 's/^build_dir = .*$/build_dir = "\/usr\/lib"/g' setup.py
  sed -i 's/lib\/poppler\/build/\/usr\/lib/g' setup.py
  cp "$srcdir"/numberofcharacters.h src/pdftopng/
  patch --forward --strip=1 --input="$srcdir"/setOverprintPreview.patch
  patch --forward --strip=1 --input="$srcdir"/c++17.patch
}

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}

