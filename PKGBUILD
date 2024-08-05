# Maintainer: IP2Location <support@ip2location.com>
pkgname=ip2location-io-cli
_pkgname=${pkgname%}
pkgver=1.2.0
pkgrel=1
pkgdesc="Official Command Line Interface for IP2Location.io Geolocation API service"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://www.ip2location.io"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ip2location/ip2location-io-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9220fcd67cc32f3d3cc0695b0d0dad629d71d15f34d1016f0d5921616e291be7')

prepare() {
  cd "${_pkgname}-$pkgver"
  export GOPATH="$srcdir/gopath"

  # download dependencies
  go mod download -x
}

build() {
  cd "${_pkgname}-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o build ./ip2locationio

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "${_pkgname}-$pkgver"
  install -Dm755 "build/ip2locationio" -t "$pkgdir/usr/bin/"
}