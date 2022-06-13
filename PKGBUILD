# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=prusa-slicer
pkgver=2.4.2
pkgrel=3
pkgdesc="G-code generator for 3D printers (Prusa fork of Slic3r)"
arch=(x86_64)
url="https://github.com/prusa3d/PrusaSlicer"
license=(AGPL3)
depends=(boost-libs curl glew intel-tbb mpfr nlopt wxgtk3 qhull openvdb)
makedepends=(cmake boost cereal cgal eigen expat gtest libpng systemd)
checkdepends=(catch2)
replaces=(slic3r-prusa3d)
source=(${url}/archive/version_${pkgver}/${pkgname}-${pkgver}.tar.gz
        ${pkgname}-fix-lcereal-p1.patch::${url}/commit/0ffcfd8393457fd035576436752267c9a1e6bbcc.patch
        ${pkgname}-fix-lcereal-p2.patch::${url}/commit/cc788ebb643b6d4048f3550235ac3e9d3697ada0.patch
        ${pkgname}-boost-1.79-p1.patch::${url}/commit/408e56f0390f20aaf793e0aa0c70c4d9544401d4.patch
        ${pkgname}-boost-1.79-p2.patch::${url}/commit/926ae0471800abd1e5335e251a5934570eb8f6ff.patch
        ${pkgname}-boost-1.79-p3.patch::${url}/commit/436a454b2e5dc823c6a878b836f82f56922e8834.patch
        use-system-catch2.patch)
sha256sums=('ac3a77212260e8d0baf9df027c29e0ae965bc77f371e59fd27b8fe103ebb1f23'
            'e110c3ca7cd8034f878b22e4992c442cc200a7c001d570dc2c9eef8a6af41786'
            'eb5bce1cb5b3970a1aa92fd9b7fe1943da4d7bb2c9908890811090914fef91c4'
            'a1cddcfb276f2da60cd91226e09ba9869b861cab3108425c9d5c1851e8009e41'
            'c84babe994db99856abdc62be65f7cd1ff546bebffd928c0b79a434952ec4a6d'
            '0158f5e22face6174992e9d4bfbf90ca8d79100fdc230f5540c6f01d1bebf6a0'
            '3639dc2d290dc9a7d16259e0b421f8d21f16fb4abe46bbb3fab9328930fc5758')

prepare() {
  cd PrusaSlicer-version_${pkgver}
  patch -p1 < ../use-system-catch2.patch # Borrowed from Debian
  patch -p1 < ../${pkgname}-fix-lcereal-p1.patch
  patch -p1 < ../${pkgname}-fix-lcereal-p2.patch
  patch -p1 < ../${pkgname}-boost-1.79-p1.patch
  patch -p1 < ../${pkgname}-boost-1.79-p2.patch
  patch -p1 < ../${pkgname}-boost-1.79-p3.patch || :
}

build() {
  cmake -B build -S PrusaSlicer-version_${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DOPENVDB_FIND_MODULE_PATH=/usr/lib/cmake/OpenVDB \
    -DSLIC3R_FHS=ON \
    -DSLIC3R_PCH=OFF \
    -DSLIC3R_WX_STABLE=ON \
    -DSLIC3R_GTK=3 \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3
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
