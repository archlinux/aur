# Maintainer: Wilhelm Schuster <aur [aT] rot 13 doT io>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=prusa-slicer-gtk2
pkgver=2.4.0
pkgrel=2
pkgdesc="G-code generator for 3D printers (built with GTK2)"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/prusa3d/PrusaSlicer"
license=(AGPL3)
depends=(boost-libs curl glew tbb nlopt wxgtk2 qhull openvdb cgal imath)
makedepends=(cmake boost cereal eigen expat gtest libpng systemd)
replaces=(slic3r-prusa3d)
conflicts=('prusa-slicer')
source=(${url}/archive/version_${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('906d0acf0d0e064ae3cbaa16ba1a2e24dd9c32ceb2121464cb4d5951c09e66c2')

build() {
  cmake -B build -S PrusaSlicer-version_${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DOPENVDB_FIND_MODULE_PATH=/usr/lib/cmake/OpenVDB \
    -DSLIC3R_FHS=ON \
    -DSLIC3R_PCH=OFF \
    -DSLIC3R_WX_STABLE=ON \
    #-DSLIC3R_GTK=3 \
    #-DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3
  make -C build
}

check() {
  cd build
  ctest -v
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
