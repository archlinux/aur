# Maintainer:  Mateusz Ziemła <mtizim+aur@pm.me>
# Contributor: Jaroslv Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>

pkgname=gdmap
pkgver=0.8.1
pkgrel=7
pkgdesc="Tool to inspect the used space of folders."
arch=('x86_64')
url="http://gdmap.sourceforge.net"
license=('GPL')
depends=('gtk2' 'glib2' 'libxml2')
makedepends=('gettext' 'intltool')
source=(https://downloads.sourceforge.net/sourceforge/gdmap/${pkgname}-${pkgver}.tar.gz
        gtk-fix.patch)
sha256sums=('a200c98004b349443f853bf611e49941403fce46f2335850913f85c710a2285b'
            'ca88b75a030adfa37907266a12fd63d019c70f34885487f62e176741ca2af8da')

build() {
  cd $pkgname-$pkgver

  cd src
# fix deprecated gtk macros call
  patch -Np0 -i ../../gtk-fix.patch
# fix linking
  sed -i -e 's/@LIBXML_LIBS@/@LIBXML_LIBS@ -lm/g' Makefile.in
  cd ..

  CFLAGS=-Wno-error ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
