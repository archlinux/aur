# Maintainer: d10n <david at bitinvert dot com>

pkgname=mullvad-tui
pkgver=0.10.1
pkgrel=1
_upstream_ref=dc6607c9452b50ca6ee51faedc0ebc7fe07f86cf
pkgdesc='Terminal user interface for mullvad-vpn'
arch=(x86_64)
url=https://github.com/d10n/mullvad-tui
license=(GPL-3.0-or-later)
depends=(mullvad-vpn)
makedepends=(cargo protobuf)
options=(!lto !debug)
source=(
    "mullvad-tui-v$pkgver.tar.gz::https://github.com/d10n/mullvad-tui/archive/refs/tags/v$pkgver.tar.gz"
    "mullvadvpn-app-$_upstream_ref.tar.gz::https://github.com/mullvad/mullvadvpn-app/archive/$_upstream_ref.tar.gz"
)
sha256sums=('ccb23cc30994c4d3a9ee0e79c005083aaba3848148d23313ea18058d9947e067'
            '1075deb7b5497fc63658314c5557e30157353d12e300b932327cf9b54f984214')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  rm -rf "mullvadvpn-app"
  ln -sf "../mullvadvpn-app-$_upstream_ref" mullvadvpn-app
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # Stop mullvad-version's build script from walking up to the aur package repo
  export GIT_CEILING_DIRECTORIES="$srcdir"
  cargo build --frozen --release -p mullvad-tui
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  # Stop mullvad-version's build script from walking up to the aur package repo
  export GIT_CEILING_DIRECTORIES="$srcdir"
  cargo test --frozen --release --all-targets
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 target/release/mullvad-tui "$pkgdir/usr/bin/mullvad-tui"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 AUTHORS "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
}

