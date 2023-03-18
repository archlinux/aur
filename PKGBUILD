# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sequoia-wot
pkgver=0.6.0
pkgrel=2
pkgdesc="An implementation of OpenPGP's web of trust"
arch=(x86_64)
url="https://gitlab.com/sequoia-pgp/sequoia-wot"
license=(GPL2)
depends=(gcc-libs glibc gmp)
makedepends=(cargo clang nettle openssl)
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('aa489eedc1c3f803cfebaf8acb8cffefd504f614e885bd1967d6d5557b9b28b4300e7909912243698d6ddefa1b8b8c7610652ed77912ddb9697dd417c4729a30')
b2sums=('10431895479ba14e719df4980557456e7ef61c0656e342e388802cfca1576d58376a619f091dc215a18a3f9fcd3907cc6435a7bd142a10a4c1d4921ca7c0f98b')

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
