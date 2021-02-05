# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_ com>

pkgname=btanks
pkgver=0.9.8083
pkgrel=8
pkgdesc="Fast 2d tank arcade game with multiplayer and split-screen modes."
arch=('x86_64')
url="http://btanks.sourceforge.net"
license=('GPL')
depends=('expat' 'libgl' 'libsigc++2.0' 'libvorbis' 'lua51' 'openal' 'sdl' 'sdl_image'
	 'smpeg' 'glu' "btanks-data=$pkgver")
makedepends=('python2-scons' 'chrpath' 'mesa')
source=(http://downloads.sourceforge.net/btanks/btanks-$pkgver.tar.bz2
	btanks_desktop
	btanks_script
	bted_script
	gcc-4.6.patch)
install=btanks.install
md5sums=('49cb95c0eec47d3436c4fdf65e7c9d12'
         'a2ddeb1e79dff8d3fd702984c8d3aab5'
         '07657cfa71b1de1d008cc5e3ade9749b'
         '91a61c0f581ea27281bdaecb7a3cd58b'
         'b816c5f3ae2d6cd954c15569d4baf123')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  sed -i '1,1i#include <sys/types.h>' mrt/base_file.h
  patch -p1 <"$srcdir"/gcc-4.6.patch
  
  sed -i -r 's/Options/Variables/' 'SConstruct'
  sed -i -r 's/BoolOption/BoolVariable/' 'SConstruct'
  sed -i -r 's/EnumOption/EnumVariable/' 'SConstruct'
  sed -i -r 's/BuildDir/VariantDir/' 'SConstruct'
  sed -i -r 's/pow10f/exp10f/' 'clunk/source.cpp'

  python2 engine/sl08/sl08.py >engine/sl08/sl08.h
  scons2
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  mkdir -p "$pkgdir"/usr/share/btanks
  cp *.so btanks bted "$pkgdir"/usr/share/btanks/

  # Install script
  install -D -m755 "$srcdir"/bted_script "$pkgdir"/usr/bin/bted
  install -D -m755 "$srcdir"/btanks_script "$pkgdir"/usr/bin/btanks

  # Install desktop file
  install -D -m644 "$srcdir"/btanks_desktop "$pkgdir"/usr/share/applications/btanks.desktop

  # Install icon
  install -D -m644 "$srcdir"/$pkgname-$pkgver/data/tiles/icon.png "$pkgdir"/usr/share/pixmaps/btanks.png

  # Make settings saveable
  touch "$pkgdir"/usr/share/btanks/bt.xml
  chown :games "$pkgdir"/usr/share/btanks/bt.xml
  chmod 664 "$pkgdir"/usr/share/btanks/bt.xml

  # move executables, fix rpath
  cd "$pkgdir"/usr/share/btanks
  mkdir -p "$pkgdir"/usr/bin "$pkgdir"/usr/lib/btanks

  mv btanks "$pkgdir"/usr/bin/btanks-bin
  mv bted "$pkgdir"/usr/bin/bted-bin
  mv *.so "$pkgdir"/usr/lib/btanks/

  ln -s /usr/bin/btanks-bin ./btanks
  ln -s /usr/bin/bted-bin ./bted

  ls -1 "$pkgdir"/usr/lib/btanks/ | while read A; do
    ln -s /usr/lib/btanks/$A ./$A
  done

  chrpath -d "$pkgdir"/usr/bin/bted-bin
  chrpath -d "$pkgdir"/usr/bin/btanks-bin
  chrpath -d "$pkgdir"/usr/lib/btanks/*.so
}
