# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=jellyfin-tui
pkgver=1.2.3
pkgrel=1
pkgdesc='Music streaming TUI client for Jellyfin'
arch=('x86_64')
url="https://github.com/dhonus/$pkgname"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a0c4c5d132c45d499c1f394696f8b12ad9e9166a5a4f2cbf5eac7f9101817b3d')
depends=('openssl' 'mpv' 'gcc-libs' 'glibc' 'sqlite')
makedepends=('cargo' 'pkgconf' 'sqlite')

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
}

# vim: ts=2 sw=2 et:
