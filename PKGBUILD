# Maintainer: IP2Location <support@ip2location.com>
pkgname=ip2loaction-io-cli
_pkgname=${pkgname%}
pkgver=1.1.0
pkgrel=1
pkgdesc="Official Command Line Interface for IP2Location.io Geolocation API service"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://www.ip2location.io"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ip2location/ip2location-io-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('86caf3202b8daea3a58aa3be3caa8514312116fba659d8e9e212e37b651b9f0d')

prepare() {
  cd "cli-${_pkgname}-$pkgver"
  export GOPATH="$srcdir/gopath"

  # download dependencies
  go mod download -x
}

build() {
  cd "cli-${_pkgname}-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o build "./${_pkgname}"

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "cli-${_pkgname}-$pkgver"
  install -Dm755 "build/${_pkgname}" -t "$pkgdir/usr/bin/"
}