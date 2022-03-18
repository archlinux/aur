# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cod
pkgver=0.1.0
pkgrel=5
pkgdesc="A completion daemon for bash/zsh"
arch=('any')
url="https://github.com/dim-an/cod"
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dim-an/cod/archive/v$pkgver.tar.gz")
sha256sums=('3d8ed6f284afcf4c86a2164e234ab7ff40c50aa6ab0bd892e59f8dc8aef02541')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"

  # download dependencies
  go mod download -x

  # create directory for build output
  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -buildvcs=false -o build .

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
