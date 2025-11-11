# Maintainer: Vadim Yanitskiy <axilirator@gmail.com>
# Contributor: Robin Nehls <aur@manol.is>

pkgname=gr-fosphor-git
pkgver=r179.74d54fc
pkgrel=3
pkgdesc="GNU Radio block for RTSA-like spectrum visualization using OpenCL and OpenGL acceleration"
arch=('any')
url="https://osmocom.org/projects/sdr/wiki/fosphor"
license=('GPL-3.0-or-later')
depends=('gnuradio' 'pybind11' 'boost-libs' 'glfw' 'ocl-icd' 'freetype2')
makedepends=('git' 'cmake' 'boost' 'opencl-headers')
provides=("${pkgname%-git}=${pkgver}"
          'libgnuradio-fosphor.so=3.9.0git-64')
source=('git+https://gitea.osmocom.org/sdr/gr-fosphor.git'
        '0001-CMakeLists.txt-fix-building-with-new-boost.patch')
sha256sums=('SKIP'
            'f596c8a233f34d7645c8c2dc56c4b88310a25eb3e78e0b8f71c3b547c5d2bdc4')

prepare() {
  cd "${pkgname%-git}"
  patch -p1 < ${srcdir}/0001-CMakeLists.txt-fix-building-with-new-boost.patch
}

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${pkgname%-git}/build"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
