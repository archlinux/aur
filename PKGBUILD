# Maintainer: TwoFinger
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>

pkgname=howl-git
_pkgname=howl
pkgver=0.6
pkgrel=1
pkgdesc='General purpose, light-weight customizable editor'
arch=(i686 x86_64)
url='https://howl.io/'
license=(MIT)
depends=(gtk4 desktop-file-utils)
makedepends=(git wget)
optdepends=('ruby: for running some scripts' 'coffee-script: for running some scripts')
provides=(howl)
conflicts=(howl)
source=(git+https://github.com/howl-editor/howl.git#branch=next
        fix-terraform.patch
)
md5sums=(SKIP
        7589b99661ec75797fbc61d2423f5844
)

pkgver() {
  cd "$srcdir"/$_pkgname
  git describe --tags | sed "s+-+.r+" | tr - .
}

build() {
  cd "$srcdir"/$_pkgname
  git apply ../fix-terraform.patch
  make -C src
}

package() {
  cd "$srcdir"/$_pkgname
  make -C src PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE.md
  rm "$pkgdir"/usr/share/howl/bundles/python/misc/examples.py
}
