# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Popolon <popolon@popolon.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Rafael Ferreira <josephgbr@archlinux.info>

pkgname=libgnomeprint
pkgver=2.18.8
pkgrel=10
pkgdesc='Printing routines for GNOME'
url='http://www.gnome.org/'
arch=('x86_64' 'i686')
license=('LGPL' 'GPL')
depends=('pango' 'libart-lgpl' 'libxml2' 'libgnomecups')
makedepends=('intltool' 'pkgconfig' 'addinclude')
replaces=('libgnomeprint-cups')
conflicts=('libgnomeprint-cups')
options=('!libtool')
source=("http://ftp.gnome.org/pub/gnome/sources/$pkgname/2.18/$pkgname-$pkgver.tar.bz2"
	"https://gitweb.gentoo.org/repo/gentoo.git/plain/gnome-base/libgnomeprint/files/libgnomeprint-2.18.8-bison3.patch?id=56bd759df1d0c750a065b8c845e93d5dfa6b549d"
        "patch-freetype-2.5.1.diff"
        "configure.in.patch")
sha256sums=('1034ec8651051f84d2424e7a1da61c530422cc20ce5b2d9e107e1e46778d9691'
            'f90696e4ee1f4fb49bd3a3fe62e3443efef6f4918aeaf7586cab692a035463c3'
            '2f563a5fd6917d506cc11a5e22d09225e161d3bfe747fb6021338e623ed0c844'
            '9334858ec6aa62582a0cdbaa23c6f0dcb436e8f0292ab8a7663790378b73c61f')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p0 -i "$srcdir/patch-freetype-2.5.1.diff"
  patch --forward --strip=1 --input="${srcdir}/configure.in.patch"
  addinclude "$pkgname/modules/cups/gnome-print-cups-transport.c" stdio
  autoconf
  cd "$srcdir"
  patch -p0 -i libgnomeprint-2.18.8-bison3.patch?id=56bd759df1d0c750a065b8c845e93d5dfa6b549d

}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --disable-static --enable-gtk-doc=no
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
