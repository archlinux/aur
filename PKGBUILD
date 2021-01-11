# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=prusa-slicer
pkgver=2.3.0
pkgrel=1
pkgdesc="G-code generator for 3D printers (Prusa fork of Slic3r)"
arch=(x86_64)
url="https://github.com/prusa3d/PrusaSlicer"
license=(AGPL3)
depends=(boost-libs curl glew intel-tbb nlopt wxgtk3 qhull openvdb cgal)
makedepends=(cmake boost cereal eigen expat gtest libpng systemd)
replaces=(slic3r-prusa3d)
source=(${url}/archive/version_${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('cd3bac5e29b5441fc4690f28cd7b1064e97dc00207bbdc88f7bd7832308d6ca5')

build() {
  cmake -B build -S PrusaSlicer-version_${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
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

  # Desktop files
  mv "${pkgdir}"/usr/share/{PrusaSlicer/,}applications

  # Desktop icons
  for i in 32 128 192 ; do
    mkdir -p "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/
    ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer_${i}px.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/PrusaSlicer.png
    ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer-gcodeviewer_${i}px.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/PrusaSlicer-gcodeviewer.png
  done
}
