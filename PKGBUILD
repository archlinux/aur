# Maintainer: Salamandar <felix@piedallu.me>

_pkgname=prusaslicer
pkgname=${_pkgname}-git
pkgver=2.0.0
pkgrel=1
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=('i686' 'x86_64' 'armv6' 'armv6h' 'armv7h')
url="http://www.prusa3d.com/"
license=('AGPL3')
depends=(
  'boost-libs' 'curl' 'wxgtk2' 'glew' 'intel-tbb' 'nlopt'
)
makedepends=(
  'cmake' 'boost'
)
checkdepends=(
  'gtest'
)
source=(
  "git+https://github.com/prusa3d/PrusaSlicer.git"
  'prusaslicer.desktop'
)
sha256sums=(
  'SKIP'
  '8787e62d32e6460d92076ffe9366cd1c55e5703d220398e7f4ab1146d67f81d1'
)

conflicts=('slic3r-prusa3d-git' 'slic3r-prusa3d' 'slic3r' 'prusaslicer')
replaces=( 'slic3r-prusa3d-git')

pkgver() {
  cd "${srcdir}/PrusaSlicer"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^version_//'
}

build() {
  cd "${srcdir}/PrusaSlicer"
  mkdir -p build

  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSLIC3R_FHS=True \
    -DSLIC3R_PCH=False \
    -DSLIC3R_WX_STABLE=True \
    ..

  make
}

check() {
  cd "${srcdir}/PrusaSlicer/build"
  ctest -V
}

package () {
  cd "${srcdir}/PrusaSlicer/build"
  DESTDIR="${pkgdir}" make install

  # Desktop file
  install -Dm 644 "${srcdir}/prusaslicer.desktop" -t "${pkgdir}/usr/share/applications"

  # Desktop icon
  install -d "${pkgdir}/usr/share/icons/hicolor/"{128x128,192x192}"/apps/"
  ln -s "/usr/share/PrusaSlicer/icons/PrusaSlicer_128px.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  ln -s "/usr/share/PrusaSlicer/icons/PrusaSlicer_192px.png" "${pkgdir}/usr/share/icons/hicolor/192x192/apps/${_pkgname}.png"
}
