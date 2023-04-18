# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sequoia-wot
pkgver=0.8.0
pkgrel=1
pkgdesc="An implementation of OpenPGP's web of trust"
arch=(x86_64)
url="https://gitlab.com/sequoia-pgp/sequoia-wot"
license=(GPL2)
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
sha512sums=('ab9995fe4af44c23ff1af3faa7f079c7852dc5d8418674f2ff1645596d8d4ed0fe0bde0250797ab98291cf8dfaa4ada8d28b8ad2a169b2671e7def0931b611af')
b2sums=('f5fa09997ab5a4e5d13eb38902080324a0836ab12eccb12d3dbaca04692e22b17410a84c1c9ce997e860bcf37121a5674711934ffab9770a0c548e8452dd190b')

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
  cd $pkgname-v$pkgver
  install -vDm 755 target/release/sq-wot -t "$pkgdir/usr/bin/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

  install -vDm 644 target/release/build/${pkgname}*/out/sq-wot.bash "$pkgdir/usr/share/bash-completion/completions/sq-wot"
  install -vDm 644 target/release/build/${pkgname}*/out/sq-wot.fish -t "$pkgdir/usr/share/fish/completions/"
  install -vDm 644 target/release/build/${pkgname}*/out/_sq-wot -t "$pkgdir/usr/share/zsh/site-functions/"
  install -vDm 644 target/release/build/${pkgname}*/out/sq-wot*.1 -t "$pkgdir/usr/share/man/man1/"
}
