# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=celeste
pkgver=0.5.7
pkgrel=1
pkgdesc="GUI file synchronization client that can sync with any cloud provider"
arch=('x86_64')
url="https://github.com/hwittenborn/celeste"
license=('GPL3')
depends=('libadwaita' 'libayatana-appindicator' 'rclone')
makedepends=('cargo-nightly' 'clang' 'go' 'gtk3' 'just')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a8ff4034f10344e327c20803152c3ea98e35a5bb805e6a957ec39e9ae721721f')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
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
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=nightly
  just clippy || :
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" just install
}
