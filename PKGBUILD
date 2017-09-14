# $Id: PKGBUILD 272756 2016-07-31 10:13:10Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo-infinality-ultimate
_name=cairo
pkgver=1.15.8
pkgrel=3
pkgdesc="Cairo vector graphics library"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
groups=('infinality-bundle')
# requires libGL + libEGL - all libgl variants (mesa
depends=('libpng' 'libxrender' 'libxext' 'fontconfig-infinality-ultimate' 'pixman' 'glib2' 'libgl' 'lzo')
makedepends=('mesa-libgl' 'librsvg' 'gtk2' 'poppler-glib' 'libspectre' 'gtk-doc' 'valgrind' 'git')
             # for the test suite:
             #'ttf-dejavu' 'gsfonts' 'xorg-server-xvfb' ) # 'libdrm')
#optdepends=('xcb-util: for XCB backend') # really needed?
provides=('cairo-xcb' 'cairo')
replaces=('cairo-xcb')
conflicts=('cairo' 'cairo-cleartype' 'cairo-git' 'cairo-gl-git' 'cairo-glitz' 'cairo-ocaml-git' 'cairo-small' 'cairo-ubuntu')

source=("git+https://anongit.freedesktop.org/git/cairo#tag=1.15.8"
        cairo-make-lcdfilter-default.patch
        cairo-respect-fontconfig_pb.patch
        cairo-server-side-gradients.patch
        cairo-webkit-html5-fix.patch)
sha1sums=('SKIP'
          'b0cc2466cc5479f055ca2148cfa37fe13a1e78a6'
          'd8ffcb4c4745f7e61671109362a80a872ac989d3'
          '72ecf2dda8462e1588512de257ccbe18642d507f'
          '5bff494f52a16114f4cf6d04bfb0b9d7c4e9da23')

prepare(){
  cd $_name

  patch -Np1 -i "${srcdir}"/cairo-make-lcdfilter-default.patch
  patch -Np1 -i "${srcdir}"/cairo-respect-fontconfig_pb.patch
  patch -Np1 -i "${srcdir}"/cairo-server-side-gradients.patch
  patch -Np1 -i "${srcdir}"/cairo-webkit-html5-fix.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_name
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
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

#check() {
#  cd $_name
#  make -j4 -k test || /bin/true
#}

package() {
  cd $_name
  make DESTDIR="$pkgdir" install
}
