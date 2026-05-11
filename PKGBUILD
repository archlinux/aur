# Maintainer: Zaros <kuzidiaolewc@outlook.com>
# Contributor: Gemini CLI Agent

pkgname=obs-bilibili-stream
pkgver=2.0.12
pkgrel=1
pkgdesc="Bilibili stream plugin for OBS Studio (Scan QR code to login, update room info, and get RTMP info)"
arch=('x86_64')
url="https://github.com/Zarosmm/obs-bilibili-stream"
license=('GPL2')
depends=('obs-studio' 'curl' 'qt6-base')
makedepends=('cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('005fdac6c148e63010f718e88206034f84407875fc3469ac4ab85da755c619bc')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_QT=ON \
    -DENABLE_FRONTEND_API=ON
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  
  # The original CMakeLists.txt has a redundant install rule that puts 
  # files in /usr/obs-plugins/64bit. We remove it to keep the package clean
  # and follow Arch Linux standards (/usr/lib/obs-plugins/).
  rm -rf "${pkgdir}/usr/obs-plugins"
}
