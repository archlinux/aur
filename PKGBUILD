# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=warp
pkgver=0.4
pkgrel=1
pkgdesc="Fast and secure file transfer"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/warp"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo' 'itstool')
checkdepends=('appstream-glib')
conflicts=("$pkgname-share-files")
replaces=("$pkgname-share-files")
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('02592b403f30358c28e9a73120585f72c4ff687b2ec32d3b81b8ba10bd43a7dccde0ab340eebf7b49f17503db047900c33019225e06627c0b8355dbf043263b7')

prepare() {
  # Temporary solution to the issue: File name conflict
  # https://www.yesodweb.com/book/web-application-interface
  # https://bugs.archlinux.org/task/76026?project=5&string=haskell-wai-app-static
  cd "$pkgname-v$pkgver"
  sed -i 's|warp %u|warp-share %u|g' data/app.drey.Warp.desktop.in.in
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}
 
check() {
  meson test -C build --print-errorlogs || :
}
 
package() {
  meson install -C build --destdir "$pkgdir"
  
  mv "$pkgdir/usr/bin/warp" "$pkgdir/usr/bin/warp-share"
}
