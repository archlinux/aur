# Maintainer: Ersei <samb at disroot dot org>
# Maintainer: Anthony Wang <ta180m@pm.me>

pkgname=woodpecker-agent
pkgver=0.15.0
pkgrel=7
pkgdesc="A community fork of the Drone CI system. Agent program."
arch=(x86_64 armv7h aarch64)
url="https://woodpecker-ci.org/"
license=('Apache')
makedepends=('git' 'go')
depends=('glibc')
optdepends=('docker: Docker backend' 'podman: Podman backend')
backup=(etc/woodpecker-agent.conf)
_pkgname=${pkgname/-agent/}
source=(
  "$_pkgname-$pkgver.tar.gz::https://github.com/woodpecker-ci/$_pkgname/archive/v$pkgver.tar.gz"
  'systemd.service'
  'tmpfiles.conf'
  'sysusers.conf'
  'woodpecker-agent.conf'
)
sha256sums=('b1a64d5e47f003ce8bc785375663239b45532d80d6e17b358344b7e3cba930c4'
            '77d03cc1faec8ad0f313e3965b272545d3c4067c640f7cb30d80cbfcfc49720c'
            '936166e115b8b3560105ce104f78c4f6c10cbebd31a4e4aeaabb2a620da92556'
            'd2f5b398731030864da4b07e147d5bd3f4dd588f03a9ac06e9d73038e033d208'
            '8f39980e87b13def1a8f9d00d97556d007240163104d33c472085f98be03fb3c')


prepare() {
  cd "$_pkgname-$pkgver"

  sed -i 's/ -extldflags \"-static\"//' Makefile
}

build() {
  cd "$_pkgname-$pkgver"

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

  GOFLAGS=-trimpath make build-agent
}

package() {
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -vDm600 woodpecker-agent.conf "$pkgdir/etc/$pkgname.conf"

  cd "$_pkgname-$pkgver"

  install -vDm755 -t "$pkgdir/usr/bin" dist/*
}
