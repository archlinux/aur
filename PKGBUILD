# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pkgdu
pkgver=0.5.0
pkgrel=1
pkgdesc="A tool to display packages disk usage size"
arch=('x86_64')
url="https://github.com/bpetlert/pkgdu"
license=('GPL-3.0-or-later')
depends=(pacman)
makedepends=(cargo)
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3382d6e004c277b5d56ff8e84413c8bb09e89e3ee4d562cd9294496441d133ee')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build  --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/pkgdu" "$pkgdir/usr/bin/pkgdu"

  install -Dm644 "README.adoc" "$pkgdir/usr/share/doc/${pkgname}/README.adoc"
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
