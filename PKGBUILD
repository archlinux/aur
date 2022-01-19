# Maintainer: Anthony Wang <ta180m@pm.me>

pkgname=woodpecker
pkgver=0.15.0_rc1
_pkgver=${pkgver/_/-}
pkgrel=2
pkgdesc="Woodpecker is a community fork of the Drone CI system."
arch=(any)
url="https://woodpecker-ci.org/"
license=('Apache')
makedepends=('git' 'go')
depends=('glibc' 'docker')
source=(
  "$pkgname-$_pkgver.tar.gz::https://github.com/woodpecker-ci/$pkgname/archive/v$_pkgver.tar.gz"
  'systemd.service'
  'tmpfiles.conf'
  'sysusers.conf'
)
sha256sums=('9ee17a0271944bb95d6d8198ada10010c7cea306381f131635b91b5a5887dc48'
            '34d9dfbe0c360b6a6e2976e095cd63b81e2adc65951cfbceaa7df3176f042075'
            'e9dc665a71ccabbc07bce28c835d7ee78c2cb8853f2f5bc8e6f1e3852194fd60'
            '878466f384b124353a7247bcc26f374a8c174874afc47c227eefaf38b9905e5a')

prepare() {
  cd "$pkgname-$_pkgver"

  sed -i 's/-extldflags \"-static\"//' Makefile
}

build() {
  cd "$pkgname-$_pkgver"

  GOFLAGS=-trimpath make build
}

package() {
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd "$pkgname-$_pkgver"

  install -vDm755 -t "$pkgdir/usr/bin" dist/*
}
