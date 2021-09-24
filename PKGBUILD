# Maintainer : Achmad Fathoni <fathoni DOT id AT gmail DOT com>
# Contributor: Jonathon Fernyhough <jonathon_at manjaro dot_org>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=libxml
pkgver=1.8.17
pkgrel=4
pkgdesc="The XML C parser and toolkit of Gnome. Older version."
arch=(i686 x86_64)
url="http://xmlsoft.org/"
license=('GPL')
depends=('zlib')
options=('!libtool')
source=("http://xmlsoft.org/sources/old/${pkgname}-${pkgver}.tar.gz")
md5sums=('53846294aa850a7d042948176d1d19dc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # build with -D_FORTIFY_SOURCE=2
  sed -i "s|\(O_WRONLY\))|\1, 0666)|" nanohttp.c

  sed -i -e "32c LT_INIT" -e "20c AM_INIT_AUTOMAKE([1.13 no-define foreign])" -e "3,4c AC_INIT(libxml, 1.8.17) \nAC_CONFIG_HEADERS([config.h])" configure.in
  autoreconf -fi

  ./configure --prefix=/usr --enable-static=no
  sed -i 's/-Werror=format-security//g' Makefile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
