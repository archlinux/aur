# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=firecracker
pkgname=('firecracker' 'firecracker-docs')
pkgver=0.25.1
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
arch=('x86_64')
url="https://firecracker-microvm.github.io"
license=('Apache')
makedepends=('rust' 'rust-musl' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/firecracker-microvm/firecracker/archive/v$pkgver.tar.gz")
sha512sums=('b9bf4fc9fd89312234eb13e50d37b942166d273e8ae16e018541dc1afbebcba9793415e14f4397885aa0797408a01676a9899e1f47296c312d06da9ddb30b571')
b2sums=('6c0d8eb21b46e5d372773c0395462b37d1f34f275bcb80e1c8350e4056e334c54cb2a70367dba34dee0fc56007665dfba74b8804014bfe0c1e6e9a8a33ff2219')

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
