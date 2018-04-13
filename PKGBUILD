# Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>

pkgname=etcher-git
pkgver=v1.4.1.0.g1c43ee1b
pkgrel=1
pkgdesc='Burn images to SD cards & USB drives, safe & easy'
arch=(x86_64)
url='http://www.etcher.io/'
license=(apache)
depends=(gtk2 libxtst libxss gconf nss alsa-lib)
optdepends=('libnotify: for notifications'
            'speech-dispatcher: for text-to-speech')
makedepends=(npm git)
conflicts=(etcher)
provides=(etcher)
source=("$pkgname::git+https://github.com/resin-io/etcher.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed 's/-/./g'
}

build() {
  cd $pkgname
  make electron-develop
  make electron-installer-debian RELEASE_TYPE=snapshot
}

package() {
  cd $pkgname
  _version="$(jq -r '.version' package.json)+$(git log -1 --format="%h")"

  ar x dist/etcher-electron_${_version}_amd64.deb data.tar.xz
  tar -xf data.tar.xz -C "$pkgdir"

  mkdir -p "$pkgdir"/usr/bin
  ln -s /opt/Etcher/etcher-electron "$pkgdir"/usr/bin/etcher-electron
}

# vim:set ts=2 sw=2 et:
