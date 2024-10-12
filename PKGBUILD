# Maintainer: Sergey A. <murlakatamenka@disroot.org>

# ex-maintainer: ceri <ceri@dev.null>

pkgname=apkeep
pkgver=0.17.0
pkgrel=1
pkgdesc='CLI tool from EFF for downloading APK files from various sources'
url='https://github.com/EFForg/apkeep'
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
arch=('i686' 'x86_64' 'arm' 'armv7h' 'aarch64')
license=('MIT')
depends=('openssl' 'gcc-libs')
makedepends=('cargo' 'mold')
sha256sums=('f5fa0d8c02d5c078f69ec18e080463113c3794be8b94130f6a81f463c36bca0b')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  export RUSTFLAGS="$RUSTFLAGS \
    -C link-arg=-fuse-ld=mold"

  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 target/release/apkeep -t "$pkgdir/usr/bin"

  install -Dm 644 README.md USAGE-fdroid.md USAGE-google-play.md \
    -t "$pkgdir/usr/share/doc/$pkgname"

  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
