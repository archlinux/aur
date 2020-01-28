# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=prusa-slicer
pkgver=2.1.1
pkgrel=2
pkgdesc="G-code generator for 3D printers (Prusa fork of Slic3r)"
arch=(x86_64)
url="https://github.com/prusa3d/PrusaSlicer"
license=(AGPL3)
depends=(boost-libs curl glew intel-tbb nlopt wxgtk2 qhull) #wxgtk3)
makedepends=(cmake boost cereal eigen3 expat gtest libpng)
replaces=(slic3r-prusa3d)
source=(${url}/archive/version_${pkgver}/${pkgname}-${pkgver}.tar.gz
        ${pkgname}.desktop)
sha256sums=('79d0681fbf3f4158cac25595522dcea330e0fa960934053ac929a15fa13c1072'
            'f7119c86968cf20e61caf784269c859fc84fae1e499c7c3df82d3d34ae4c2138')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../PrusaSlicer-version_${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSLIC3R_FHS=ON \
    -DSLIC3R_PCH=OFF \
    -DSLIC3R_WX_STABLE=ON #\
    #-DSLIC3R_GTK=3 \
    #-DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3
  make
}

check() {
  cd build
  ctest -v
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  cd ..
  # Desktop file
  install -Dm644 ${pkgname}.desktop -t "${pkgdir}"/usr/share/applications/

  # Desktop icons
  for i in 32 128 192 ; do
    mkdir -p "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/
    ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer_${i}px.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png
  done
}
