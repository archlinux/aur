# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sshd-openpgp-auth
_name=ssh-openpgp-auth
pkgver=0.3.0
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
  rust
  rust-script
)
checkdepends=(
  openssh
)
optdepends=('openssh: for working with a local sshd')
source=($pkgname-$pkgver.tar.gz::https://codeberg.org/wiktor/ssh-openpgp-auth/archive/$pkgname/$pkgver.tar.gz)
sha512sums=('84510f31f1ee6342c7f393c915a44f9647526cf3fe924497e92ef65cc2f676e9d2fff788843d1e2f44cdfce16c1ca42af983a3870c4f1a06207707a35e8e8ced')
b2sums=('ecf5ab9819551dd65cacf123802b40c551b53b665c1288e3792642839b08ac800f19c69e2cf868e4ae7257bf8b50b5905a36106f662057b0e5e0c9f9de96552a')
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
