# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Famiu Haque <famiuhaque@gmail.com>

_name=piskel
pkgname="${_name}-git"
pkgver=0.15.0.r239.8b31df02
pkgrel=1
pkgdesc="A free online editor for animated sprites & pixel art (bleeding-edge version, uses system-wide NW.js)"
arch=('x86_64')
url="https://github.com/piskelapp/${_name}"
license=('Apache-2.0')
depends=('nwjs' 'hicolor-icon-theme')
makedepends=('git' 'npm' 'rsync')
provides=("${_name}")
conflicts=("${_name}")
options=(!strip)

source=(
  "${_name}::git+$url.git#branch=master"
  'icons.tar.gz'
  "${_name}.sh"
  'Piskel.desktop'
)
sha256sums=('SKIP'
            '69f7036d78072f3724e9dc11dd0df663ede6343982754a3ecd2684fd6343f468'
            '06174fd6c449e247a410a072ea9d5fa075e659d794a9f17174fae5b7199038eb'
            '0dba7d41b950b921406567ca64f154b1830896f91f5f09d2d5230c080b9655b6')

pkgver() {
  cd "$srcdir/${_name}"
  git describe --tags --long | sed "s/^v//g; s/\-/.r/;s/\-g/./"
}

prepare() {
  cd "$srcdir/${_name}"
  npm install --cache "${srcdir}/npm-cache"
}

build() {
  cd "$srcdir/${_name}"
  npm run build
}

package() {
  cd "$srcdir"

  install -dm644 "${pkgdir}/usr/share/${_name}"
  rsync -a --exclude ".git" "${_name}/" "${pkgdir}/usr/share/${_name}"

  install -Dm755 "${_name}.sh" "${pkgdir}/usr/bin/${_name}"
  install -Dm755 "Piskel.desktop" "${pkgdir}/usr/share/applications/Piskel.desktop"

  for size in 16 22 32 48 64 128 256 512; do
    local icon_folder="icons/hicolor/${size}x${size}"
    install -Dm644 "${_name}_${size}.png" "${pkgdir}/usr/share/${icon_folder}/apps/${_name}.png"
  done
}

