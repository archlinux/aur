# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=clanlib10
pkgver=1.0.0
pkgrel=2
pkgdesc="A multi-platform game development library (legacy version)"
arch=('i686' 'x86_64')
url="http://clanlib.org/"
license=('zlib')
depends=('alsa-lib' 'libjpeg' 'libmikmod' 'libpng12'
         'libvorbis' 'libxi' 'libxxf86vm' 'mesa' 'sdl_gfx' 'glu')
conflicts=('clanlib' 'clanlib-svn')
options=('!libtool')
source=("http://clanlib.org/download/releases-1.0/ClanLib-${pkgver}.tgz")
md5sums=('281e64a463155474d0f1270686286811')

build() {
  cd "${srcdir}/ClanLib-${pkgver}"

  # Fix for libpng 1.2
  sed -i "s_-lpng_-lpng12_" configure.ac
  sed -i "s_<png.h>_<libpng12/png.h>_" Sources/Display/Providers/png_provider_generic.h

  # Fix compilation errors
  sed -i "51i#include <cstdio>" Sources/GL/canvas_opengl.cpp
  sed -i "38i#include <cstdio>" Sources/GL/GLX/input_device_linuxevent.cpp
  sed -i "32i#include <cstdio>" Sources/GL/GLX/input_device_xinput.cpp

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/ClanLib-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Install a license file
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
