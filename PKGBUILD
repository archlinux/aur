# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sequoia-wot
pkgver=0.10.0
pkgrel=1
pkgdesc="An implementation of OpenPGP's web of trust"
arch=(x86_64)
url="https://gitlab.com/sequoia-pgp/sequoia-wot"
license=(LGPL-2.0-or-later)
groups=(sequoia)
depends=(
  gcc-libs
  glibc
  gmp
  nettle
  openssl
  sqlite
)
makedepends=(
  cargo
  clang
)
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('e776ff45bd3acf9d201377b22f3d914003b9dc8e416e853aaea6685ca8800eff0c24c28ea3296d3606c403fa2e663290f28e8a1a8c819ff0555bd48c19327ad9')
b2sums=('2a11007065c98401a77c61972268047479227169b6448eb7d4498c38d7a0ce9826300d92fc29fb85771c9f6a53d3bff503ca70851bf6f3ebe79dac69be145081')

prepare() {
  cd $pkgname-v$pkgver
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
  cd $pkgname-v$pkgver
  install -vDm 755 target/release/sq-wot -t "$pkgdir/usr/bin/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

  install -vDm 644 target/release/build/${pkgname}*/out/sq-wot.bash "$pkgdir/usr/share/bash-completion/completions/sq-wot"
  install -vDm 644 target/release/build/${pkgname}*/out/sq-wot.fish -t "$pkgdir/usr/share/fish/completions/"
  install -vDm 644 target/release/build/${pkgname}*/out/_sq-wot -t "$pkgdir/usr/share/zsh/site-functions/"
}
