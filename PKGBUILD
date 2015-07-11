# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkgbasename=libxml
pkgname=lib32-$_pkgbasename
pkgver=1.8.17
pkgrel=1
pkgdesc="The XML C parser and toolkit of Gnome. Older version (32-bit)"
arch=(x86_64)
url="http://xmlsoft.org/"
license=('GPL')
depends=('lib32-zlib')
options=('!libtool')
source=("ftp://xmlsoft.org/libxml2/old/${_pkgbasename}-${pkgver}.tar.gz")
md5sums=('53846294aa850a7d042948176d1d19dc')

build() {
  
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  
  # build with -D_FORTIFY_SOURCE=2
  sed -i "s|\(O_WRONLY\))|\1, 0666)|" nanohttp.c

  sed -i -e "32c LT_INIT" -e "20c AM_INIT_AUTOMAKE([1.13 no-define foreign])" -e "3,4c AC_INIT(libxml, 1.8.17) \nAC_CONFIG_HEADERS([config.h])" configure.in
  autoreconf -fi

  ./configure --prefix=/usr --enable-static=no --libdir=/usr/lib32
  make
}

package() {
  cd "$srcdir/${_pkgbasename}-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
