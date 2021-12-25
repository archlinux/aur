# Maintainer: Your Name <youremail@domain.com>

pkgname=gnome-console-git
_pkgname=console
pkgver=0.4.0.r40.g7f370f4
pkgrel=2
pkgdesc="A simple user-friendly terminal emulator for the GNOME desktop"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/console"
license=('GPL3')
depends=('libgtop' 'libhandy-git' 'vte3')
makedepends=('git' 'meson' 'sassc')
optdepends=('libnautilus-extension')
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
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
