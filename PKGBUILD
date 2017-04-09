# shellcheck disable=SC2034,SC2154
# Maintainer: Jan Hicken <jan.hicken@posteo.de>
pkgname=redtimer-git
_gitroot=fathomssen
_gitname=redtimer
pkgver=v1.2.1.pre6
pkgrel=1
pkgdesc="RedTimer is an easy-to-use platform-independent time tracker which allows the user to track time while working on an issue"
arch=(i686 x86_64)
url="https://github.com/fathomssen/redtimer"
license=('LGPL')
depends=('hicolor-icon-theme' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-x11extras')
makedepends=('git')
source=("git+https://github.com/$_gitroot/$_gitname.git"
        "${_gitname}.desktop")
sha256sums=('SKIP'
            '3cbea017afa71e4bb21a941b01ce6e558897a974fefbdb7f8382a6bd3bf4194b')

pkgver() {
  cd "$_gitname" || exit
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_gitname" || exit
  git submodule update --init
}

build() {
  cd "$_gitname" || exit

  qmake -r
  make
}

package() {
  install -Dm0644 "${_gitname}.desktop" "${pkgdir}/usr/share/applications/${_gitname}.desktop"

  cd "$_gitname" || exit

  install -Dm0644 "gui/icons/clock_red.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_gitname}.svg"
  install -D "cli/redtimercli" "${pkgdir}/usr/bin/redtimercli"
  install -D "gui/redtimer" "${pkgdir}/usr/bin/redtimer"
}

# vim:set ts=2 sw=2 et:
