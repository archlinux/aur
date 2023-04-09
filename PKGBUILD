# Maintainer: Victor Mingueza <victormingueza at gmail.com>
pkgname=journal-viewer
pkgver=0.1.2
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
    'ccc02654cb6eb52d01016d4adab6e5e1f90dd928afa1af7b8c97b9e423a58634'
    '1a05137ac02810b197fc96b1316aeae7b5e8275e0c693067db74b095ecbcf784'
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