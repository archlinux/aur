# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sequoia-wot
pkgver=0.3.0
pkgrel=1
pkgdesc="An implementation of OpenPGP's web of trust"
arch=(x86_64)
url="https://gitlab.com/sequoia-pgp/sequoia-wot"
license=(GPL2)
depends=(gcc-libs glibc gmp)
makedepends=(bzip2 cargo clang nettle)
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('17917f47d300b1c2534800f6ec95055139f5f5f505d9183ba0dc43b6d08205864cf7d3df36fa7d4a077df7f421874190b6503cf56d0e364c176f19084d9b9535')
b2sums=('a0a007768f14b0ef4c75a15e55f6ca1470ef3f573f3f8b1b7b7a91587fae893778be8543f8b4456c45f01c723a5f2142c758e195c788e6b1f6293f0e048eb4b0')

prepare() {
  cd $pkgname-v$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-v$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features --features sequoia-openpgp/crypto-nettle
}

check() {
  cd $pkgname-v$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features --features sequoia-openpgp/crypto-nettle
}

package() {
  depends+=(libbz2.so libhogweed.so libnettle.so)

  cd $pkgname-v$pkgver
  install -vDm 755 target/release/sq-wot -t "$pkgdir/usr/bin/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
