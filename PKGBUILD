# Maintainer: Salamandar <felix@piedallu.me>
# Contributor: Christopher Reimer <mail+aur[at]c-reimer[dot]de>
# Contributor: Swift Geek <swifgeek ɐ google m č0m>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: olasd

_pkgname=slic3r-prusa3d
pkgname=${_pkgname}-git
pkgver=1.42.0.alpha7.r95.gc77d15c98
pkgrel=1
pkgdesc="Updated Slic3r by Prusa3D with many bugfixes and new features"
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

conflicts=('slic3r-prusa3d' 'slic3r')
source=(
  "git+https://github.com/prusa3d/Slic3r.git"
  'slic3r_prusa3d.desktop'
)
sha256sums=(
  'SKIP'
  '598e84a1a837059929477ce9d45e1e660be51e69202f788f83c6f65437055db5'
)

pkgver() {
  cd "${srcdir}/Slic3r"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^version_//'
}

build() {
  cd "${srcdir}/Slic3r"
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
  cd "${srcdir}/Slic3r/build"
  ctest -V
}

package () {
  cd "${srcdir}/Slic3r/build"
  DESTDIR="${pkgdir}" make install

  # ZSH autocompletion
  # install -Dm 0644 "utils/zsh/functions/_slic3r" "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"

  # Desktop file
  install -Dm 644 "${srcdir}/slic3r_prusa3d.desktop" -t "${pkgdir}/usr/share/applications"

  # Desktop icon
  install -d "${pkgdir}/usr/share/icons/hicolor/"{128x128,192x192}"/apps/"
  ln -s "/usr/share/${_pkgname}/icons/Slic3r_128px.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  ln -s "/usr/share/${_pkgname}/icons/Slic3r_192px.png" "${pkgdir}/usr/share/icons/hicolor/192x192/apps/${_pkgname}.png"
}
