# Maintainer: d10n <david at bitinvert dot com>

pkgname=mullvad-tui
pkgver=0.8.1
pkgrel=1
_upstream_ref=47ef04e6afa863316c2e4f4e37cd6395758bf26f
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
sha256sums=('06e13b9d93287483f4a54cbc7a724dddbdbc1f526da539f35bd20e7221fd29d0'
            'fc7836c51415e112fd93fef160a4abe44ff99eb1cb2bf23a6b7a8124ed29151f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  rm -rf "mullvadvpn-app"
  ln -sf "../mullvadvpn-app-$_upstream_ref" mullvadvpn-app
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --frozen --release -p mullvad-tui
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --frozen --release --all-targets
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 target/release/mullvad-tui "$pkgdir/usr/bin/mullvad-tui"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 AUTHORS "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
}

