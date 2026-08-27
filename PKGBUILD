# Maintainer: robertfoster
pkgname=netsukuku-rs
pkgver=0.1.2 # renovate: datasource=github-tags depName=M0Rf30/netsukuku-rs
pkgrel=2
pkgdesc="Rust reimplementation of the Netsukuku mesh routing protocol: QSPN v2, Hooking, Coordinator, PeerServices, ANDNA"
arch=('x86_64' 'aarch64')
url="https://github.com/M0Rf30/netsukuku-rs"
license=('GPL-3.0-or-later')
makedepends=('rust' 'cargo')
backup=('etc/ntkd/ntkd.toml')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  ntkd.service
  ntkd.toml)
sha256sums=('918d430453130b50a1d8d97edd404e019900df8c12ff1b3fa40b4313d9f1ceba'
  '0535fc523edaaaa8ce23888d4c3db13500a94988fdb20a5826d59f6da6698810'
  'b16a6805a87698c43a8fdf7bba699ebccf495aa24d110a49a6291bea335e76c0')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS-} --remap-path-prefix=${srcdir}=/ --remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/"
  cargo build --frozen --profile dist -p ntkd
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 target/dist/ntkd \
    "$pkgdir/usr/bin/ntkd"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/ntkd.service" \
    "$pkgdir/usr/lib/systemd/system/ntkd.service"
  install -Dm644 "$srcdir/ntkd.toml" \
    "$pkgdir/etc/ntkd/ntkd.toml"
}
