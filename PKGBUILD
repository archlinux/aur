# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=firecracker
pkgname=('firecracker' 'firecracker-docs')
pkgver=0.25.0
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
arch=('x86_64')
url="https://firecracker-microvm.github.io"
license=('Apache')
makedepends=('rust' 'rust-musl' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/firecracker-microvm/firecracker/archive/v$pkgver.tar.gz")
b2sums=('6377b04844f3aae5cbd8dfb2abe6d23556887a6ff8b1d447b4d77214674c65a4330551c9300704576cfc9689ea609746d562cfe6df95548914ec3afd95910ccb')

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
