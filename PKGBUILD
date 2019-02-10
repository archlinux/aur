# Maintainer: pingplug <pingplug@foxmail.com>
# Contributr: Patrick José Pereira <positivcheg94@gmail.com>

_commit=3c5e2bbda4bd0726bfd81bee13372a9ee797278b  # tags=v2.18.1
pkgname=librealsense
pkgver=v2.18.1
pkgrel=1
pkgdesc="Intel® RealSense™ SDK 2.0 is a cross-platform library for Intel® RealSense™ depth cameras (D400 series and the SR300)"
arch=('x86_64')
url="https://github.com/IntelRealSense/librealsense"
license=('Apache')
makedepends=('cmake' 'git')
depends=('glfw-x11' 'gtk3' 'libusb')
source=("git+https://github.com/IntelRealSense/librealsense#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build && cd build
  CFLAGS="${CFLAGS} -Wformat -pthread" \
  CXXFLAGS="${CXXFLAGS} -Wformat -pthread" \
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SBINDIR=bin \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=on \
    -DBUILD_WITH_STATIC_CRT=off \
    -DBUILD_WITH_OPENMP=on \
    -DBUILD_EXAMPLES=true \
    -DBUILD_WITH_TM2=true
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  DESTDIR="${pkgdir}" make install
  cd "${srcdir}/${pkgname}/config"
  install -Dm644 99-realsense-libusb.rules "${pkgdir}/etc/udev/rules.d/99-realsense-libusb.rules"
}
