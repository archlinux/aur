# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=prusa-slicer
pkgver=2.3.1
pkgrel=4
pkgdesc="G-code generator for 3D printers (Prusa fork of Slic3r)"
arch=(x86_64)
url="https://github.com/prusa3d/PrusaSlicer"
license=(AGPL3)
depends=(boost-libs curl glew intel-tbb nlopt wxgtk3 qhull openvdb cgal)
makedepends=(cmake boost cereal eigen expat gtest libpng systemd)
replaces=(slic3r-prusa3d)
source=(${url}/archive/version_${pkgver}/${pkgname}-${pkgver}.tar.gz
        prusa-slicer-gcc11.patch
        prusa-slicer-openexr3.patch)
sha256sums=('c1315826d07f428dfe4b9aa6325727beb1257aa6f711d1659a2760f8e213cd51'
            '1d394b12e0b8f597e5c19c3531621a7ccfd70216d997a77de24891c92a524170'
            '1ef7c22f641b7c18de212202c21f14f6533834a36d7fe0c2b322bc9a13804c6b')

prepare() {
  cd PrusaSlicer-version_${pkgver}
  patch -p1 < ../prusa-slicer-gcc11.patch # Add missing include for GCC 11
  patch -p1 < ../prusa-slicer-openexr3.patch # Fix build with openEXR 3
}

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
