# $Id
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Brice Carpentier <brice.carpentier@orange.fr>
# Contributoe: Andrew <darkseed2007@yandex.ru>

pkgname=loudmouth-ossl
pkgver=1.4.3
pkgrel=5
pkgdesc="A lightweight Jabber client library written in C/Glib. Build with OpenSSL instead of gnutsl (build with gnutls don't work with latest mcabber)"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://groups.google.com/group/loudmouth-dev"
depends=('glib2' 'openssl' 'libidn')
conflicts=(loudmouth)
options=('!libtool')
makedepends=('intltool' 'pkgconfig' 'gtk-doc')
source=(http://ftp.gnome.org/pub/gnome/sources/loudmouth/1.4/loudmouth-${pkgver}.tar.bz2
        01-fix-sasl-md5-digest-uri.patch
        03-drop-stanzas-on-fail.patch
        07-glib-single-include.patch
        08-fix-ipv6-connect.patch)
md5sums=('55339ca42494690c3942ee1465a96937'
         'dc799cea18b24847b1e008c7424010a3'
         'b7b2d81b01a5eee5fd5e21cae67b4af7'
         'd1546ed54740de536f6bb79a18c5dccb'
         '8e3071299776d32b9be27bba7d3f9ae0')

prepare() {
  cd "${srcdir}/loudmouth-${pkgver}"
  patch -Np1 -i ../01-fix-sasl-md5-digest-uri.patch
  patch -Np1 -i ../03-drop-stanzas-on-fail.patch
  patch -Np1 -i ../07-glib-single-include.patch
  patch -Np1 -i ../08-fix-ipv6-connect.patch
  libtoolize --force
  aclocal
  autoconf
  automake --add-missing
}
build() {
  cd "${srcdir}/loudmouth-${pkgver}"
  ./configure --prefix=/usr --disable-static --with-ssl=openssl
  make
}

package() {
  cd "${srcdir}/loudmouth-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
