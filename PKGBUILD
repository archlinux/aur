# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>
# Contributor: Hexchain Tong <i at hexchain dot org>

_pkgname=cairo
pkgname=cairo-coloredemoji
pkgver=1.14.8
pkgrel=1
pkgdesc="Cairo vector graphics library (patched with support for colored emoji)"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
# requires libGL + libEGL - all libgl variants (mesa, nvidia-xxx-libgl/nvidia-utils) provide libEGL
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman' 'glib2' 'libgl' 'lzo')
makedepends=('mesa-libgl' 'librsvg' 'gtk2' 'poppler-glib' 'libspectre' 'gtk-doc' 'valgrind' 'git')
             # for the test suite:
             #'ttf-dejavu' 'gsfonts' 'xorg-server-xvfb' ) # 'libdrm')
#optdepends=('xcb-util: for XCB backend') # really needed?
provides=('cairo-xcb' 'cairo')
replaces=('cairo-xcb' 'cairo')
conflicts=('cairo')
source=(http://cairographics.org/releases/cairo-$pkgver.tar.xz
        colored-emoji.patch)
sha1sums=('c6f7b99986f93c9df78653c3e6a3b5043f65145e'
          '929874e10c796b8795e679c44c0c2667c2f4ed8a')

prepare() {
    cd "$srcdir"
    patch -p1 -i colored-emoji.patch
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
