# $Id: PKGBUILD 233413 2015-03-12 21:33:59Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Maarten de Boer <maarten@ikfixjewebstek.nl>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo-infinality-lcdfilter
pkgver=1.14.6
pkgrel=2
pkgdesc="Cairo vector graphics library patched with infinality patches"
arch=(i686 x86_64 armv7h)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
makedepends=('libgl' 'librsvg' 'gtk2' 'poppler-glib' 'libspectre' 'gtk-doc' 'valgrind' 'git')
             # for the test suite:
             #'ttf-dejavu' 'gsfonts' 'xorg-server-xvfb' ) # 'libdrm')
#optdepends=('xcb-util: for XCB backend') # really needed?
provides=(
	"cairo-xcb=$pkgver"
	"cairo=$pkgver")
conflicts=("cairo")
replaces=('cairo-xcb')
source=(
	"http://cairographics.org/releases/cairo-$pkgver.tar.xz"
	"cairo-respect-fontconfig_pb.patch"
	"cairo-server-side-gradients.patch"
	"cairo-webkit-html5-fix.patch"
        "cairo-lcdfilter-make-default-default.patch")
sha1sums=('0a59324e6cbe031b5b898ff8b9e2ffceb9d114f5'
          'd8ffcb4c4745f7e61671109362a80a872ac989d3'
          '72ecf2dda8462e1588512de257ccbe18642d507f'
          '5bff494f52a16114f4cf6d04bfb0b9d7c4e9da23'
          'b0cc2466cc5479f055ca2148cfa37fe13a1e78a6')

build() {
	cd "$srcdir/cairo-$pkgver"

	patch -Np1 -i ../cairo-respect-fontconfig_pb.patch
	patch -Np1 -i ../cairo-server-side-gradients.patch
	patch -Np1 -i ../cairo-webkit-html5-fix.patch
	patch -Np1 -i ../cairo-lcdfilter-make-default-default.patch

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
	cd "$srcdir/cairo-$pkgver"
	#make -j1 -k test || /bin/true
}

package() {
	cd "$srcdir/cairo-$pkgver"
	make DESTDIR="$pkgdir" install
}
