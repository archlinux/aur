# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=oggvideotools
pkgver=0.8a
pkgrel=1
pkgdesc="A collection of tools for manipulating Ogg video files"
arch=('i686' 'x86_64')
url="http://dev.streamnik.de/oggvideotools.html"
license=('GPL')
depends=('gd' 'libtheora' 'libvorbis' 'sdl')
makedepends=('cmake' 'pkgconfig')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('e7fcfcc4e91187f7a2ca4aea26c2ce64')

build() {
  cd $pkgname-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver

  for _f in Cat Cut Dump Length Silence Slideshow Transcode; do
    sed -i '24a #else' ./src/ogg${_f}.cpp
    sed -i '25a #include <unistd.h>' ./src/ogg${_f}.cpp
  done

  make DESTDIR="${pkgdir}" install
#man pages location fix
  install -d "${pkgdir}"/usr/share
  mv "${pkgdir}"/usr/man "${pkgdir}"/usr/share
}
