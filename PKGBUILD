# Maintainer: Andrej Halveland (SnipeX_ / SnipeX) <andrej.halv@gmail.com>
#
# Based on the AUR package by:
# Maintainer: Dušan Mitrović <dusan@dusanmitrovic.xyz>

pkgname=supersonic-desktop-git
pkgver=v0.8.2.r51.gee275cb
pkgrel=1
pkgdesc="A lightweight cross-platform desktop client for Subsonic music servers"
_pkgname="supersonic-desktop"
_appname="supersonic"
arch=('x86_64')
url="https://github.com/dweymouth/supersonic"
license=('GPL3')
depends=(
    'glibc'
    'libglvnd'
    'libx11'
    'mpv'
)
optdepends=(
    "libappindicator-gtk3: Systray indicator support"
    "org.freedesktop.secrets: Keyring password store support"
)
makedepends=('go>=1.17' 'git')
provides=('supersonic-desktop')
conflicts=('supersonic-desktop')
source=(
    "git+${url}.git"
)
sha256sums=(
    "SKIP"
)

pkgver() {
  cd "$_appname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH="$srcdir"/gopath

  cd "$srcdir/${_appname}"

  go build -mod=readonly -modcacherw .
}

package() {
  cd "$srcdir/${_appname}"
  _output="${srcdir}/${_appname}"

  install -Dm755 "${_output}/${_appname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "$srcdir/${_appname}/res/appicon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "$srcdir/${_appname}/res/${_appname}-desktop.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
}
