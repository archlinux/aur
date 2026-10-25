# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Contributor: Vinay S Shastry <vinayshastry at gmail dot com>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.119.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
url="https://github.com/${_pkgname%-go}/${_pkgname}/tree/v${pkgver}/cmd/${pkgname}"
license=('Apache-2.0')
makedepends=('go')
#options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname%-go}/${_pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('5009b4a096bb7e09d4b6ffd4b878e5ff722b145dc579a092c3d6a6e925decb939958a961b14a07f9ee293ea69c6595cd339e914b8ea50a16c380a715bf7f2111')

prepare() {
  cd "${_pkgname}-${pkgver}" || exit
  mkdir -p build/
}

build() {
  cd "${_pkgname}-${pkgver}" || exit
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -ldflags=-X=main.version=${pkgver} -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

check() {
  cd "${_pkgname}-${pkgver}" || exit
  go test ./cmd/...
}

package() {
  cd "${_pkgname}-${pkgver}" || exit
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
