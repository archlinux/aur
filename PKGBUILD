# Maintainer: Gabriel M. Dutra <0xdutra@gmail.com>

pkgname=ipinfo-cli
_pkgname=${pkgname%-cli}
pkgver=2.8.0
pkgrel=1
pkgdesc="Official Command Line Interface for the IPinfo API (IP geolocation and other types of IP data)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://ipinfo.io"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ipinfo/cli/archive/$_pkgname-$pkgver.tar.gz")
sha256sums=('b46e533978e442656203122f42bee5917ba3ba388b579a1c0b7bd6ac02985ad1')

prepare(){
  cd "cli-$_pkgname-$pkgver"

  # Prevent creation of a `go` directory in one's home.
  # Sometimes this directory cannot be removed with even `rm -rf` unless
  # one becomes root or changes the write permissions.
  export GOPATH="$srcdir/gopath"
  go clean -modcache

  mkdir -p build/
}

build() {
  cd "cli-$_pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o build "./$_pkgname"

  # Clean mod cache for makepkg -C
  go clean -modcache
}

package() {
  cd "cli-$_pkgname-$pkgver"
  install -Dm755 "build/$_pkgname" -t "$pkgdir/usr/bin/"
}
