# Maintainer: Benjamin Demetz <demetzbenjamin23@gmail.com>

# This file is the source of truth for the tooka AUR package.
# It is published by .github/workflows/aur.yml on every release, which sets
# pkgver to the release version and updates sha256sums. Do not edit the copy
# on the AUR directly.

pkgname=tooka
pkgver=1.2.0
pkgrel=1
pkgdesc="A rule-based automatic file sorter"
arch=('i686' 'x86_64' 'aarch64' 'riscv64')
url="https://github.com/Benji377/tooka"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
conflicts=('tooka-git' 'tooka-cli')
replaces=('tooka-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6b22bdf7f44163011676cc6b75b4fb592d9c4ab3da968238a1ff039bf2c24e67')


prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}


build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}


package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tooka"
}
