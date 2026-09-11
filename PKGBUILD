# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname="rusthound-ce"
pkgver=2.5.13
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
  'clang'
  'git'
)
source=("git+$url#tag=v$pkgver")
b2sums=('dcb06b90d52cc8ca154d869fda68c2c25c543dda4833160b0114fbe29c5f67f937f2f98fd5009d0045c501917aa8d0340e7f20cbdc04c7c2f8e718baf1975e07')
options=('!lto')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname"
  export CARGO_TARGET_DIR=target
  cargo b --frozen -r
}

check() {
  cd "$pkgname"
  export CARGO_TARGET_DIR=target
  cargo t --frozen --no-fail-fast -r
}

package() {
  cd "$pkgname"
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 syntax=PKGBUILD et:
