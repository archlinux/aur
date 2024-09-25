# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=oryx
pkgver=0.3
pkgrel=1
pkgdesc="A TUI for sniffing network traffic using eBPF"
arch=('x86_64')
url="https://github.com/pythops/oryx"
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('cargo-nightly' 'bpf-linker')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('dc505f5cdf314d8c6b3e991f19c76a8f459bd4453fd0b81c1baea2153f2d016359e2c883170df8370a0a09774029b047839d700f035c8a760f6528ca2a102351')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo xtask build # --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/debug/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 Readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
