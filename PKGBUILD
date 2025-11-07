# Maintainer: Victor Mingueza <victormingueza at gmail.com>
pkgname=journal-viewer
pkgver=0.8.1
pkgrel=1
pkgdesc="A modern linux desktop application to visualize systemd logs."
arch=('x86_64')
url="https://github.com/mingue/journal-viewer"
license=('GPL3')
depends=(
    'systemd'
    'webkit2gtk-4.1'
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
    'f04aae7af2d3ab2c9b60986a7fa03287a21a8223e7f4eb4059b3f7c162c8d187'
    'a0417c9219f5990ad9d6b6602aecd12ffab366cb79ff273d43e683c9a85e59f1'
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