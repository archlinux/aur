# Maintainer: Cosmic Horror <CosmicHorrorDev@pm.me>
# Contributor: Alessio Biancone <alebian1996@gmail.com>

pkgname=ra-multiplex
pkgver=0.2.5
pkgrel=1
pkgdesc="allows multiple LSP to share a single rust-analyzer instance per cargo workspace."
arch=('any')
url="https://github.com/pr2502/ra-multiplex"
license=(MIT)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('e8dbb9ac06081f40fe1036a3b9c73e2c54327e7b98436fa9710d89c9cd249b3236c2c27fc5c4d49bd72c165231abe2a6263f3b0ce25f81b3fb1bc42c6b6119f7')

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
