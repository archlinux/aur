# $Id: PKGBUILD 272756 2016-07-31 10:13:10Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo-infinality-ultimate
_name=cairo
pkgver=1.15.12
pkgrel=1
pkgdesc="Cairo vector graphics library"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
groups=('infinality-bundle')
# requires libGL + libEGL - all libgl variants (mesa
depends=('libpng' 'libxrender' 'libxext' 'fontconfig-infinality-ultimate' 'pixman' 'glib2' 'libgl' 'lzo')
makedepends=('libgl' 'librsvg' 'gtk2' 'poppler-glib' 'libspectre' 'gtk-doc' 'valgrind' 'git')
provides=('cairo-xcb' 'cairo')
replaces=('cairo-xcb')
conflicts=('cairo' 'cairo-cleartype' 'cairo-git' 'cairo-ocaml-git' 'cairo-ubuntu')

source=("git+https://anongit.freedesktop.org/git/cairo#tag=$pkgver"
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
  --disable-lto \
	--enable-gl \
	--enable-egl \
	--enable-svg \
	--enable-ps \
	--enable-pdf \
	--enable-gobject \
	--enable-gtk-doc
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool	
  make
}

package() {
  cd $_name
  make DESTDIR="$pkgdir" install
}
