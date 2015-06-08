# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=openzone
pkgver=0.3.1
pkgrel=1
pkgdesc='Simple cross-platform FPS/RTS game engine'
url="http://ducakar.github.com/openzone/"
license=('GPL3')
arch=('i686' 'x86_64')
provides=('openzone-data')
conflicts=('openzone-data')
depends=('freeimage' 'libgl' 'libvorbis' 'lua' 'openal' 'physfs' 'sdl_ttf')
optdepends=('pulseaudio: warning bell for liboz'
	    'zip: for building ZIP game data archives'
	    'p7zip: for building 7zip game data archives')
makedepends=('cmake' 'doxygen' 'faad2' 'freeimage' 'gcc' 'git' 'graphviz'
             'libmad' 'libvorbis' 'lua' 'openal' 'physfs' 'sdl_ttf')
source=("https://github.com/downloads/ducakar/openzone/openzone-src-${pkgver}.tar.xz"
        "https://github.com/downloads/ducakar/openzone/openzone-data-${pkgver}.tar.xz")
sha1sums=('e09de161b1dc978f14232fb5d5bdcb8ec5083308'
	  '1154dd5af0b6236a30c1d230ad3009afff39c1d3')

build()
{
  mkdir -p ${srcdir}/build && cd ${srcdir}/build

   cmake \
     -D CMAKE_BUILD_TYPE=Release \
     -D CMAKE_INSTALL_PREFIX=/usr \
     -D OZ_SHARED_LIBOZ=0 \
     -D OZ_NONFREE=1 \
     ../openzone

  make doc
  make
}

package()
{
  cd ${srcdir}/build

  make install DESTDIR=${pkgdir}

  rm -rf ${pkgdir}/usr/{include,lib,lib64}

  cd ${srcdir}/openzone

  install -dm755 ${pkgdir}/usr/share/openzone
  install -m644 share/openzone/*.zip ${pkgdir}/usr/share/openzone

  install -dm755 ${pkgdir}/usr/share/doc/openzone
  install -m644 AUTHORS README.md ChangeLog.md BUGS.md doc/*.html ${pkgdir}/usr/share/doc/openzone
}
