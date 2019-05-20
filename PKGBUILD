# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=prusa-slicer
pkgver=2.0.0
pkgrel=1
pkgdesc="G-code generator for 3D printers (Prusa fork of Slic3r)"
arch=(x86_64)
url="https://github.com/prusa3d/PrusaSlicer"
license=(AGPL3)
depends=(boost-libs curl glew intel-tbb nlopt wxgtk2) #wxgtk3)
makedepends=(cmake boost eigen3 expat qhull gtest libpng)
replaces=(slic3r-prusa3d)
source=("${url}/archive/version_${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('5d3c7fd745f2875be55f316cd779805ce1b6ce38634f0f4b0ccd01884da731b3'
            'fa469696bd85fef60a0f626d47d2da192902c627a9c80cc34325d47ab5d0172e')

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
