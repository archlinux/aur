# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname="rusthound-ce"
pkgver=2.5.14
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
b2sums=('ebed8a9043351e54a9ee5ac3bca2182123135fb0e5debff6a8bbef392910216b6599e418a3cc6b9c699d707564f038e08657b5830578390b451d4aed8e61793c')
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
