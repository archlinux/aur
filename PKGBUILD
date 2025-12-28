# Contributor: Splith <spam at helper3000 net>
# Contributor: tee < teeaur at duck dot com >

pkgname=swars
pkgver=0.3.8.3283
pkgrel=1
pkgdesc="Syndicate Wars, a classic 1996 strategy game, with SDL patches to make it playable natively on Linux. Requires the Syndicate Wars CD to copy data files from before first run."
#url="http://swars.vexillium.org"
url="https://github.com/swfans"
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64')
depends=( 'lib32-sdl' 'lib32-libvorbis' 'lib32-libpng' 'lib32-zlib' 'lib32-openal' 'lib32-cdparanoia' )
#source=("http://swars.vexillium.org/files/$pkgname-$pkgver.tar.bz2")
source=("$pkgname-$pkgver.tar.gz::$url/syndwarsfx/archive/$pkgver.tar.gz")
sha256sums=('b95c60fa38922f8646b83cbd94258946c20133c168d7d3ac04d8a9d93d6535a9')

prepare() {
  cd syndwarsfx-$pkgver

  autoreconf -if
  if [ "${CARCH}" = "x86_64" ]; then
    ./configure --build=i686-pc-linux-gnu "CFLAGS=-m32" "CXXFLAGS=-m32" "LDFLAGS=-m32" "LDFLAGS=-L../usr/lib32" --prefix=/usr
  else
    ./configure --prefix=/usr
  fi
  sed -i '1i#include <string.h>' src/display.c src/guitext.c
}

build() {
  cd syndwarsfx-$pkgver
  make
}

package () {
  install=swars.install
  cd syndwarsfx-$pkgver

  make DESTDIR="$pkgdir" install
  mkdir -p "${pkgdir}/usr/share/swars"
  install -Dm755 util/install "${pkgdir}/usr/share/swars/install"
}

