# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>

pkgname=etcher-cli-git
pkgver=1.5.70.r0.g57145436
pkgrel=1
pkgdesc='Burn images to SD cards & USB drives, safe & easy'
arch=(x86_64)
url='http://www.etcher.io/'
license=(Apache)
makedepends=(npm)
conflicts=(etcher-cli)
provides=(etcher-cli)
source=("$pkgname::git+https://github.com/balena-io/etcher.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

prepare() {
  cd $pkgname
  git submodule init
  git submodule update
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
