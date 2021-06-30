# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=firecracker
pkgname=('firecracker' 'firecracker-docs')
pkgver=0.24.4
pkgrel=2
pkgdesc="Secure and fast microVMs for serverless computing"
arch=('x86_64')
url="https://firecracker-microvm.github.io"
license=('Apache')
makedepends=('cargo' 'rust-musl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/firecracker-microvm/firecracker/archive/v$pkgver.tar.gz")
b2sums=('15b0555590df59e865c34f0fc8fa071827b7031f5cc9b01550a7c4d914818bebfaa5037945cfc696cc241961510836ec863463055d22632d50e803436473de96')

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
