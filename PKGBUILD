# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=prusa-slicer
pkgver=2.2.0
pkgrel=6
pkgdesc="G-code generator for 3D printers (Prusa fork of Slic3r)"
arch=(x86_64)
url="https://github.com/prusa3d/PrusaSlicer"
license=(AGPL3)
depends=(boost-libs curl glew intel-tbb nlopt wxgtk2 qhull openvdb cgal) #wxgtk3)
makedepends=(cmake boost cereal eigen expat gtest libpng systemd)
replaces=(slic3r-prusa3d)
source=(${url}/archive/version_${pkgver}/${pkgname}-${pkgver}.tar.gz
        ${pkgname}.desktop)
sha256sums=('e6e0c83bf92e448ec058fd3063b84caca69f58b8b419e48eace6e8ce534937c0'
            '9d21467c541b809f149b39c7c6b4f60b2c866823021fb6f8a076290583982d11')

build() {
  cmake -B build -S PrusaSlicer-version_${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSLIC3R_FHS=ON \
    -DSLIC3R_PCH=OFF \
    -DSLIC3R_WX_STABLE=ON #\
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

  # Desktop file
  install -Dm644 ${pkgname}.desktop -t "${pkgdir}"/usr/share/applications/

  # Desktop icons
  for i in 32 128 192 ; do
    mkdir -p "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/
    ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer_${i}px.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png
  done
}
