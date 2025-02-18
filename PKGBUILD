# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=edgee
pkgver=0.8.2
pkgrel=1
pkgdesc='The full-stack edge platform for your edge oriented applications'
arch=('x86_64')
url='https://www.edgee.cloud'
license=('Apache-2.0')
depends=('openssl' 'bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/edgee-cloud/edgee/archive/v$pkgver.tar.gz")
sha256sums=('d841a127154309bcf2cf976c626980824e646eab3fc0c8b922447294d1ad8265')
b2sums=('09e02f81d2b68e2866e132afc4f57dd8902852ba2d55fee06a9ab0bc9d9c937050b6e663ff97fa8f71cee7667b70f65a430eff790d1249f60e295dcca7307d62')
options=('!lto')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR=target \
  cargo build --frozen --release --package edgee --bin edgee
}

check() {
  cd "$pkgname-$pkgver"

  RUSTFLAGS="$RUSTFLAGS -C debug-assertions" cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/edgee

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}
