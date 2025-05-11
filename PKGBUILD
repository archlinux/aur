# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: yochananmarqos <github.com/yochananmarqos/pkgbuilds>

pkgname=ticketbooth
pkgver=1.2.0
pkgrel=1
pkgdesc='Keep track of your favorite shows'
url="https://github.com/aleiepure/ticketbooth"
arch=('x86_64' 'aarch64')
license=('CC0-1.0' 'LGPL-3.0-only' 'GPL-3.0-or-later')
depends=('libadwaita' 'python-gobject' 'python-pillow' 'python-tmdbsimple')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4a9bc32f424d1bdc2a5007cc40ccf44cf21b146d483a8f67db47cffb35054ab7')

prepare() {
  cd $pkgname-$pkgver
# Not a Flatpak
  sed -i 's/app\/bin/usr\/share\/ticketbooth/g' "install/$pkgname-run-script.in"
}

build() {
  arch-meson $pkgname-$pkgver build -Dprerelease=false
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
# Fix run script location
  cd "$pkgname-$pkgver"
  mv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/share/$pkgname/$pkgname-bin"
  mv "$pkgdir/usr/$pkgname/$pkgname-run-script" "$pkgdir/usr/bin/$pkgname"
  chmod 0755 "$pkgdir/usr/bin/$pkgname"
  rm -rf "$pkgdir/usr/$pkgname"
}
