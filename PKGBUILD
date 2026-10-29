# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Gabriel M. Dutra <0xdutra@gmail.com>
pkgname=ipinfo-cli
_pkgname=${pkgname%-cli}
pkgver=3.3.4
pkgrel=1
pkgdesc="Official Command Line Interface for the IPinfo API (IP geolocation and other types of IP data)"
arch=('x86_64' 'aarch64')
url="https://ipinfo.io"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ipinfo/cli/archive/${_pkgname}-$pkgver.tar.gz")
sha256sums=('1cb2eeec72224d527a78e787ab51639d2fcefb21915e10842e66ec4acb699148')

build() {
  cd "cli-${_pkgname}-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"
  go build -v -o build "./${_pkgname}"

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "cli-${_pkgname}-$pkgver"
  install -Dm755 "build/${_pkgname}" -t "$pkgdir/usr/bin/"
}
