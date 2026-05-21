# Maintainer: HeadedBranch <isaac.hesslegrave at gmail dot com>

pkgname=miasma
pkgdesc='Trap AI web scrapers in an endless poison pit.'
pkgver=0.2.4
pkgrel=2
arch=(x86_64)
license=('GPLv3-only')
url='https://github.com/austin-weeks/miasma'
makedepends=('cargo')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  miasma.service
)
sha256sums=(
  '99ff844fa2bd24bdf31d61b4739e5b8935db2b475732056fd0c6b4a4ae80e6d6'
  '1b76fef7f73770a12bb8cfda4de94aff51bb3a5be76309d6546f0bb3d7567381'
)
options=(!lto)

prepare() {
  cd ${pkgname}-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd ${pkgname}-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd ${pkgname}-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -vDm644 $srcdir/miasma.service "$pkgdir/usr/lib/systemd/system/miasma.service"
}

