# Maintainer: Ersei <samb at disroot dot org>
# Contributer: Anthony Wang <ta180m@pm.me>

pkgname=woodpecker-cli
_pkgname=${pkgname/-cli/}
pkgver=0.15.0
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A community fork of the Drone CI system. CLI tool."
arch=(x86_64 armv7h aarch64)
url="https://woodpecker-ci.org/"
license=('Apache')
makedepends=('git' 'go')
depends=('glibc')
source=(
  "$pkgname-$_pkgver.tar.gz::https://github.com/woodpecker-ci/$_pkgname/archive/v$_pkgver.tar.gz"
)
sha256sums=('b1a64d5e47f003ce8bc785375663239b45532d80d6e17b358344b7e3cba930c4')
prepare() {
  cd "$_pkgname-$_pkgver"

  sed -i 's/-extldflags \"-static\"//' Makefile
}

build() {
  cd "$_pkgname-$_pkgver"

  # This package's Makefile uses the TARGETARCH variable's value to determine
  # what is the current architecture. TARGETARCH defaults to `amd64`, which is
  # fine for x86_64. Other possible values are `arm64` and `arm`. Currently
  # tested values are :
  #  - TARGETARCH amd64 when CARCH is x86_64
  #  - TARGETARCH arm when CARCH is armv7h
  case $CARCH in
    x86_64) export TARGETARCH=amd64;;
    aarch64) export TARGETARCH=arm64;;
    armv7h) export TARGETARCH=arm;;
    *)
      warn "untested architecture - if needed update PKGBUILD to build on arch $CARCH";;
  esac

  GOFLAGS=-trimpath make build-cli
}

package() {
  cd "$_pkgname-$_pkgver"
  install -vDm755 -t "$pkgdir/usr/bin" dist/woodpecker-cli
}
