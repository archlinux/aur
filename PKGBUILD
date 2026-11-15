# Maintainer: Lu Xu <oliver_lew at outlook dot com>

pkgname=puzzle-timer-git
pkgver=0.4.0.r13.gd745f10
pkgrel=1
pkgdesc="Native GTK4/libadwaita speedcubing timer (git version)"
arch=('x86_64')
url="https://github.com/xlucn/puzzle-timer"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0')
makedepends=('rust' 'pkgconf' 'meson' 'git' 'gettext' 'blueprint-compiler')
provides=('puzzle-timer')
conflicts=('puzzle-timer')
source=("$pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags 2>/dev/null |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf 'r%s.%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  meson setup build --buildtype=release --prefix=/usr
  meson compile -C build
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" meson install -C build
}
