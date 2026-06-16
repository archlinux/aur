# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=ermis
_pkgname=Ermis
pkgver=1.1.1
pkgrel=2
pkgdesc='Image, Audio, Text, PDF, Distributed and Network Steganography Suite.'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/alamahant/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('33cbfc670110321fa05b36812b76eef496c9430c5955b077183bdc50ef9c0185')

build(){
  cd "$srcdir/${_pkgname}-${pkgver}"
  
  # There is an error stemming from the fact that QStyleFactory has not been included in
  # the file main.ccp - fixing this (add it as the last <include> dirctive):
  sed -i '8a #include <QStyleFactory>' main.cpp
  
  cmake -B build_dir -S . -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build_dir
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  DESTDIR="$pkgdir" cmake --install ./build_dir/
}
