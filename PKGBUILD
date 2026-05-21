# Maintainer: HeadedBranch <isaac.hesslegrave at gmail dot com>

pkgname=miasma
pkgdesc='Trap AI web scrapers in an endless poison pit.'
pkgver=0.2.4
pkgrel=4
arch=(x86_64)
license=('GPLv3-only')
url='https://github.com/austin-weeks/miasma'
makedepends=('cargo')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  miasma.service
  sysusers-file
  fix-permissions.patch
)
sha256sums=('99ff844fa2bd24bdf31d61b4739e5b8935db2b475732056fd0c6b4a4ae80e6d6'
            'c7482df8d5362ce914e06e67fde051abbe34d38dc78808e25aac4a1f299e30ff'
            '211d658368c51a2dce6ad5f117d7159fe775516e392b7209df1304154c0a36d9'
            '8a9873d0ed21604f792e47f1a424b898054f38515ec23a034593eabe5406ffcc')
options=(!lto)

prepare() {
  cd ${pkgname}-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  # Used to allow programs like nginx to serve the data from a unix socket by just being in the same group
  patch -p1 -i $srcdir/fix-permissions.patch
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

