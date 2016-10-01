# Maintainer: lks <lukas dot graetz et web dot de>
# based on cairo PKGBUILD by: Jan de Groot <jgc@archlinux.org>

pkgname=cairo-dfb
_pkgname=cairo
pkgver=1.14.6
pkgrel=2
pkgdesc="Cairo vector graphics library with directfb backend"
arch=(i686 x86_64 armv7h)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
# requires libGL + libEGL - all libgl variants (mesa, nvidia-xxx-libgl/nvidia-utils) provide libEGL
depends=('directfb' 'libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman' 'glib2' 'libgl' 'lzo2')
makedepends=('mesa-libgl' 'librsvg' 'gtk2' 'poppler-glib' 'libspectre' 'valgrind' 'git')
             # for the test suite:
#             'ttf-dejavu' 'gsfonts' 'xorg-server-xvfb' ) # 'libdrm')
#optdepends=('xcb-util: for XCB backend') # really needed?
provides=('cairo-xcb' "cairo=${pkgver}")
replaces=('cairo-xcb')
conflicts=('cairo')
source=(http://cairographics.org/releases/$_pkgname-$pkgver.tar.xz)
sha1sums=('0a59324e6cbe031b5b898ff8b9e2ffceb9d114f5')

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
	--enable-directfb #\
	# --enable-gtk-doc
	
	#--disable-xlib-xcb \
	# --enable-test-surfaces \ takes ages
	#--enable-drm # breaks build
	
  make
}

#check() {
#  cd $_pkgname-$pkgver
#  make -k test || /bin/true
#  
#  # results:
#  # 1.12.8-1	# 162 Passed, 328 Failed [8 crashed, 10 expected], 26 Skipped
#  # 1.12.12-2:	# 29 Passed, 464 Failed [460 crashed, 2 expected], 26 Skipped
#  # 1.12.16-1:	144 Passed, 364 Failed [6 crashed, 12 expected], 27 Skipped
#
#}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
