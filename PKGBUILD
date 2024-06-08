# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Gadget3000 <gadget3000 at msn dot com>

pkgname=freesynd
_name=Freesynd
pkgver=0.8
pkgrel=1
pkgdesc="A free, cross-platform reimplementation of the classic Bullfrog game 'Syndicate'"
url="http://freesynd.sourceforge.net/"
license=('GPL-2.0-or-later')
arch=('x86_64')
makedepends=(cmake zlib libpng doxygen)
depends=(sdl2 sdl2_image sdl2_mixer)
install=$pkgname.install
# https://sourceforge.net/projects/freesynd/files/freesynd/freesynd-0.8/Freesynd-0.8-Source.zip/download
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-$pkgver/$_name-$pkgver-Source.zip"
              'gcc14.patch'
)
sha256sums=('a73de4657c5d945e338a14b915ccd976c473f9da5a965f0dc22fb2a233a5158b'
            'cd0935f7eeade10dd8e6e7f113ed9d385c0ecd7f7a8df44ca2045eb06edc47df')

options=(!debug)

prepare() {
  # https://sourceforge.net/p/freesynd/bugs/67/
  patch --directory=$_name-$pkgver-Source --forward --strip=1 --input=$srcdir/gcc14.patch
}

build() {
  cmake \
    -B _build \
    -S $_name-$pkgver-Source \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  make -C _build
}

package () {

make -C _build DESTDIR="$pkgdir/" install

  # doc
  mv "$pkgdir"/usr/share/doc/$_name "$pkgdir"/usr/share/doc/$pkgname
  cd $_name-$pkgver-Source
  install -m644 AUTHORS INSTALL README "$pkgdir"/usr/share/doc/$pkgname
}
