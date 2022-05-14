# Maintainer: Wilhelm Schuster <aur [aT] rot 13 doT io>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=prusa-slicer-gtk2
pkgver=2.4.2
pkgrel=0
pkgdesc="G-code generator for 3D printers (built with GTK2)"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/prusa3d/PrusaSlicer"
license=(AGPL3)
depends=(boost-libs curl glew tbb mpfr nlopt wxgtk2 qhull openvdb)
makedepends=(cmake boost cereal cgal eigen expat gtest systemd libpng)
checkdepends=(catch2)
replaces=(slic3r-prusa3d)
conflicts=('prusa-slicer')
source=(${url}/archive/version_${pkgver}/${pkgname}-${pkgver}.tar.gz
        ${pkgname}-fix-lcereal-p1.patch::${url}/commit/0ffcfd8393457fd035576436752267c9a1e6bbcc.patch
        ${pkgname}-fix-lcereal-p2.patch::${url}/commit/cc788ebb643b6d4048f3550235ac3e9d3697ada0.patch
        use-system-catch2.patch)
sha256sums=('ac3a77212260e8d0baf9df027c29e0ae965bc77f371e59fd27b8fe103ebb1f23'
            'e110c3ca7cd8034f878b22e4992c442cc200a7c001d570dc2c9eef8a6af41786'
            'eb5bce1cb5b3970a1aa92fd9b7fe1943da4d7bb2c9908890811090914fef91c4'
            '3639dc2d290dc9a7d16259e0b421f8d21f16fb4abe46bbb3fab9328930fc5758')

prepare() {
  cd PrusaSlicer-version_${pkgver}

  patch -p1 < ../use-system-catch2.patch # Borrowed from Debian
  patch -p1 < ../${pkgname}-fix-lcereal-p1.patch
  patch -p1 < ../${pkgname}-fix-lcereal-p2.patch
}

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

  # Desktop icons
  mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
  ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/PrusaSlicer.svg
  ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer-gcodeviewer.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/PrusaSlicer-gcodeviewer.svg
}
