# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=tegratop
pkgver=0.2.1
pkgrel=1
pkgdesc='TUI monitoring tool for Nvidia Jetson boards'
arch=('x86_64' 'aarch64')
url="https://github.com/pythops/$pkgname"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('83856606a1feb156839e7b13a624afe55b722d0de293e1a5938208aeb842e24f')
makedepends=('cargo')
depends=('glibc' 'gcc-libs')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 Readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
