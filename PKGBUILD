# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sshd-openpgp-auth
_name=ssh-openpgp-auth
pkgver=0.2.1
pkgrel=1
pkgdesc="Create and manage OpenPGP certificates that serve as trust anchors for SSH host keys"
arch=(x86_64)
url="https://codeberg.org/wiktor/ssh-openpgp-auth/src/branch/main/sshd-openpgp-auth"
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
sha512sums=('038d76c1834f3e2f9b3b3c3d1a0da2c33ad52d23650a628627b90b8ce9bce66e07a2b8a44cf55b484e3de6fa3349f527f519d357fe5d0286352452f2151daca1')
b2sums=('600093d839964d3cc2d0d18acf0a2c46ad7fae24a1ee02f128ea88f155489c17824a94054628ac52dce5ea9c52efdd61c5adb21e87c340f069d4106022af6dd0')
validpgpkeys=()

prepare() {
  cd $_name
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $_name
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build -p $pkgname --frozen --release --all-features
  just generate manpages $pkgname target/manpages
  just generate shell_completions $pkgname target/shell_completions
}

check() {
  cd $_name/$pkgname
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  depends+=(
    bzip2 libbz2.so
    gmp
    nettle libnettle.so
    openssl libcrypto.so libssl.so
  )

  install -vDm 755 $_name/target/release/$pkgname -t "$pkgdir/usr/bin/"

  install -vDm 644 $_name/$pkgname/contrib/sysusers.d/$pkgname.conf -t "$pkgdir/usr/lib/sysusers.d/"
  install -vDm 644 $_name/$pkgname/contrib/tmpfiles.d/$pkgname.conf -t "$pkgdir/usr/lib/tmpfiles.d/"

  install -vDm 644 $_name/target/manpages/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -vDm 644 $_name/target/shell_completions/$pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm 644 $_name/target/shell_completions/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
  install -vDm 644 $_name/target/shell_completions/*.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"

  install -vDm 644 $_name/$pkgname/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 $_name/LICENSES/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
