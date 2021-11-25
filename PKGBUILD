# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=firecracker
pkgname=('firecracker' 'firecracker-docs')
pkgver=0.25.2
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
arch=('x86_64')
url="https://firecracker-microvm.github.io"
license=('Apache')
makedepends=('rust' 'rust-musl' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/firecracker-microvm/firecracker/archive/v$pkgver.tar.gz")
sha512sums=('f7424175859ac95b3705c348b03ea0ae499a72598b09409b3c5b8b0f3395ccb4f933dcd961d62dbb7535356873e6369c0b2a1306d2b2978ff42eb9f07c9eeb50')
b2sums=('7f9269d30f8c0430ed9c5fd3c5bf68ffd78dafb563377a34658eb7ce9a9d90fc6827deab029a35680f0adbd794c5da51b0ec18c8220bcd41940b5d2dfc38891d')

_cargo_target="$CARCH-unknown-linux-musl"

prepare() {
  cd "$pkgbase-$pkgver"
  cargo fetch --locked --target="$_cargo_target"
}

build() {
  cd "$pkgbase-$pkgver"
  cargo build \
    --package firecracker \
    --package jailer \
    --release \
    --frozen \
    --all-features \
    --target-dir=target \
    --target="$_cargo_target"
}

package_firecracker() {
  find "$pkgbase-$pkgver/target/$_cargo_target/release" \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -vDm0755 -t "$pkgdir/usr/bin/" {} +
}

package_firecracker-docs() {
  arch=('any')
  pkgdesc+=" (documentation)"
  cd "$pkgbase-$pkgver"
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgbase" *.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgbase"
}
