# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=cuse
pkgver=0.5
pkgrel=1
pkgdesc='MIDI sequencer for the terminal'
arch=('x86_64' 'i686')
url='http://pi4.informatik.uni-mannheim.de/~haensel/cuse/index_en.html'
license=('GPL2')
depends=('libcdk')
source=("http://pi4.informatik.uni-mannheim.de/~haensel/$pkgname/files/$pkgname-$pkgver-src.tar.gz")
sha256sums=('13461c78a4be80f76dc0217f30f92351813788134b38dbf5eaf98e0a158c57a2')

prepare() {
  cd "$pkgname-$pkgver"

  # the latest version of libcdk moves cdk.h directly to /usr/include
  for f in configure src/CuSE.cxx src/sequencer.h; do
    sed 's:cdk/cdk.h:cdk.h:g' -i "$f"
  done

  # menulist must be const in order to compile
  sed 's:static char \*menulist:const static char \*menulist:' -i src/CuSE.cxx
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr CXXFLAGS='-w -fpermissive'
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
