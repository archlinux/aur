# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=ferriskey
pkgver=0.6.0
pkgrel=1
pkgdesc="open-source IAM solution designed for modern cloud-native environments, high-performance and written in Rust"
arch=("x86_64")
url="https://ferriskey.rs/"
license=("Apache-2.0")
depends=("glibc" "libgcc" "openssl")
makedepends=("cargo" "pnpm")
source=("https://github.com/ferriskey/ferriskey/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=("!lto" "!debug")

prepare() {
  cd $pkgname-$pkgver

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

  cd front/
  pnpm install --frozen-lockfile
}

build() {
  cd $pkgname-$pkgver

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --target "$CARCH-unknown-linux-gnu" --release

  cd front/
  pnpm run build
}

package() {
  for bin in ferriskey-api ferriskey-core ferriskey-operator; do
    install -Dm0755 $pkgname-$pkgver/target/$CARCH-unknown-linux-gnu/release/$bin "$pkgdir"/usr/bin/$bin
  done

  mkdir -p "$pkgdir"/usr/share/webapps/$pkgname
  cp -r $pkgname-$pkgver/front/dist/. "$pkgdir"/usr/share/webapps/$pkgname
}

sha256sums=('9d00ba0d69ce6a0508e18f06701b0472c2fd8cf8d896ee5bf92a92800454924c')
