# Maintainer: Sink <mikaandjobb@gmail.com>
pkgname=downpour
pkgver=0.1.1
pkgrel=1
pkgdesc="A terminal UI for torrent clients (Transmission, qBittorrent, and internal librqbit engine)"
arch=('x86_64')
url="https://codeberg.org/sink/downpour"
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('04ab023d5c41677934283ba8b0d1a08545452a3a610f605bc4a4953efe9c2e66')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
}

package() {
  cd "$pkgname"
  
  # Binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Desktop file
  install -Dm644 "assets/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  
  # Documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
