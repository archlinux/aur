# Maintainer: 0xMRTT <0xMRTT at proton dot com >

pkgname=desktop-creator-git
_pkgname=DesktopCreator
pkgver=r6.f09da44
pkgrel=2
pkgdesc="Create .desktop files with ease"
arch=('x86_64')
url="https://github.com/DesktopCreatorTeam/DesktopCreator"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'libportal-gtk4')
makedepends=('git' 'meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" desktop-creator-git)
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${_pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
