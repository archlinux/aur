# Maintainer: HeadedBranch <isaac.hesslegrave at gmail dot com>

pkgname=miasma
pkgdesc='Trap AI web scrapers in an endless poison pit.'
pkgver=0.2.9
pkgrel=1
arch=(x86_64)
license=('GPL-3.0-or-later')
url='https://github.com/austin-weeks/miasma'
makedepends=('cargo')
depends=('libgcc' 'glibc' 'sqlite')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  miasma.service
  sysusers-file
  tmpfiles-file)
sha256sums=('d0a568b0490d5e238f605452d29db4c582ce477d4a1e0c087b2e58d68f7b0602'
            'b532e6e9e455bd5898a8076d0bf89fd5cc907d382690dd1b57d3a9c5cba4c18a'
            '211d658368c51a2dce6ad5f117d7159fe775516e392b7209df1304154c0a36d9'
            '42a3df35a73eb4c198367a0885ef86ea3b6b9f4dc824d74b70d77f04b5ea245b')
backup=('usr/lib/systemd/system/miasma.service')
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
}

