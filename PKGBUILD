# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=prusa-slicer
pkgver=2.0.0
pkgrel=2
pkgdesc="G-code generator for 3D printers (Prusa fork of Slic3r)"
arch=(x86_64)
url="https://github.com/prusa3d/PrusaSlicer"
license=(AGPL3)
depends=(boost-libs curl glew intel-tbb nlopt wxgtk2) #wxgtk3)
makedepends=(cmake boost eigen3 expat qhull gtest libpng)
replaces=(slic3r-prusa3d)
source=("${url}/archive/version_${pkgver}/${pkgname}-${pkgver}.tar.gz"
        prusa-slicer-mode-switching.patch::"https://github.com/prusa3d/PrusaSlicer/commit/5afd0b4ee28a18733dd8a0e4b4cfd612e60b452c.patch"
        "${pkgname}.desktop"
        prusa-slicer-boost-1.70.patch::"https://github.com/prusa3d/PrusaSlicer/commit/bfb135bc.patch")
sha256sums=('5d3c7fd745f2875be55f316cd779805ce1b6ce38634f0f4b0ccd01884da731b3'
            'e2f7b9865b24746a24d87d69eba72d8bf2de899466cf5731fa3cb446b8979e75'
            'f7119c86968cf20e61caf784269c859fc84fae1e499c7c3df82d3d34ae4c2138'
            '3831b27f2e916606ff88bb727e22ff68a956bad3ac402fb7a814232d63530419')

prepare() {
  mkdir -p build
  cd PrusaSlicer-version_${pkgver}
  patch -p1 -i ../prusa-slicer-mode-switching.patch
  patch -p1 -i ../prusa-slicer-boost-1.70.patch # Fix build with boost 1.70
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
