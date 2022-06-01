# Contributor: William J. Bowman <aur@williamjbowman.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ect
_pkgname=Efficient-Compression-Tool
pkgver=0.9.1
pkgrel=1
pkgdesc='file compressor, supports postcompression of PNG, JPEG, GZIP and ZIP files.'
url='https://github.com/fhanau/Efficient-Compression-Tool'
arch=('i686' 'x86_64')
license=('Apache')
source=("${_pkgname}-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b4af4f1da55ca5ebc1f02029bb7fc7de9c6a45593d1866f35cdca839e01c1a1f')
depends=('gcc-libs')
makedepends=('nasm' 'cmake')

prepare() {
  cd ${_pkgname}
  git submodule init 
  git submodule update --init --recursive --recommend-shallow
}

build() {
  cd ${_pkgname}
  [ -d build ] || mkdir build
  cd build
  cmake -DECT_FOLDER_SUPPORT=off ../src
  make
}

package() {
  cd ${_pkgname}/src

  PREFIX=/usr/ DESTDIR="${pkgdir}" make install
  cd "${pkgdir}"/usr/bin

  # Some things expect this to be an all-caps name
  ln -s ect ECT
}
