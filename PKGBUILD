# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname=rusthound-ce
pkgver=2.5.50
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
b2sums=('33ba6bc333fcda9d4b1114c7f9aed956487bba7f898ecc482b9d4b5e3ebcc671239fce6be37dc7c37a210667d274ff24211d28d98d71dfe4a24c83dcc8724589')
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
  cargo b -r --frozen
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo t -r --frozen --no-fail-fast
}

package() {
  cd "$pkgname"
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 syntax=PKGBUILD et:
