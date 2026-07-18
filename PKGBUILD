# Maintainer: Sergey A. <murlakatamenka@disroot.org>
#
# ex-maintainer: ceri <ceri@dev.null>
#
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164

pkgname=apkeep
pkgver=1.0.0
pkgrel=1
pkgdesc='CLI tool from EFF for downloading APK files from various sources'
url='https://github.com/EFForg/apkeep'
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('MIT')
depends=('openssl' 'gcc-libs')
makedepends=('cargo')
options=('!lto')
sha256sums=('0c7a9c84b5dff12c356b22878e4f88ff3f1b44500ff80436c9e64cee17146388')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 target/release/apkeep -t "$pkgdir/usr/bin"

  install -Dm 644 README.md USAGE-fdroid.md USAGE-google-play.md \
    -t "$pkgdir/usr/share/doc/$pkgname"

  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
