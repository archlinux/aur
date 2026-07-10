# Maintainer: Ramazan Berk Şirin <ramazanberksirin@protonmail.com>
pkgname=open-chess
pkgver=1.1.0
pkgrel=1
pkgdesc="Open Chess with variants, AI, LAN multiplayer and puzzles (Flutter + Rust)"
arch=('x86_64')
url="https://github.com/RamazanBerk20/open-chess"
license=('MIT')
depends=('gtk3')
makedepends=('flutter' 'rust' 'clang' 'cmake' 'ninja' 'pkgconf' 'git')
provides=('chess')
conflicts=('chess' 'chess-bin' 'chess-git' 'open-chess-bin' 'open-chess-git')
replaces=('chess')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export PUB_CACHE="$srcdir/.pub-cache"
  flutter config --enable-linux-desktop --no-analytics
  flutter pub get
  flutter build linux --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  local bundle="build/linux/x64/release/bundle"
  install -dm755 "$pkgdir/opt/open-chess"
  cp -dr --no-preserve=ownership "$bundle"/. "$pkgdir/opt/open-chess/"
  chmod 755 "$pkgdir/opt/open-chess/open-chess"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/open-chess/open-chess "$pkgdir/usr/bin/open-chess"
  install -Dm644 assets/icon/open-chess.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/open-chess.png"
  install -Dm644 installers/linux/open-chess.desktop \
    "$pkgdir/usr/share/applications/open-chess.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
