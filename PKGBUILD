# Maintainer: blacktav <blacktav at gmail dot com>
# Contributor: based on unknown abandoned pokerth-final from 2012-12-27
# Patches: xx55tt

pkgname=pokerth
pkgver=1.1.2
pkgrel=21
pkgdesc="Client to online Poker game written in C++/QT"
arch=('i686' 'x86_64')
url="http://www.pokerth.net/"
license=('GPL' 'custom')
depends=('curl' 'boost-libs' 'gsasl' 'protobuf'
         'qt5-base' 'sdl_mixer' 'tinyxml')

makedepends=('boost')

source=(https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz
        ${pkgname}-${pkgver}.patch
        ${pkgname}-${pkgver}.patch.2019
        ${pkgname}-${pkgver}.patch.2020)
md5sums=('8fd7d7fc7ece17315e58aa3240dd4586'
         '0ef5541fc6008dfb2521dcab47afb659'
         '50d427bd8afc57fb61e186de6c4e5601'
         'e5bf2357733b4508737f8271f3c1e65f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-rc"

  # ---< required for v1.1.2 >--------------------------------------------------
  # these changes should be incorporated in next release ~feb-2018
  patch -Np1 -i "${srcdir}/pokerth-1.1.2.patch"
  # ----------------------------------------------------------------------------
  # changes to permit building with boost 1.70
  patch -Np1 -i "${srcdir}/pokerth-1.1.2.patch.2019"
  # ----------------------------------------------------------------------------
  # change to permit building with boost 1.74
  # see also DEFINE+="BOOST_BIND_GLOBAL_PLACEHOLDERS" in build below
  patch -Np1 -i "${srcdir}/pokerth-1.1.2.patch.2020"
  # ----------------------------------------------------------------------------

  # good idea to do this at all times
  protoc -I=$srcdir/$pkgname-$pkgver-rc/ --cpp_out=$srcdir/$pkgname-$pkgver-rc/src/third_party/protobuf/ $srcdir/$pkgname-$pkgver-rc/pokerth.proto $srcdir/$pkgname-$pkgver-rc/chatcleaner.proto

}

build() {
  cd "$srcdir/$pkgname-$pkgver-rc"

  # QMAKE_CFLAGS_ISYSTEM workaround to prevent generation of "-isystem /usr/include"
  qmake CONFIG+="client" DEFINES+="BOOST_BIND_GLOBAL_PLACEHOLDERS" QMAKE_CFLAGS_ISYSTEM= -spec linux-g++ ${pkgname}.pro
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-rc"

  make INSTALL_ROOT="$pkgdir" install

  install -D pokerth "$pkgdir/usr/bin/pokerth"
  install -D -m644 docs/pokerth.1 "$pkgdir/usr/share/man/man1/pokerth.1"
  install -D -m644 data/data-copyright.txt "$pkgdir/usr/share/licenses/pokerth/data-copyright.txt"
  rm -f "$pkgdir/usr/share/pokerth/data/data-copyright.txt"
}

