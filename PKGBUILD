# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=ssh-openpgp-auth
pkgver=0.2.3
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
sha512sums=('15af8a94b0751b438b5f6588a3cee00b542643920f1fe57af45c3c599d129efe344a839c652d611bc84e273900acefba5ef920190c31c4abfa0c58205faba8d2')
b2sums=('c955cac7e31f773385fc154f86b5dd0806e2462abdfe0aa60ca5ea4bf0f4cc1226264e0708db5f06f8e74623efbb5c008d1dfc5c0d7b917634d8064c2a9ce9d6')
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
