# Maintainer: Christopher Reimer <mail+aur[at]c-reimer[dot]de>
# Contributor: Swift Geek <swifgeek ɐ google m č0m>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: olasd

pkgname=prusaslicer
pkgver=2.0.0_rc2
_pkgver=$(tr _ - <<< $pkgver)
pkgrel=1
pkgdesc="Takes 3D models (STL, OBJ, AMF) and converts them into G-code instructions for FFF printers or PNG layers for mSLA 3D printers"
arch=('i686' 'x86_64')
url="https://github.com/prusa3d/PrusaSlicer"
license=('AGPL3')
depends=('boost-libs' 'curl' 'glew' 'intel-tbb' 'nlopt' 'wxgtk2')
makedepends=('boost' 'cmake' 'git' 'gtest' 'wxgtk2')
replaces=('slic3r-prusa3d' 'slic3r-prusa3d-git' 'prusaslicer-git')
conflicts=('slic3r-prusa3d' 'slic3r-prusa3d-git' 'prusaslicer-git')
source=("git+https://github.com/prusa3d/PrusaSlicer.git#tag=version_${_pkgver}"
        'prusa-slicer.desktop')
md5sums=('SKIP'
         'd3f87e380d2e93a63aa7a7afc2ddf54d')

prepare() {
  cd "${srcdir}/PrusaSlicer"
  mkdir -p build
}

build() {
  cd "${srcdir}/PrusaSlicer"

  cd build
  cmake -DSLIC3R_STATIC=0 \
        -DSLIC3R_FHS=1 \
        -DSLIC3R_WX_STABLE=1 \
        -DSLIC3R_GTK=2 \
        -DSLIC3R_PCH=0 \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        ..
  make
}

check() {
  cd "${srcdir}/PrusaSlicer/build"
  ctest -V
}

package () {
  cd "$srcdir/PrusaSlicer/build"
  make DESTDIR="$pkgdir" install

  cd "${srcdir}/PrusaSlicer"

  # Desktop file
  install -d "$pkgdir/usr/share/applications"
  install -m 644 "$srcdir/prusa-slicer.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

  # Desktop icon
  mkdir -p "$pkgdir/usr/share/icons/hicolor/"{32x32,128x128,192x192}/apps/
  ln -s "/usr/share/PrusaSlicer/icons/PrusaSlicer_32px.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  ln -s "/usr/share/PrusaSlicer/icons/PrusaSlicer_128px.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  ln -s "/usr/share/PrusaSlicer/icons/PrusaSlicer_192px.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/${pkgname}.png"
}
