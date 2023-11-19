#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2154
# Maintainer: Abdulkadir Furkan Şanlı <me@abdulocra.cy>

pkgname='speedtest-go'
pkgver='1.6.9'
pkgrel='1'
pkgdesc='CLI and Go API to Test Internet Speed using speedtest.net'
arch=('x86_64')
url="https://github.com/showwin/$pkgname"
license=('MIT')
makedepends=('go')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/showwin/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('793479fb53dc475c99901ce3f6d2101b56240b338f57bc08039ee7aca0217695')

prepare ()
{
  cd "${pkgname}-${pkgver}" || exit
  mkdir -p build/
}

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
