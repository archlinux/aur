# Maintainer: Kirill Petrov AKA Hammerill <kyrylo@hammerill.com>

pkgname=gnome-console-alt-shortcuts-git
_pkgname=console-alt-shortcuts
pkgver=47.0.r53.g1115364
pkgrel=1
pkgdesc="A simple user-friendly terminal emulator for the GNOME desktop with Alt-based shortcuts instead of Shift+Ctrl"
arch=('x86_64')
url="https://gitlab.gnome.org/hammerill/console-alt-shortcuts"
license=('GPL3')
depends=('libgtop' 'libadwaita>=1:1.2.0' 'vte4')
makedepends=('git' 'meson' 'sassc' 'libnautilus-extension')
checkdepends=('appstream-glib')
provides=("${pkgname%-alt-shortcuts-git}")
conflicts=('kgx-git' 'gnome-console' 'gnome-console-git')
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
