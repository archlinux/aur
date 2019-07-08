# Maintainer: Salamandar <felix@piedallu.me>

_pkgname=prusa-slicer

pkgname=${_pkgname}-git
pkgver=2.0.0.r336.gf617d7472
pkgrel=1
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=('i686' 'x86_64' 'armv6' 'armv6h' 'armv7h')
url="https://github.com/prusa3d/PrusaSlicer"
license=('AGPL3')
depends=('boost-libs' 'curl' 'glew' 'intel-tbb' 'nlopt' 'wxgtk2')
makedepends=('boost' 'cmake' 'gtest')
source=(
  "git+https://github.com/prusa3d/PrusaSlicer.git"
  'prusa-slicer.desktop'
)
sha256sums=(
  'SKIP'
  '26b66701cb2512f0d524add44689e2478c0b875f73103034e74544a9574782c5'
)

conflicts=('slic3r-prusa3d-git' 'slic3r-prusa3d' 'slic3r' 'prusa-slicer')
replaces=( 'slic3r-prusa3d-git' 'prusaslicer-git')

pkgver() {
  cd "${srcdir}/PrusaSlicer"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^version_//'
}

build() {
  cd "${srcdir}/PrusaSlicer"
  mkdir -p build

  cd build
  cmake ..\
    -DSLIC3R_STATIC=0 \
    -DSLIC3R_FHS=1 \
    -DSLIC3R_WX_STABLE=1 \
    -DSLIC3R_GTK=3 \
    -DSLIC3R_PCH=0 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib

  make
}

check() {
  cd "${srcdir}/PrusaSlicer/build"
  ctest -V
}

package () {
  cd "${srcdir}/PrusaSlicer/build"
  make DESTDIR="${pkgdir}" install

  # Desktop file
  install -d "$pkgdir/usr/share/applications"
  install -m 644 "${srcdir}/prusa-slicer.desktop" "${pkgdir}/usr/share/applications"

  # Desktop icon
  install -d "${pkgdir}/usr/share/icons/hicolor/"{32x32,128x128,192x192}"/apps/"
  ln -s "/usr/share/PrusaSlicer/icons/PrusaSlicer_32px.png"  "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
  ln -s "/usr/share/PrusaSlicer/icons/PrusaSlicer_128px.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  ln -s "/usr/share/PrusaSlicer/icons/PrusaSlicer_192px.png" "${pkgdir}/usr/share/icons/hicolor/192x192/apps/${_pkgname}.png"
}
