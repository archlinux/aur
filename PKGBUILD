# Maintainer: Kuchiriel <matheus.almeida@techie.com>

_commit=28c7aa1f70e7d5669b825c9c431eedfdbcdc2c5d  # tags=v1.9.7
pkgname=librealsense-1.9.7
pkgver=v1.9.7
pkgrel=1
pkgdesc="Intel® RealSense™ SDK 2.0 is a cross-platform library for 
Intel® RealSense™ depth cameras (D400 series and the SR300)"
arch=('x86_64')
url="https://github.com/IntelRealSense/librealsense"
license=('Apache')
makedepends=('cmake' 'linux-lts-headers')
depends=('glfw-x11' 'gtk3' 'libusb' 'linux-lts')
source=("git+https://github.com/Kuchiriel/librealsense-1.9.7#commit=${_commit}")
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build && cd build
  CFLAGS="${CFLAGS} -Wformat" \
  CXXFLAGS="${CXXFLAGS} -Wformat" \
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SBINDIR=bin \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=on \
    -DBUILD_WITH_STATIC_CRT=off \
    -DBUILD_WITH_OPENMP=on \
    -DBUILD_EXAMPLES=true
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  DESTDIR="${pkgdir}" make install
  cd "${srcdir}/${pkgname}/config"
  install -Dm644 99-realsense-libusb.rules 
"${pkgdir}/etc/udev/rules.d/99-realsense-libusb.rules"
}
