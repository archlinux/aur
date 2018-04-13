# Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>

pkgname=etcher-cli-git
pkgver=v1.4.1.0.g1c43ee1b
pkgrel=1
pkgdesc='Burn images to SD cards & USB drives, safe & easy'
arch=(x86_64)
url='http://www.etcher.io/'
license=(apache)
makedepends=(npm)
conflicts=(etcher-cli)
provides=(etcher-cli)
source=("$pkgname::git+https://github.com/resin-io/etcher.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed 's/-/./g'
}

build() {
  cd $pkgname
  _version="$(jq -r '.version' package.json)+$(git log -1 --format="%h")"

  make electron-develop
  make dist/Etcher-cli-$_version-linux-x64 RELEASE_TYPE=snapshot
}

package() {
  cd $pkgname
  _version="$(jq -r '.version' package.json)+$(git log -1 --format="%h")"

  mkdir -p "$pkgdir"/{opt,usr/bin}
  cp -a dist/Etcher-cli-$_version-linux-x64 "$pkgdir"/opt/$pkgname
  ln -s /opt/$pkgname/etcher "$pkgdir"/usr/bin/etcher
}

# vim:set ts=2 sw=2 et:
