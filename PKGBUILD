# Maintainer: henning mueller <mail@nning.io>

pkgname=protonutils
pkgver=1.6.5
pkgrel=1
pkgdesc="CLI tool that provides different utilities to make using the Proton compatibility tool more easily"
arch=(x86_64)
url="https://github.com/nning/protonutils"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('caa373b55416c570d0ae6053b2d4f8502001a82dc1455e6d80ff5fd9a5d87cad')

prepare() {
  cd "$pkgname-$pkgver"

  export GOPATH="$srcdir/gopath"
  go clean -modcache
}

build() {
  cd "$pkgname-$pkgver"

  export GO111MODULE=on
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  make clean build_pie VERSION=v$pkgver 

  "./cmd/$pkgname/$pkgname" -m man1
  "./cmd/$pkgname/$pkgname" completion bash > comp.bash
  "./cmd/$pkgname/$pkgname" completion zsh > comp.zsh

  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"

  # TODO Replace by `make install` (with according prefixes)
  install -Dm755 "cmd/$pkgname/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm755 man1/* -t $pkgdir/usr/share/man/man1/
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 comp.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 comp.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
