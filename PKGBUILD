# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=oggvideotools
pkgver=0.9.1
pkgrel=1
pkgdesc="A collection of tools for manipulating Ogg video files"
arch=('i686' 'x86_64')
url="http://dev.streamnik.de/oggvideotools.html"
license=('GPL')
depends=('gd' 'libtheora' 'libvorbis' 'sdl')
makedepends=('cmake' 'pkgconfig' 'boost')
source=(https://downloads.sourceforge.net/oggvideotools/oggvideotools-$pkgver.tar.bz2)
sha256sums=('d9dbf7897b7cea98612209d80b9127473c97d6ee6cb0dccfc2b38fe3e8e29523')

prepare() {
  [[ -d build ]] && rm -rf build
  mkdir build

  sed -i '8i #include <cstring>' oggvideotools-0.9.1/src/base/test/decoderTest.cpp
}

build() {
  cd build

  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build

  make DESTDIR="$pkgdir" install

  # /usr/sbin is a symlink to /usr/bin
  mv "$pkgdir"/usr/sbin/* "$pkgdir"/usr/bin
  rm -r "$pkgdir"/usr/sbin

  # man pages location fix
  install -d "$pkgdir"/usr/share
  mv "$pkgdir"/usr/man "$pkgdir"/usr/share
}
