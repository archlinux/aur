# Contributor: 3ED <krzysztof1987@gmail.com>
# Thanks for mail and pkgbuild rabyte..

pkgname=gnaughty
pkgver=1.2.5
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="A program to automatically download adult content from internet directories (gtk2)"
url="http://gnaughty.sourceforge.net/"
license=('GPL')
makedepends=('make' 'pkgconfig>=0.9')
depends=('gconf>=2' 'libglade>=2' 'curl')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        10-curl-remove_deprecated_header.patch
        20-fix_links_parser.patch)
sha256sums=('f9773837cb79290117678aa5eaf4ae288e28cff5b25f64e0d0d87b15019e9c53'
            '4e50f2c6f8895ecfd827e75faa722f394bbe4b881d1c0cd266738f2265da7de6'
            'be4616577e8282ed56e424ed1c7956183449d854c8faec2fd7262a1d7b3293ea')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	sed 's|GCONF_CONFIG_SOURCE|# GCONF_CONFIG_SOURCE|g' -i Makefile.in
  patch -Np0 -i "$srcdir/10-curl-remove_deprecated_header.patch"
  patch -Np0 -i "$srcdir/20-fix_links_parser.patch"

  export LIBS=" -lgthread-2.0"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--with-gconf-schema-file-dir=/usr/share/gconf/schemas \
		--disable-schemas-install
	make
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
