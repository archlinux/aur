# Maintainer: Ramazan Berk Şirin <ramazanberksirin@protonmail.com>
pkgname=chess-git
pkgver=1.0.1.r0.g0000000
pkgrel=1
pkgdesc="Chess with variants (Fog of War, Bughouse, 4-player, Crazyhouse, Atomic…), AI, LAN and puzzles — Flutter + Rust (latest git)"
arch=('x86_64')
url="https://github.com/RamazanBerk20/chess"
license=('MIT')
depends=('gtk3')
makedepends=('flutter' 'rust' 'clang' 'cmake' 'ninja' 'pkgconf' 'git')
provides=('chess')
conflicts=('chess' 'chess-bin')
options=('!strip' '!debug')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  export PUB_CACHE="$srcdir/.pub-cache"
  flutter config --enable-linux-desktop --no-analytics
  flutter pub get
  flutter build linux --release
}

package() {
  cd "$srcdir/$pkgname"
  local bundle="build/linux/x64/release/bundle"
  install -dm755 "$pkgdir/opt/chess"
  cp -dr --no-preserve=ownership "$bundle"/. "$pkgdir/opt/chess/"
  chmod 755 "$pkgdir/opt/chess/chess"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/chess/chess "$pkgdir/usr/bin/chess"
  install -Dm644 assets/icon/chess.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/chess.png"
  install -Dm644 installers/linux/chess.desktop \
    "$pkgdir/usr/share/applications/chess.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
