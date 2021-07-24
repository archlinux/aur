# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=firecracker
pkgname=('firecracker' 'firecracker-docs')
pkgver=0.24.5
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
arch=('x86_64')
url="https://firecracker-microvm.github.io"
license=('Apache')
makedepends=('cargo' 'rust-musl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/firecracker-microvm/firecracker/archive/v$pkgver.tar.gz")
b2sums=('cd69997a558ef8374c4ebb5c76fb8064b17444cf4a8b5162fe54f2e9ccfa542ff499210a8d362323d94e75abefd0187afb0ce29bbfe91dd8a66977313e1a63e9')

build() {
  cd "$pkgbase-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build \
    --package firecracker \
    --package jailer \
    --release \
    --locked \
    --all-features \
    --target-dir=target \
    --target="$CARCH-unknown-linux-musl"
}

package_firecracker() {
  cd "$pkgbase-$pkgver/target/$CARCH-unknown-linux-musl/release"
  install -vDm755 -t "$pkgdir/usr/bin" jailer firecracker
}

package_firecracker-docs() {
  arch=('any')
  pkgdesc+=" (documentation)"
  cd "$pkgbase-$pkgver"
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgbase" *.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgbase"
}
