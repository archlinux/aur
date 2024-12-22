#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2154
# Maintainer: Abdulkadir Furkan Şanlı <me@abdulocra.cy>

pkgname='speedtest-go'
pkgver='1.7.10'
pkgrel='1'
pkgdesc='CLI and Go API to Test Internet Speed using speedtest.net'
arch=('x86_64')
url="https://github.com/showwin/${pkgname}"
license=('MIT')
makedepends=('go')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('70a2937d0759820fe7ee8f61b960d60c07b34c0d783ed11c0065b68fe2964aea')

build ()
{
  cd "${pkgname}-${pkgver}" || exit
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
  go build
}

check ()
{
  cd "${pkgname}-${pkgver}" || exit
  go test "./${pkgname%-go}"
}

package ()
{
  cd "${pkgname}-${pkgver}" || exit
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
