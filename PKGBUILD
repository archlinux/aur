# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dimitris Kiziridis <dkiziridis at outlook dot com>
pkgname=blackbox-terminal
pkgver=0.14.0
pkgrel=2
pkgdesc="A beautiful GTK 4 terminal"
arch=('x86_64')
url="https://gitlab.gnome.org/raggesilver/blackbox"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'libgee'
  'libpqmarble'
  'vte4'
)
makedepends=(
  'meson'
  'vala'
)
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/blackbox-v$pkgver.tar.gz"
        'gcc-14.patch')
sha256sums=('0a8b76666ac71a6dc9e05b8084e1c6c53cda880ad1f8f778d9d5de9a6644ad0d'
            '4e8e8787ad11a38cd712adb4b1106e331c8495ac6fa709032f5574172ad5ee71')

prepare() {
  cd "blackbox-v$pkgver"

  # https://gitlab.gnome.org/raggesilver/blackbox/-/merge_requests/143
  patch -Np1 -i ../gcc-14.patch
}

build() {
  arch-meson "blackbox-v$pkgver" build \
    -Dblackbox_is_flatpak=false
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
