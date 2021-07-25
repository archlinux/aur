# Maintainer: Wilhelm Schuster <aur [aT] rot 13 doT io>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=prusa-slicer-gtk2
pkgver=2.3.3
pkgrel=1
pkgdesc="G-code generator for 3D printers (built with GTK2)"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/prusa3d/PrusaSlicer"
license=(AGPL3)
depends=(boost-libs curl glew intel-tbb nlopt wxgtk2 qhull openvdb cgal)
makedepends=(cmake boost cereal eigen expat gtest libpng systemd)
replaces=(slic3r-prusa3d)
conflicts=('prusa-slicer')
source=(${url}/archive/version_${pkgver}/${pkgname}-${pkgver}.tar.gz
        prusa-slicer-openexr3.patch)
sha256sums=('deda209505f740ac3d6f59cb2a960f4df908269ee09bd30cd4edb9fc472d29ac'
            '1ef7c22f641b7c18de212202c21f14f6533834a36d7fe0c2b322bc9a13804c6b')

prepare() {
  patch -d PrusaSlicer-version_${pkgver} -p1 < prusa-slicer-openexr3.patch # Fix build with openEXR 3
}

build() {
  cmake -B build -S PrusaSlicer-version_${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
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

  # Desktop files
  mv "${pkgdir}"/usr/share/{PrusaSlicer/,}applications

  # Desktop icons
  for i in 32 128 192 ; do
    mkdir -p "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/
    ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer_${i}px.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/PrusaSlicer.png
    ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer-gcodeviewer_${i}px.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/PrusaSlicer-gcodeviewer.png
  done
}
