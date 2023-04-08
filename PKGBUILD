# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sequoia-wot
pkgver=0.7.1
pkgrel=1
pkgdesc="An implementation of OpenPGP's web of trust"
arch=(x86_64)
url="https://gitlab.com/sequoia-pgp/sequoia-wot"
license=(GPL2)
depends=(
  gcc-libs
  glibc
  gmp
)
makedepends=(
  cargo
  clang
  nettle
  openssl
)
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('14e224ad4bfc751fffededc1cf2b9754f5bfb96a31f45e0c925041fda1bd6ad00f83b5bdb06f2f70994c9e3110b942bd45e294ac146578744fc779294f8f0a35')
b2sums=('564d969c61b9089d9ada98c01b6a49bae0400bc94a2d623a541b0fe57fce6f0d94e01d38c5c04607c1153e6fec507787f1bdceb19df766a8b611f851d1044ff8')

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
    nettle libhogweed.so libnettle.so
    openssl libcrypto.so libssl.so
  )

  cd $pkgname-v$pkgver
  install -vDm 755 target/release/sq-wot -t "$pkgdir/usr/bin/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

  install -vDm 644 target/release/build/${pkgname}*/out/sq-wot.bash "$pkgdir/usr/share/bash-completion/completions/sq-wot"
  install -vDm 644 target/release/build/${pkgname}*/out/sq-wot.fish -t "$pkgdir/usr/share/fish/completions/"
  install -vDm 644 target/release/build/${pkgname}*/out/_sq-wot -t "$pkgdir/usr/share/zsh/site-functions/"
  install -vDm 644 target/release/build/${pkgname}*/out/sq-wot*.1 -t "$pkgdir/usr/share/man/man1/"
}
