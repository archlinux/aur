# Maintainer:
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Jason Melton <jason.melton@gmail.com>

pkgname=stuntrally
pkgver=2.6
pkgrel=5
pkgdesc="A 3D racing game based on VDrift and OGRE with track editor"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://stuntrally.tuxfamily.org"
depends=('ogre-1.9' 'mygui-ogre1.9' 'sdl2' 'libvorbis' 'enet' 'bullet' 'openal' 'hicolor-icon-theme')
makedepends=('cmake' 'boost')
source=("stuntrally-$pkgver.tar.gz::https://github.com/stuntrally/stuntrally/archive/$pkgver.tar.gz"
        "stuntrally-tracks-$pkgver.tar.gz::https://github.com/stuntrally/tracks/archive/$pkgver.tar.gz"
        "stuntrally-bullet-2.84+.patch"
        "stuntrally-gcc-6.patch"
        "stuntrally"
        "sr-editor")
sha256sums=('8cc309d27d26f78dcc596440547d68b5e41d02ef830df2d52d38611d45ebbaca'
            '4bce700516a2a178ac04cfbf7df2887ba42225802f5a3e670f770ea01345687b'
            'af250a702886de0210516f28c8babc5c20d9cb42eda516cc808a43fa25df6d41'
            '0b66fa790aac2b6f06739ea1c1dad317fbbf6ddc394bef9fe33f2c77a58126d4'
            '2d0e98918dd5fda632ce266fc155d29cfa6b8767f9decbd51f4b12934710ffaf'
            'bbb9a3061eede46298974951199465112425ac2eacb8dceff5a58c0dc5ea404b')

prepare() {
  cd $pkgname-$pkgver

  # https://github.com/stuntrally/stuntrally/commit/58e9d66
  patch -p1 -i ../stuntrally-bullet-2.84+.patch

  # https://github.com/stuntrally/stuntrally/commit/f7703d8
  patch -p1 -i ../stuntrally-gcc-6.patch

  # copy tracks into source directory
  mkdir data/tracks
  cp -r ../tracks-$pkgver/* data/tracks

  mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  export PKG_CONFIG_PATH="/opt/OGRE-1.9/lib/pkgconfig:/opt/MyGUI-OGRE1.9/lib/pkgconfig:$PKG_CONFIG_PATH"

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DSHARE_INSTALL=share/stuntrally \
    -DBUILD_EDITOR=ON
  make
}

package() {
  cd $pkgname-$pkgver/build

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir"/usr/share/pixmaps
  install -m 644 ../data/gui/{stuntrally,sr-editor}.png "$pkgdir"/usr/share/pixmaps

  install -d "$pkgdir"/usr/lib/stuntrally
  mv "$pkgdir"/usr/bin/{stuntrally,sr-editor} "$pkgdir"/usr/lib/stuntrally
  install -m 755 ../../{stuntrally,sr-editor} "$pkgdir"/usr/bin
}
