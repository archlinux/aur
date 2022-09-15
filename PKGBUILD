# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-console-git
_pkgname=console
pkgver=43.rc.r12.g3df6390
pkgrel=1
pkgdesc="A simple user-friendly terminal emulator for the GNOME desktop"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/console"
license=('GPL3')
depends=('libgtop' 'libadwaita>=1:1.2.0' 'vte4')
makedepends=('git' 'meson' 'sassc' 'libnautilus-extension')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=('kgx-git' "${pkgname%-git}")
replaces=('kgx-git')
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
