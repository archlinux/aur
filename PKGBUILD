# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_ com>

pkgname=btanks
pkgver=0.9.8083
pkgrel=10
pkgdesc="Fast 2d tank arcade game with multiplayer and split-screen modes."
arch=('x86_64')
url="https://${pkgname}.sourceforge.net"
license=('GPL-2.0-only')
depends=('expat' 'libgl' 'libsigc++2.0' 'libvorbis' 'lua51' 'openal' 'sdl' 'sdl_image'
	 'smpeg0' 'glu' "${pkgname}-data=$pkgver")
makedepends=('scons2' 'chrpath' 'mesa')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-$pkgver.tar.bz2"
	${pkgname}_desktop
	${pkgname}_script
	bted_script
	gcc-4.6.patch)
install=${pkgname}.install
sha256sums=('3fd2ce6a2b45f7a60c3b114fa9aff13cb3dd9fbb6a65cdc9798b76c4fa2c4341'
            '1e886fd87aed83ad628e412a3d311d59bd7a747701635dc6bc79c055a4b6b845'
            '9698b21c33f425e615818b9dfca2ffe7a19cacebc94f3965203d52f46705bd95'
            '29417bc87cc97760d682ea5e996a3d29a355c60f4e5ac02174c2adc5ff674cff'
            '61e9430ef57d91b3beaef10c5b882a113878af244a1130d71f2611767a4bf82a')

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

  mkdir -p "$pkgdir"/usr/share/games/${pkgname}
  cp *.so ${pkgname} bted "$pkgdir"/usr/share/games/${pkgname}/

  # Install script
  install -D -m755 "$srcdir"/bted_script "$pkgdir"/usr/bin/bted
  install -D -m755 "$srcdir"/${pkgname}_script "$pkgdir"/usr/bin/${pkgname}

  # Install desktop file
  install -D -m644 "$srcdir"/${pkgname}_desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop

  # Install icon
  install -D -m644 "$srcdir"/$pkgname-$pkgver/data/tiles/icon.png "$pkgdir"/usr/share/pixmaps/${pkgname}.png

  # Make settings saveable
  touch "$pkgdir"/usr/share/games/${pkgname}/bt.xml
  chmod 664 "$pkgdir"/usr/share/games/${pkgname}/bt.xml

  # move executables, fix rpath
  cd "$pkgdir"/usr/share/games/${pkgname}
  mkdir -p "$pkgdir"/usr/bin "$pkgdir"/usr/lib/${pkgname}

  mv -f ${pkgname} "$pkgdir"/usr/bin/${pkgname}-bin
  mv -f bted "$pkgdir"/usr/bin/bted-bin
  mv -f *.so "$pkgdir"/usr/lib/${pkgname}/

  ln -s /usr/bin/${pkgname}-bin ./${pkgname}
  ln -s /usr/bin/bted-bin ./bted

  ls -1 "$pkgdir"/usr/lib/${pkgname}/ | while read A; do
    ln -s /usr/lib/${pkgname}/$A ./$A
  done

  chrpath -d "$pkgdir"/usr/bin/bted-bin
  chrpath -d "$pkgdir"/usr/bin/${pkgname}-bin
  chrpath -d "$pkgdir"/usr/lib/${pkgname}/*.so
}
