# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Gabriel M. Dutra <0xdutra@gmail.com>
pkgname=ipinfo-cli
_pkgname=${pkgname%-cli}
pkgver=3.3.0
pkgrel=1
pkgdesc="Official Command Line Interface for the IPinfo API (IP geolocation and other types of IP data)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://ipinfo.io"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ipinfo/cli/archive/${_pkgname}-$pkgver.tar.gz")
sha256sums=('18069e115c78a7a167311ad02de354c8e8d71dc63d838d94635f439eb64585f0')

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
