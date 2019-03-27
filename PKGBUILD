# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=vmoviedb
pkgver=0.1.5
pkgrel=9
pkgdesc="Movie collection manager for the Gnome desktop"
arch=('x86_64')
url="https://sourceforge.net/projects/vmoviedb/"
license=('GPL')
depends=('gconf' 'libglade')
makedepends=('intltool' 'rarian')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        drop-libgnomeui.patch
        fix-gconf-schema.patch)
sha256sums=('3b78d8b0f15b9c206de14e449232f7f8ae179a7f2515cacfcbdd09c29cd11e19'
            'f529b23216c5aa6d80a42f703c1bbc35898ebf9323c85596efcc2bdb9244adeb'
            '1875bd94220b287212a3583e16382de5bca7b2f8bc3b187fce8d6638873b99f7')

prepare() {
  cd "$srcdir"/vmoviedb-$pkgver

  # Remove libgnomeui dependency
  patch -Np1 -i ../drop-libgnomeui.patch

  # Fix gconf schema
  patch -Np1 -i ../fix-gconf-schema.patch

  # Fix install paths
  sed -i 's|vmoviedbdocdir = ${prefix}/doc/vmoviedb|vmoviedbdocdir = $(datadir)/doc/vmoviedb|' Makefile.am
  sed -i 's|schemasdir = $(sysconfdir)/gconf/schemas|schemasdir = $(GCONF_SCHEMA_FILE_DIR)|' data/Makefile.am

  autoreconf -fi
  intltoolize --force
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-schemas-install \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
