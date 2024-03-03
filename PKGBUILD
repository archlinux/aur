# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=celeste
pkgver=0.8.1
pkgrel=2
pkgdesc="GUI file synchronization client that can sync with any cloud provider"
arch=('x86_64')
url="https://github.com/hwittenborn/celeste"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'rclone')
makedepends=('cargo-nightly' 'clang' 'go' 'just')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'https://github.com/hwittenborn/celeste/pull/195.patch')
sha256sums=('dcacd26d40b1b1fa6ad3e7e59941443ded0fcf396efc4ee836f5980a22060548'
            '48bbc4d7a80f6ac6edcf1605b86a6bed9d4c196a6f52cdd86e2cef2ed8ceaffa')

prepare() {
  cd "$pkgname-$pkgver"

  # Fix error[E0635]: unknown feature stdsimd
  patch -Np1 -i ../195.patch

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

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" just install
}
