# Maintainer: HeadedBranch <isaac.hesslegrave at gmail dot com>

pkgname=miasma
pkgdesc='Trap AI web scrapers in an endless poison pit.'
pkgver=0.3.0
pkgrel=2
arch=(x86_64)
license=('GPL-3.0-or-later')
url='https://github.com/austin-weeks/miasma'
makedepends=('cargo')
depends=('libgcc' 'glibc')
optdepends=('sqlite: Collecting metrics on bots that request the service')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  miasma.service
  sysusers-file
  tmpfiles-file
  config.yaml)
sha256sums=('e45695ee6bc4675673bd9aa94923b18908f425b22ea0da59a4d070932253032f'
            'dcd69fb16f7e1fb223ed921b42b107e489795249723365585dd7d00ae7190a78'
            '211d658368c51a2dce6ad5f117d7159fe775516e392b7209df1304154c0a36d9'
            '42a3df35a73eb4c198367a0885ef86ea3b6b9f4dc824d74b70d77f04b5ea245b'
            '107ab9174502e07f588338837b58daae088e7e1aeb9970fa5a07d3d19e2d5ac7')
backup=('usr/lib/systemd/system/miasma.service' 'etc/miasma.yaml')
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
  install -Dm644 "$srcdir/tmpfiles-file" "$pkgdir/usr/lib/tmpfiles.d/miasma.conf"
  install -Dm644 "$srcdir/config.yaml" "$pkgdir/etc/miasma.yaml"
}

