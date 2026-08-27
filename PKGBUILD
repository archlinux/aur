# Maintainer: robertfoster
pkgname=netsukuku-rs
pkgver=0.1.2 # renovate: datasource=github-tags depName=M0Rf30/netsukuku-rs
pkgrel=1
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
  'efd4fa387722f09d2e731d9508bcaf3d1275fb04cb04d52561df62d2f6a08a31'
  'bdaeb4e4bd1bb6738e2ca46380e8fbea55fed2b04f52d035297f8d78753ee1ac')

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
