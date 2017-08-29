# $Id: PKGBUILD 272756 2016-07-31 10:13:10Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo-infinality-ultimate
_name=cairo
pkgver=1.14.10
pkgrel=1
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

source=(http://cairographics.org/releases/cairo-$pkgver.tar.xz
        cairo-make-lcdfilter-default.patch
        cairo-respect-fontconfig_pb.patch
        cairo-server-side-gradients.patch
        cairo-webkit-html5-fix.patch
	cairo-color-glyphs.patch)
sha1sums=('28c59d85d6b790c21b8b59ece73a6a1dda28d69a'
          'b0cc2466cc5479f055ca2148cfa37fe13a1e78a6'
          'd8ffcb4c4745f7e61671109362a80a872ac989d3'
          '72ecf2dda8462e1588512de257ccbe18642d507f'
          '5bff494f52a16114f4cf6d04bfb0b9d7c4e9da23'
          'c25463ce365627ba55a2614d4542e17ca6ac7d51')

prepare(){
  cd $_name-$pkgver

  patch -Np1 -i "${srcdir}"/cairo-make-lcdfilter-default.patch
  patch -Np1 -i "${srcdir}"/cairo-respect-fontconfig_pb.patch
  patch -Np1 -i "${srcdir}"/cairo-server-side-gradients.patch
  patch -Np1 -i "${srcdir}"/cairo-webkit-html5-fix.patch
  patch -Np1 -i "${srcdir}"/cairo-color-glyphs.patch
}

build() {
  cd $_name-$pkgver
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
  --enable-qt \
	--enable-gtk-doc
	
	#--disable-xlib-xcb \
	#--enable-test-surfaces \ takes ages
	#--enable-drm # breaks build
	
  make
}

#check() {
#  cd $_name-$pkgver
#  make -j4 -k test || /bin/true
#}

package() {
  cd $_name-$pkgver
  make DESTDIR="$pkgdir" install
}
