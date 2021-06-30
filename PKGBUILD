# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=firecracker
pkgname=('firecracker' 'firecracker-docs')
pkgver=0.23.4
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
arch=('x86_64')
url="https://firecracker-microvm.github.io"
license=('GPL')
makedepends=('cargo' 'rust-musl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/firecracker-microvm/firecracker/archive/v$pkgver.tar.gz")
b2sums=('644aa5687638b63e448993381e07a4ffcdf1857f7e29a4c4d8aaa9cb62fabb2001626c275ced77b9a18589b5c3ce830613a71162e2b38c34253497360d896e6d')

build() {
  cd "$pkgbase-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build \
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
