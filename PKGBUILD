# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pkgdu
pkgver=0.8.0
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
b2sums=('4961ace4708f5745df1f06647cf64471fa693d104f6ca41a9943ea8288bd0a9289694288d1759183ebc8815f8cd5881d97f163af48c96d549600b6d328a50f2f')

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
