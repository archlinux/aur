# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname="rusthound-ce"
pkgver=2.5.21
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
b2sums=('d979594afd61b2144189e177b2e2e69ed8d0ac419554fc19325733efab21595c91f56648ef8fdf852d154c94e1e3e6fa909be1f6f19f84063c435d9d9cb5d1f4')
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
