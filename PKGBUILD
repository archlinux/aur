# Maintainer: Cosmic Horror <CosmicHorrorDev@pm.me>
# Contributor: Alessio Biancone <alebian1996@gmail.com>

pkgname=ra-multiplex
pkgver=0.2.6
pkgrel=1
pkgdesc="allows multiple LSP to share a single rust-analyzer instance per cargo workspace."
arch=('any')
url="https://github.com/pr2502/ra-multiplex"
license=(MIT)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('d4ec229f6d1b867eb4420c1cc1783fd276f5e7b9a1ec82c802e1152adaadf5fb7f3c4910f232bcab3baa7d181917dcd4220d9d57e4be4937ed1ba471c117a366')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  cat <<EOF > ra-multiplex.service
[Unit]
Description=ra-multiplex service to keep the server alive
After=multi-user.target

[Service]
Type=simple
ExecStart=/usr/bin/ra-multiplex server

[Install]
WantedBy=default.target
EOF

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D -m755 "target/release/ra-multiplex" "${pkgdir}/usr/bin/ra-multiplex"
  install -D -m644 ra-multiplex.service "${pkgdir}/usr/lib/systemd/user/ra-multiplex.service"
}

# vi: filetype=sh shiftwidth=2 expandtab
