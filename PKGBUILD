# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=oryx
pkgver=0.4
pkgrel=1
pkgdesc="A TUI for sniffing network traffic using eBPF"
arch=('x86_64')
url="https://github.com/pythops/oryx"
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('cargo-nightly' 'bpf-linker')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('98a5b1b4f15eb4165a0097e767ab94b3dea03ee7506e28af2a72bf7c0ca1b7795c443b92dde1e159344db20836ad2bbb656374bf0e01b59c952e59d7b1c059d2')
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
