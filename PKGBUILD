# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=celeste
pkgver=0.4.0
pkgrel=1
pkgdesc="GUI file synchronization client that can sync with any cloud provider"
arch=('x86_64')
url="https://github.com/hwittenborn/celeste"
license=('GPL3')
depends=('libadwaita' 'rclone')
makedepends=('cargo-nightly' 'clang' 'go' 'gtk3' 'just')
optdepends=('libayatana-appindicator: option for tray icon'
            'libappindicator-gtk3: option for tray icon')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('af7b1b757dfd17282c6959c314ec622a6ae7d7843200a634b7325ccb5939cc38')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  just build

  # Clean module cache for makepkg -C
  go clean -modcache
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  just clippy
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" just install
}
