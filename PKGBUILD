# Maintainer: TwoFinger
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>

pkgname=howl-git
pkgver=0.6
pkgrel=1
pkgdesc='General purpose, light-weight customizable editor'
arch=(i686 x86_64)
url='https://howl.io/'
license=(MIT)
depends=(gtk3 desktop-file-utils)
makedepends=(git wget)
optdepends=('ruby: for running some scripts' 'coffee-script: for running some scripts')
provides=(howl)
conflicts=(howl)
source=(git+https://github.com/howl-editor/howl.git luajit-rolling-release.patch)
md5sums=(SKIP e60f84c5452d87db0d0bbf648b74ba0f)

pkgver() {
  cd howl
  git describe --tags | sed "s+-+.r+" | tr - .
}

prepare() {
  cd howl
  git apply ../luajit-rolling-release.patch
}

build() {
  cd howl/src
  make
}

package() {
  cd howl/src
  make PREFIX=/usr DESTDIR="$pkgdir" install
  cd ..
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  rm "$pkgdir"/usr/share/howl/bundles/python/misc/examples.py
}
