# Maintainer: Sergey Kostyuchenko <derfenix@gmail.com>

pkgname=corectrl
pkgver=1.0.2
pkgrel=2
pkgdesc="Core control application"
url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('procps-ng' 'hwids')
makedepends=('cmake>=3.3' 'botan>=2.2.0' 'qt5-base>=5.9' 'qt5-tools' 'kauth' 'karchive' 'gcc>=7.2' 'extra-cmake-modules' 'qt5-charts' 'qt5-quickcontrols' 'qca')
optdepends=(
	'vulkan-tools: For vulkaninfo'
	'mesa-demos: For glxinfo',
	'util-linux: For lscpu'
)
source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha512sums=('afa9e6baba888fe05615f0b1527d5731c29a343bc865a1ff0328c14343bf2cc935cc7ccf381f66fc2bc6c026cbadec231e9b11ea583aa728dadfbede227c7b0c')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF ..
  make ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}/build" 
  sed -i -- 's/\/usr/${CMAKE_INSTALL_PREFIX}/g' src/helper/cmake_install.cmake
  make install
  for size in 24x24 48x48 32x32 96x96 64x64 22x22 196x196 72x72 128x128 16x16 256x256; do ln -fs $pkgdir/usr/share/icons/hicolor/$size/apps/CoreCtrl.svg $pkgdir/usr/share/icons/hicolor/$size/apps/corectrl.svg; done
}
