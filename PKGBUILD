# Maintainer: Victor Mingueza <victormingueza at gmail.com>
pkgname=journal-viewer
pkgver=0.2.0
pkgrel=1
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
    'c4e31be49c5477712cbae613f38b121675ee6ab3d1d52ad2ab4525c92c47cb70'
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