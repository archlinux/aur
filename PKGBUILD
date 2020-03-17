# Maintainer: otaj jasek.ota (at) gmail (dot) com
# Maintainer: pingplug <pingplug@foxmail.com>
# Contributr: Patrick José Pereira <positivcheg94@gmail.com>

pkgbase=librealsense-git
pkgname=(librealsense-git python-pyrealsense2-git)
_pkgname=librealsense
pkgver=v2.33.1
pkgrel=1
pkgdesc="Intel® RealSense™ SDK 2.0 is a cross-platform library for Intel® RealSense™ depth cameras (D400 series and the SR300)"
arch=('x86_64')
url="https://github.com/IntelRealSense/librealsense"
license=('Apache')
makedepends=('cmake' 'git' 'python' 'python-setuptools')
depends=('glfw-x11' 'gtk3' 'libusb')
source=("git+https://github.com/IntelRealSense/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
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
    -DBUILD_WITH_TM2=true \
    -DBUILD_EXAMPLES=true \
    -DFORCE_LIBUVC=true \
    -DBUILD_PYTHON_BINDINGS=true
  make
}

package_librealsense-git() {
  provides=('librealsense')
  conflicts=('librealsense')
  cd "${srcdir}/${_pkgname}/build"
  DESTDIR="${pkgdir}" make install
  find ${pkgdir}/usr/lib -name "py*" -delete
  cd "${srcdir}/${_pkgname}/config"
  sed -i 's/plugdev/video/g' 99-realsense-libusb.rules
  install -Dm644 99-realsense-libusb.rules "${pkgdir}/etc/udev/rules.d/99-realsense-libusb.rules"
}


package_python-pyrealsense2-git() {
  depends=("python" "librealsense")
  provides=('python-pyrealsense2')
  conflicts=('python-pyrealsense2')
  cd "${srcdir}/${_pkgname}/wrappers/python"
  python find_librs_version.py "${srcdir}/${_pkgname}" pyrealsense2
  cp -L ${srcdir}/${_pkgname}/build/wrappers/python/*.so pyrealsense2
  python setup.py install --root="${pkgdir}/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/${_pkgname}2
  find "${pkgdir}/usr/bin" -type f -print0 | xargs -0 mv -t "${pkgdir}/usr/share/${_pkgname}2" # move python examples
  rmdir "${pkgdir}/usr/bin"
}
