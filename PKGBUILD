# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=oryx
pkgver=0.1
pkgrel=1
pkgdesc="A TUI for sniffing network traffic using eBPF"
arch=('x86_64')
url="https://github.com/pythops/oryx"
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('cargo-nightly' 'bpf-linker')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9d102b1e70bfb33cff79cc70e5e8b3d383f55554b3f5c19eb5bf864b85b08257c0d0d525e4e55c6e49da9e41d848f19bd89d14e993b20de1b436faffc503f769')
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
