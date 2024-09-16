# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=oryx
pkgver=0.2
pkgrel=1
pkgdesc="A TUI for sniffing network traffic using eBPF"
arch=('x86_64')
url="https://github.com/pythops/oryx"
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('cargo-nightly' 'bpf-linker')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('56b13bd07e21df2f655e7d4e7a7e78ada5e99f9cf0ecd2b44cbdd6a7495a78ccfcf14ee5a2becf5dae5c018f68c7100ab85d815703a0620feda645c8e7305c89')
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
