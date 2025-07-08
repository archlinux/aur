# Maintainer: Serhiy Reshetyuk <reshtnk7@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Claudio Sabattoli <gasherbrum3@alice.it>
# Contributor: Ole Ernst <olebowle@gmx.com>

pkg=idesk
pkgname=$pkg-deb
pkgver=0.7.5
pkgrel=9
pkgdesc="gives users of minimal wm's (fluxbox, blackbox, openbox, windowmaker...) icons on their desktop"
arch=('x86_64' 'i686')
url="https://sourceforge.net/projects/idesk/"
license=('GPL / BSD')
depends=('automake' 'gcc-libs' 'pkgconfig' 'libice' 'imlib2' 'librsvg' 'libsm' 'libxft' 'xorg-server')
conflicts=('idesk')
source=("git+https://salsa.debian.org/debian/idesk#tag=debian/$pkgver-$pkgrel"
	'archlinux-bugAbstactIconConfig.patch')
sha256sums=('SKIP'
	'a9ec1631376b983bff793c4faa276622cc1218f11f6dd90db9238c3496e472cd')

prepare() {
  cd $pkg
  patch -p1 -b  <../../archlinux-bugAbstactIconConfig.patch
  patch -p1 -b  <debian/patches/10-bug-552572.patch
  patch -p1 -b  <debian/patches/20-sys-stat.patch
  patch -p1 -b  <debian/patches/30_imlib2_pkg_config.diff
  patch -p1 -b  <debian/patches/40_cross.patch
  patch -p1 -b  <debian/patches/50_missing_sentinel.patch
  autoreconf -fiv
  sed -i \
    -e 's#IMLIB_CFLAGS=.*#IMLIB_CFLAGS="-I/usr/include"#g' \
    -e 's#IMLIB_LIBS=.*#IMLIB_LIBS="-L/usr/lib -lImlib2"#g' \
    configure
 }

build() {
  cd $pkg
  ./configure --prefix=/usr\
	  --enable-libsn\
	  --enable-svg\
	  --enable-shape\
	  --enable-xft
  make
}

package() {
  cd $pkg
  make DESTDIR="$pkgdir" install
}

