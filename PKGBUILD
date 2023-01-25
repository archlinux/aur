# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sequoia-wot
pkgver=0.4.1
pkgrel=1
pkgdesc="An implementation of OpenPGP's web of trust"
arch=(x86_64)
url="https://gitlab.com/sequoia-pgp/sequoia-wot"
license=(GPL2)
depends=(gcc-libs glibc gmp)
makedepends=(bzip2 cargo clang nettle openssl)
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('a772bd41f517640b9ca1dca4091ce3ac7bfb33f084be6e951d5f54b8c0f6e1345be09894d1093b8db182051710aa08eecc43521bf06b9bff7abec237772506ee')
b2sums=('c90f61ff2445b1b279e52129b97520e907a3aae8024608cbb71ba2764fb148ab368892f224d03164b330fb32097e2c45216663ce8c421d9887ace44aa9221eb0')

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
  depends+=(
    bzip2 libbz2.so
    nettle libhogweed.so libnettle.so
    openssl libcrypto.so libssl.so
  )

  cd $pkgname-v$pkgver
  install -vDm 755 target/release/sq-wot -t "$pkgdir/usr/bin/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
