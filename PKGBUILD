# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=celeste
pkgver=0.5.2
pkgrel=1
pkgdesc="GUI file synchronization client that can sync with any cloud provider"
arch=('x86_64')
url="https://github.com/hwittenborn/celeste"
license=('GPL3')
depends=('libadwaita' 'libayatana-appindicator' 'rclone')
makedepends=('cargo-nightly' 'clang' 'go' 'gtk3' 'just')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6c76ed6f5a846388454766c6022f9a17a04448d6b132098a2cf3aabbbd7c137f')

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
