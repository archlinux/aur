# $Id: PKGBUILD 90017 2013-05-06 19:36:41Z foutrelis $
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Maintainer: Eric Bélanger <eric@archlinux.org>

# ALARM: Kevin Mihelich <kevin@archlinuxarm.org>
#  - disable mesa, add rules for our architectures

# Modified for raspberry pi by Grey Christoforo <first name [at] last name [dot] net>

pkgname=directfb-rbp
pkgver=1.7.7
pkgrel=1
pkgdesc="A thin library that provides hardware graphics acceleration, input device handling and abstraction, integrated windowing system on top of the Linux Framebuffer Device"
arch=('armv6h' 'armv7h')
url="http://www.directfb.org"
provides=('directfb')
replaces=('directfb')
license=('LGPL')
depends=('gcc-libs' 'libjpeg' 'sdl' 'libpng' 'freetype2')
source=(http://sources.buildroot.net/DirectFB-1.7.7.tar.gz)
#source=(http://www.directfb.org/downloads/Core/DirectFB-${pkgver%.*}/DirectFB-${pkgver}.tar.gz)
sha1sums=('205d824906906303db9b096cc2d3bea0662e8860')

build() {
  cd DirectFB-${pkgver}

  export EGL_CFLAGS="-I/opt/vc/include -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux"
  export EGL_LIBS="-lEGL -lGLESv2 -lbcm_host -lvcos -L/opt/vc/lib"
  DRIVERS="gles2 --enable-egl"
  sed -i 's/-Werror-implicit-function-declaration//g' configure

  ./configure --prefix=/usr --sysconfdir=/etc --enable-static --disable-silent-rules \
    --enable-zlib --enable-x11 --enable-sdl --disable-vnc --disable-osx \
    --enable-video4linux2 --enable-fbdev --disable-mesa --with-gfxdrivers=$DRIVERS
  make
} 

package() {
  cd DirectFB-${pkgver}
  make DESTDIR="${pkgdir}" install
}
