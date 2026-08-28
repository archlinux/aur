# Maintainer: robertfoster
pkgname=netsukuku-rs
pkgver=0.1.7 # renovate: datasource=github-tags depName=M0Rf30/netsukuku-rs
pkgrel=1
pkgdesc="Rust reimplementation of the Netsukuku mesh routing protocol: QSPN v2, Hooking, Coordinator, PeerServices, ANDNA"
arch=('x86_64' 'aarch64')
url="https://github.com/M0Rf30/netsukuku-rs"
license=('GPL-3.0-or-later')
makedepends=('rust' 'cargo')
backup=('etc/ntkd/ntkd.toml')
options=(!lto)
# The unit and default config ship inside the tarball, at contrib/systemd/ — upstream keeps them
# beside the code that decides what they must contain (capability set, config error text), so this
# package installs those rather than carrying copies that can drift.
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3845595508ff3581e86e31e0dd3c80002dacd7bbe21ba2dcd76e679a67d54657')

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
  install -Dm644 contrib/systemd/ntkd.service \
    "$pkgdir/usr/lib/systemd/system/ntkd.service"
  install -Dm644 contrib/systemd/ntkd.toml \
    "$pkgdir/etc/ntkd/ntkd.toml"
}
