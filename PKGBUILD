# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sequoia-wot
pkgver=0.5.0
pkgrel=1
pkgdesc="An implementation of OpenPGP's web of trust"
arch=(x86_64)
url="https://gitlab.com/sequoia-pgp/sequoia-wot"
license=(GPL2)
depends=(gcc-libs glibc gmp)
makedepends=(bzip2 cargo clang nettle openssl)
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('4d75daab3e034367c5da418f5504b0ab0a349562bbdcc616fe9094eec6edfe11b27f6cc3d48104860b397b1e0de8b1615a8ed461a471eafbe36c1cb2e0864212')
b2sums=('18609d6e3833fff70c9ff39f6b6541014863551fc130f692b59ff14086a3d36807932c356078e56ff7958c4fd3da528896eef6c86cb24fb27a4adc58903e50b5')

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
