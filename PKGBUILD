# Maintainer: Cosmic Horror <CosmicHorrorDev@pm.me>
# Contributor: Alessio Biancone <alebian1996@gmail.com>

pkgname=ra-multiplex
pkgver=0.2.3
pkgrel=1
pkgdesc="allows multiple LSP to share a single rust-analyzer instance per cargo workspace."
arch=('any')
url="https://github.com/pr2502/ra-multiplex"
license=(MIT)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('a61b4c0c6a9b5e23ab51db337d8fd839bd4233766777e5a8b5eb1f231a35ba4aed330f6372295c6efe44db01f441c5ed7c803703ba31d03fbba665d9b81f242d')

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
