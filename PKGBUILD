# Maintainer: Daniel Honus <aur@danielhonus.com>

pkgname=jellyfin-tui
pkgver=1.5.2
pkgrel=1
pkgdesc='Music streaming TUI client for Jellyfin'
arch=('x86_64')
url="https://github.com/dhonus/$pkgname"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6d419fb912c2fd7151eb2585dfaf9fdc8b4cdd89e921501212bbc20d56c0953a')
depends=('openssl' 'mpv' 'gcc-libs' 'glibc' 'sqlite')
makedepends=('cargo' 'pkgconf' 'sqlite')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"

  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export PKG_CONFIG_ALLOW_CROSS=1

  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 src/extra/jellyfin-tui.desktop \
    "$pkgdir/usr/share/applications/jellyfin-tui.desktop"
}

# vim: ts=2 sw=2 et:
