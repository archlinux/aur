# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sequoia-wot
pkgver=0.7.0
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
sha512sums=('ea8db57b6db5ed8ba347d691f21ce9173c91fe66c6cb534018371b0ce2c9202b5fca138102b3350198e30851825f0f5c69e7d6d297c3d8ef62fb8880c308d62c')
b2sums=('e54c7b4bc0efd8cb9826285468a5049bfdae8bd402edf74fb1c248efa12851f16f97114fe8d9e237d92f65e0a94b91ab1890f11c1b289a3fe98c0323da916cdc')

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
