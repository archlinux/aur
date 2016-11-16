# Maintainer: Michael Straube <michael_straube@web.de>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Jason Melton <jason.melton@gmail.com>

pkgname=stuntrally
pkgver=2.6
pkgrel=1
pkgdesc="A 3D racing game based on VDrift and OGRE with track editor"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/stuntrally/stuntrally"
depends=('ogre>=1.9' 'mygui' 'sdl2' 'libvorbis' 'enet' 'bullet' 'openal' 'hicolor-icon-theme')
makedepends=('cmake' 'boost')
source=("stuntrally-$pkgver.tar.gz::https://github.com/stuntrally/stuntrally/archive/$pkgver.tar.gz"
        "tracks-$pkgver.tar.gz::https://github.com/stuntrally/tracks/archive/$pkgver.tar.gz"
        "bullet-2.84+.patch"
        "gcc-6.patch")
sha1sums=('730da7d909df08ff203109be9972d6e352c1c420'
          'f6ea70030d9d21e6bc9c015379f1ccd257a72631'
          '40fdc27fbbc1422bfc89516042e51a3c44b2195c'
          '15bbedd295414e191cf93d7278c79bf8c35ec809')

prepare() {
  cd $pkgname-$pkgver

  # https://github.com/stuntrally/stuntrally/commit/58e9d66
  patch -p1 -i ../bullet-2.84+.patch
  patch -p1 -i ../gcc-6.patch
}

build() {
  cd $pkgname-$pkgver

  mkdir data/tracks
  cp -r ../tracks-$pkgver/* data/tracks

  mkdir build && cd build

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
  install -m 644 ../data/gui/stuntrally.png "$pkgdir"/usr/share/pixmaps
  install -m 644 ../data/gui/sr-editor.png "$pkgdir"/usr/share/pixmaps
}
