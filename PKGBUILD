# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Ninez <triplesquarednine AT gmail DOT com>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: sekret
# Contributor: SanskritFritz

pkgname=tupitube
pkgver=0.2.17
pkgrel=1
pkgdesc="Design and authoring tool for digital artists interested in 2D animation"
arch=(x86_64)
url="https://tupitube.com/"
license=(GPL2)
depends=(ffmpeg qt5-multimedia qt5-svg quazip)
makedepends=(ruby)
replaces=(tupitube.desk)
source=(https://downloads.sourceforge.net/tupi2d/$pkgname.desk-$pkgver.tar.gz
        tupitube.appdata.xml
        qt-5.15.patch)
sha256sums=('e266490757a38a02dfa37405e4704993238f8af3060163e17830a85b22d9ba15'
            '99fbafe0b359130d53278db3cada052f8245c325dcb82ce33997322dd750707a'
            'afb563345a62034f523dcc558aee83efb466c863feb39e6a8d5744c974b979ce')

prepare() {
  cd $pkgname.desk
  patch -p1 -i ../qt-5.15.patch
  sed -i 's|quazip/|QuaZip-Qt5-1.1/quazip/|' configure.tests/quazip/main.cpp src/libtupi/tuppackagehandler.cpp
  sed -i 's|quazip-qt5|quazip1-qt5|' qonf/test.rb
  sed -i 's|/share/pixmaps|/share/icons/hicolor/128x128/apps|' qonf/makefile.rb
  sed -i '/require .os/d' qonf/configure.rb
}

build() {
  cd $pkgname.desk
  ./configure --prefix=/usr --libdir=/usr/lib --without-debug
  make
}

package() {
  cd $pkgname.desk
  make DESTDIR="$pkgdir" install
  install -Dm644 ../$pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
}
