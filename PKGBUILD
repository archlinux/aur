# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname="rusthound-ce"
pkgver=2.5.26
pkgrel=1
pkgdesc="BloodHound CE collector written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/g0h4n/$pkgname"
license=('MIT')
depends=(
  'glibc'
  'libgcc'
  'krb5'
)
makedepends=(
  'rust'
  'git'
)
source=("git+$url#tag=v$pkgver")
b2sums=('15249c259ae1003cec17e1e7678273d8baf57f4a016c8920f5815ef94a39b96b37a996d759b1e92d4a1a520006bb3ec0746570692898f74258de2a4998c7dbb4')
options=('!lto')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo b --frozen -r
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo t --frozen --no-fail-fast -r
}

package() {
  cd "$pkgname"
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 syntax=PKGBUILD et:
