# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=ssh-openpgp-auth
pkgver=0.2.1
pkgrel=1
pkgdesc="Verify identity of remote SSH hosts based on OpenPGP trust anchors"
arch=(x86_64)
url="https://codeberg.org/wiktor/ssh-openpgp-auth/src/branch/main/ssh-openpgp-auth"
license=('Apache-2.0 OR MIT')
depends=(
  gcc-libs
  glibc
)
makedepends=(
  bzip2
  clang
  gmp
  just
  nettle
  openssl
  rust
  rust-script
  sqlite
)
checkdepends=(
  openssh
)
optdepends=('openssh: for working with a local sshd')
source=($pkgname-$pkgver.tar.gz::https://codeberg.org/wiktor/ssh-openpgp-auth/archive/$pkgname/$pkgver.tar.gz)
sha512sums=('8a557154f70942ef8d1b1f12161a1f2c9e92463a7711816c175ff2ae97d290c10b05908c9cf4756fccfe4cd99c5237a23cd06057d61c1adb9194845d22b34336')
b2sums=('b8296d19dd45fb46a5b6cf9aaa0caeba44c8f39f1993176c9bd4ecc6662f6a35b94a92d5a87ffc789341670a29247a8ba8b7ec75d194db9506278c0b4473393d')
validpgpkeys=()

prepare() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build -p $pkgname --frozen --release --all-features
  just generate manpages $pkgname target/manpages
  just generate shell_completions $pkgname target/shell_completions
}

check() {
  cd $pkgname/$pkgname
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  depends+=(
    bzip2 libbz2.so
    gmp
    nettle libhogweed.so libnettle.so
    openssl libcrypto.so libssl.so
    sqlite libsqlite3.so
  )

  install -vDm 755 $pkgname/target/release/$pkgname -t "$pkgdir/usr/bin/"

  install -vDm 644 $pkgname/target/manpages/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -vDm 644 $pkgname/target/shell_completions/$pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm 644 $pkgname/target/shell_completions/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
  install -vDm 644 $pkgname/target/shell_completions/*.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"

  install -vDm 644 $pkgname/$pkgname/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 $pkgname/LICENSES/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
