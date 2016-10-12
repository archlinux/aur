# $Id: PKGBUILD 255758 2015-12-10 19:51:44Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>
# Contributor: Hexchain Tong <i at hexchain dot org>
# Contributor: Hui Yiqun <huiyiqun@gmail.com>

_pkgname=cairo
pkgname=cairo-infinality-ultimate-with-colored-emoji
pkgver=1.14.6
pkgrel=2
pkgdesc="Cairo vector graphics library (patched with support for colored emoji and infinality)"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
# requires libGL + libEGL - all libgl variants (mesa, nvidia-xxx-libgl/nvidia-utils) provide libEGL
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman' 'glib2' 'libgl' 'lzo')
makedepends=('mesa-libgl' 'librsvg' 'gtk2' 'poppler-glib' 'libspectre' 'gtk-doc' 'valgrind' 'git')
             # for the test suite:
             #'ttf-dejavu' 'gsfonts' 'xorg-server-xvfb' ) # 'libdrm')
#optdepends=('xcb-util: for XCB backend') # really needed?
provides=('cairo-xcb' 'cairo' 'cairo-infinality-ultimate')
replaces=('cairo-xcb' 'cairo' 'cairo-infinality-ultimate')
conflicts=('cairo')
source=(http://cairographics.org/releases/cairo-$pkgver.tar.xz
        cairo-make-lcdfilter-default.patch
        cairo-respect-fontconfig_pb.patch
        cairo-server-side-gradients.patch
        cairo-webkit-html5-fix.patch
        colored-emoji.patch
        colored-emoji.patch)
sha1sums=('0a59324e6cbe031b5b898ff8b9e2ffceb9d114f5'
          'b0cc2466cc5479f055ca2148cfa37fe13a1e78a6'
          'd8ffcb4c4745f7e61671109362a80a872ac989d3'
          '72ecf2dda8462e1588512de257ccbe18642d507f'
          '5bff494f52a16114f4cf6d04bfb0b9d7c4e9da23'
          'a61749125438a700056e235327f069729a03aec0'
          'a61749125438a700056e235327f069729a03aec0')

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 < ../cairo-make-lcdfilter-default.patch
  patch -p1 < ../cairo-respect-fontconfig_pb.patch
  patch -p1 < ../cairo-server-side-gradients.patch
  patch -p1 < ../cairo-webkit-html5-fix.patch
  patch -p1 < ../colored-emoji.patch
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--disable-lto \
	--enable-tee \
	--enable-gl \
	--enable-egl \
	--enable-svg \
	--enable-ps \
	--enable-pdf \
	--enable-gobject \
	--enable-gtk-doc
	
	#--disable-xlib-xcb \
	#--enable-test-surfaces \ takes ages
	#--enable-drm # breaks build
	
  make
}

check() {
  cd $_pkgname-$pkgver
  #make -j1 -k test || /bin/true
  
  # results:
  # 1.12.8-1	# 162 Passed, 328 Failed [  8 crashed, 10 expected], 26 Skipped
  # 1.12.12-2:	#  29 Passed, 464 Failed [460 crashed,  2 expected], 26 Skipped
  # 1.12.16-1:	# 144 Passed, 364 Failed [  6 crashed, 12 expected], 27 Skipped
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
