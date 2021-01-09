# Submitter: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald vandd Haren <ronald.archlinux.org>
# Previous Maintainer: chchch
# Current Maintainer: endlesseden

_pkgname=ephoto
pkgname=$_pkgname-git
pkgver=1.19.0.934.09873c6
pkgrel=1
pkgdesc="A light image viewer based on EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('efl')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://git.enlightenment.org/apps/$_pkgname.git")
#source=("http://www.smhouston.us/stuff/ephoto-1.5.tar.gz")
sha256sums=('SKIP')

pkgver() {
#  cd $_pkgname-$pkgver
#cd ephoto-1.5
cd $_pkgname

  efl_version=$(grep -m1 efl_version meson.build | sed -e 's/\s\+/\n/g' | tail -1 | sed -e "s/'/\n/g" | head -1)

  printf "$efl_version.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
#  cd $_pkgname-$pkgver
    cd $_pkgname
#cd ephoto-1.5

  rm -rf build
  arch-meson $@ . build \
  --prefix=/usr \
  --buildtype=release \
  --default-library=shared \
  --optimization=3

  meson compile -C build
}

check() {
  cd $_pkgname
  meson test -C build
}

package() {
#  cd $_pkgname-$pkgver
    cd $_pkgname
#cd ephoto-1.5

  DESTDIR="$pkgdir" meson install -C build

# install text files
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" TODO README

# install license files
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
