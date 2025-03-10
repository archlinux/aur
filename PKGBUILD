# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=oryx
pkgver=0.5
pkgrel=1
pkgdesc="A TUI for sniffing network traffic using eBPF"
arch=('x86_64')
url="https://github.com/pythops/oryx"
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('cargo-nightly' 'bpf-linker')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('4f61d770acd164a7091ab985a68e310d75eceebba6a08ef51722e9dde91684d3c87d363aa3a35103d0c723423ae68de46c84042cdc3f98dcbbc6f69e164a4a57')
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
