# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=bless-cli
_name=bless
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI logging helper for repeated runs with metadata tracking"
arch=('x86_64')
options=(!lto)
url='https://github.com/HaoZeke/bless'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('bless')  # different software (hex editor); avoid PATH clash if both installed carefully
# Note: AUR "bless" is a hex editor; this package installs the binary as "bless"
source=("$_name-$pkgver.tar.gz::https://github.com/HaoZeke/bless/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ecab0bd5d792b7e33612761809e61c75ca24fe67e3c97693196f24acc32aa71d')

prepare() {
  cd "$_name-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" 2>/dev/null || cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_name-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --release
}

package() {
  cd "$_name-$pkgver"
  install -Dm755 target/release/bless "$pkgdir/usr/bin/bless"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/" 2>/dev/null || true
}
