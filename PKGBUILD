# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=firecracker-git
pkgver=1.2.0.r27.g4713a634
pkgrel=1
epoch=2
pkgdesc="Secure and fast microVMs for serverless computing"
arch=('x86_64')
license=('Apache:2.0')
url="https://firecracker-microvm.github.io"
provides=("firecracker")
conflicts=("firecracker")
makedepends=('git' 'rust' 'rust-musl' 'kernel-headers-musl' 'clang')
options=('!lto')
source=("$pkgname::git+https://github.com/firecracker-microvm/firecracker.git")
b2sums=('SKIP')

_cargo_target="$CARCH-unknown-linux-musl"

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --target="$_cargo_target"
}

build() {
  cd "$pkgname"

  cargo build \
    --package firecracker \
    --package jailer \
    --package seccompiler \
    --release \
    --all-features \
    --target-dir=target \
    --target="$_cargo_target"
}

check() {
  cd "$pkgname"

  cargo test -p firecracker --frozen
}

package() {
  install -m644 -D "$pkgname"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D "$pkgname"/README.md "$pkgdir"/usr/share/licenses/$pkgname/README.md
  find "$pkgname/target/$_cargo_target/release" \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -vDm0755 -t "$pkgdir/usr/bin/" {} +
}
