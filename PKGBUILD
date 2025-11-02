# Maintainer: Sergey A. <murlakatamenka@disroot.org>
#
# ex-maintainer: ceri <ceri@dev.null>
#
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164

pkgname=apkeep
pkgver=0.18.0
pkgrel=1
pkgdesc='CLI tool from EFF for downloading APK files from various sources'
url='https://github.com/EFForg/apkeep'
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
arch=('i686' 'x86_64' 'arm' 'armv7h' 'aarch64')
license=('MIT')
depends=('openssl' 'gcc-libs')
makedepends=('cargo')
sha256sums=('627f2382c3c849cbf872c512cf5f7293d31714b630afdf531ec8a9263bea207e')

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
