# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Kamil Śliwak <cameel2@gmail.com>

_name=temporary-containers
pkgname=firefox-temporary-containers
pkgver=1.9.2
pkgrel=3
pkgdesc='Open tabs, websites, and links in automatically managed disposable containers'
arch=('any')
url=https://github.com/stoically/temporary-containers
license=('MIT')
groups=('firefox-addons')
makedepends=('git' 'npm' 'strip-nondeterminism')
provides=('firefox-extension-temporary-containers')
replaces=('firefox-extension-temporary-containers')
source=("$url/archive/v$pkgver/$_name-v$pkgver.tar.gz")
b2sums=('ab1bf45ac38e7bc3de52d3d25a62d1dcfbad01ae4c38e3e58a127de0a080c9126561399c7aeff4370fc6d7a782c748f4842a2ddbd639769069f84f3f940c000a')

prepare() {
  cd $_name-$pkgver
  npm ci
}

build() {
  cd $_name-$pkgver
  npm run build:webpack
  npm run webext:build
  strip-nondeterminism -t zip web-ext-artifacts/temporary_containers-$pkgver.zip
}

check() {
  cd $_name-$pkgver
  npm test
}

package() {
  cd $_name-$pkgver
  install -Dm644 web-ext-artifacts/temporary_containers-$pkgver.zip \
    "$pkgdir"/usr/lib/firefox/browser/extensions/{c607c8df-14a7-4f28-894f-29e8722976af}.xpi
}

# vim:set ts=2 sw=2 et:
