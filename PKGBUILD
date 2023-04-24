# Maintainer: Victor Mingueza <victormingueza at gmail.com>
pkgname=journal-viewer-src
pkgver=0.3.0
pkgrel=2
pkgdesc="A modern linux desktop application to visualize systemd logs."
arch=('x86_64')
url="https://github.com/mingue/journal-viewer"
license=('GPL3')
depends=(
    'systemd'
    'webkit2gtk'
)
makedepends=(
    'base-devel'
    'rustup'
    'npm'
)
optdepends=(
)
provides=('journal-viewer')
conflicts=('journal-viewer')

source_x86_64=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname.desktop"
)
sha256sums_x86_64=(
    'aa794ab4c852ea9e86b5e8a2dfe7b1c5f99c74c43bbdc606dc92780b3d9cdd32'
    '475b19c2d1b971e91a624bb2fb4477e76e39834e70ce64035426b678b9376f0c'
)

prepare() {
  cd "$pkgname-$pkgver"
  npm config set cache "$srcdir/npm-cache"
  npm install

  cd src-tauri
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  npm config set cache "$srcdir/npm-cache"
  npm run build
  npm run tauri build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "src-tauri/target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}