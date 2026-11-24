# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname=rusthound-ce
pkgver=2.5.53
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
  'clang'
)
source=("git+$url#tag=v$pkgver")
b2sums=('ca0c47c48e2723a18a1e7e317ae88b0cbb827b734f086ddfe87dc7040423cca4b0726f7e503e30ad0cea8152fc050c66e9cc5c8f57e15ca1e2bec0098f12c77d')
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
