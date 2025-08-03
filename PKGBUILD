# Maintainer: envolution
# Contributor: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=oauth2l
pkgver=1.3.3
pkgrel=1
pkgdesc='Google official CLI for interacting with Google API authentication'
arch=('x86_64')
url="https://github.com/google/${pkgname}"
license=('Apache-2.0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ccca81cf1d73c84f3808110be049c96ac460691c737950db0a52b741c708491ed08df8d38f1791ecd333638e50d993aaeb6e70212cd1baaab9fb4c85f086f325')

prepare() {
  cd "$pkgname-$pkgver"

  go mod tidy
  go mod vendor
}

build() {
  cd "$pkgname-$pkgver"

  export CGO_ENABLED=0
  export GO111MODULE=on

  go build \
    -mod=vendor \
    -ldflags "-s -w -extldflags '-static'" \
    -tags netgo \
    -o "$pkgname"
}

package() {
  install -D --mode 755 "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ts=2 sw=2 et:
