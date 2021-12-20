# Maintainer: Hartmut Seichter <hartmut@technotecture.com>

tags=v1.12.4
pkgname=librealsense-legacy
pkgver=1.12.4
pkgrel=1
pkgdesc="Intel® RealSense™ SDK 1.2.x is a cross-platform API for Intel® RealSense™ F200, SR300, R200, LR200 and the ZR300"
arch=('x86_64')
url="https://github.com/IntelRealSense/librealsense"
license=('Apache')
makedepends=('cmake')
depends=('glfw-x11' 'libusb')
source=("https://github.com/IntelRealSense/librealsense/archive/v${pkgver}.tar.gz")

sha256sums=(SKIP)

build() {
  cd "${srcdir}/librealsense-${pkgver}"
  mkdir -p build && cd build
  CFLAGS="${CFLAGS} -Wformat" \
  CXXFLAGS="${CXXFLAGS} -Wformat" \
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SBINDIR=bin \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=true \
    -DBUILD_UNIT_TESTS=off \
    -DBUILD_EXAMPLES=false
  make
}

package() {
  cd "${srcdir}/librealsense-${pkgver}/build"
  DESTDIR="${pkgdir}" make install
  cd "${srcdir}/librealsense-${pkgver}/config"
  install -Dm644 99-realsense-libusb.rules "${pkgdir}/etc/udev/rules.d/99-realsense-legacy-libusb.rules"
}
