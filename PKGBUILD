# Maintainer: Cosmic Horror <CosmicHorrorDev@pm.me>
# Contributor: Alessio Biancone <alebian1996@gmail.com>

pkgname=lspmux
pkgver=0.3.0
pkgrel=1
pkgdesc="share one language server instance between multiple LSP clients to save resources"
arch=(any)
url="https://codeberg.org/p2502/lspmux"
license=(MIT)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('3581f872f1e686bf2b1465bdb42e666c81e3d043825b05fce3ee69cc3b0ca19d6626c92b060866940b2359193f83512f5941cc489477a77c2831c30976cfdf3a')
# this package is a continuation from the original ra-multiplex
replaces=("ra-multiplex")

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  cat <<EOF > lspmux.service
[Unit]
Description=Language server multiplexer server
After=multi-user.target

[Service]
Type=simple
ExecStart=/usr/bin/lspmux server

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

  install -D -m755 "target/release/lspmux" "${pkgdir}/usr/bin/lspmux"
  install -D -m644 lspmux.service "${pkgdir}/usr/lib/systemd/user/lspmux.service"
}

# vi: filetype=sh shiftwidth=2 expandtab
