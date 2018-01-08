# Maintainer: blacktav <blacktav at gmail dot com>
# Contributor: based on unknown abandoned pokerth-final from 2012-12-27

pkgname=pokerth
pkgver=1.1.2
pkgrel=1
pkgdesc="Client to online Poker game written in C++/QT"
arch=('i686' 'x86_64')
url="http://www.pokerth.net/"
license=('GPL' 'custom')
depends=('curl' 'boost-libs' 'gsasl' 'protobuf'
         'qt5-base' 'sdl_mixer' 'tinyxml')
makedepends=('boost')
source=(https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz/download)
md5sums=('8fd7d7fc7ece17315e58aa3240dd4586')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-rc"

  # ---< required for v1.1.2 >--------------------------------------------------
  # these changes should be incorporated in next release ~feb-2018
  
  # reserved is now a keyword for protobuf v3.5
  sed -i '704s/reserved/custReserved/' pokerth.proto
  sed -i '252s/reserved/custReserved/' src/net/common/netpacket.cpp
  # above then needs protobuf files rebuilt
  protoc -I=$srcdir/$pkgname-$pkgver-rc/ --cpp_out=$srcdir/$pkgname-$pkgver-rc/src/third_party/protobuf/ $srcdir/$pkgname-$pkgver-rc/pokerth.proto $srcdir/$pkgname-$pkgver-rc/chatcleaner.proto
  # clearup ambiguous call error
  sed -i '3862s/advance/std::advance/' src/gui/qt/gametable/gametableimpl.cpp
  # ----------------------------------------------------------------------------

}

build() {
  cd "$srcdir/$pkgname-$pkgver-rc"

  qmake CONFIG+="client" -spec linux-g++  ${pkgname}.pro
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
