# Maintainer: HeadedBranch <isaac.hesslegrave at gmail dot com>

pkgname=miasma
pkgdesc='Trap AI web scrapers in an endless poison pit.'
pkgver=0.2.5
pkgrel=1
arch=(x86_64)
license=('GPLv3-only')
url='https://github.com/austin-weeks/miasma'
makedepends=('cargo')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  miasma.service
  sysusers-file
)
sha256sums=('081bdccc2cfe1a9889dbb842006a4ee6fb5764dd5835a42955d46f36d8ba3db2'
            'c7482df8d5362ce914e06e67fde051abbe34d38dc78808e25aac4a1f299e30ff'
            '211d658368c51a2dce6ad5f117d7159fe775516e392b7209df1304154c0a36d9'
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
  install -Dm644 "$srcdir/miasma.service" "$pkgdir/usr/lib/systemd/system/miasma.service"
  install -Dm644 "$srcdir/sysusers-file" "$pkgdir/usr/lib/sysusers.d/miasma.conf"
}

