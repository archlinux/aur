# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Ninez <triplesquarednine AT gmail DOT com>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: sekret
# Contributor: SanskritFritz

pkgname=tupitube
pkgver=0.2.18
pkgrel=4
pkgdesc='Design and authoring tool for digital artists interested in 2D animation'
arch=('x86_64')
url='https://tupitube.com/'
license=('GPL2')
depends=('ffmpeg' 'qt5-multimedia' 'qt5-svg' 'quazip')
makedepends=('ruby-rexml')
replaces=('tupitube.desk')
source=("https://downloads.sourceforge.net/tupi2d/$pkgname.desk-$pkgver.tar.gz"
        'tupitube.appdata.xml'
        'ffmpeg5.patch')
sha256sums=('b765e39426531c383cc88cda62c5331efe5f965d02ec079e55eddd077749a4aa'
            '99fbafe0b359130d53278db3cada052f8245c325dcb82ce33997322dd750707a'
            'b08c12db5f9c66128f31c398ae5a50d96b4fdfd895b47c62fe0d3dab9325f45a')

prepare() {
  cd $pkgname.desk
  sed -i 's|quazip/|QuaZip-Qt5-1.4/quazip/|' configure.tests/quazip/main.cpp src/libtupi/tuppackagehandler.cpp
  sed -i 's|quazip-qt5|quazip1-qt5|' qonf/test.rb
  sed -i 's|/share/pixmaps|/share/icons/hicolor/128x128/apps|' qonf/makefile.rb
  sed -i '/require .os/d' qonf/configure.rb

  patch -p1 -i ../ffmpeg5.patch # Fix build with FFmpeg 5
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
