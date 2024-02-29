# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=ssh-openpgp-auth
pkgver=0.2.2
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
)
checkdepends=(
  openssh
)
optdepends=('openssh: for working with a local sshd')
source=($pkgname-$pkgver.tar.gz::https://codeberg.org/wiktor/ssh-openpgp-auth/archive/$pkgname/$pkgver.tar.gz)
sha512sums=('d28a110b3d35bb8841d3b2ac451d923ac2d6fd00d30746d0f171648e065e2e8a7b799cd50d6e34654885df6b6409a74fa396332cbd70d4917661dabb1504699b')
b2sums=('05fcd0c86e780df2fe136d5ce1b71002ab9875d4ca19362c66f40ce81ca31042900a3f2c00a484383358b0f01743d1ce207cbc2423adce233c2982696b40ae1c')
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
  )

  install -vDm 755 $pkgname/target/release/$pkgname -t "$pkgdir/usr/bin/"

  install -vDm 644 $pkgname/target/manpages/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -vDm 644 $pkgname/target/shell_completions/$pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm 644 $pkgname/target/shell_completions/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
  install -vDm 644 $pkgname/target/shell_completions/*.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"

  install -vDm 644 $pkgname/$pkgname/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 $pkgname/LICENSES/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
