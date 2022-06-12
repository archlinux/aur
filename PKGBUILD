# Maintainer : trya <tryagainprod@gmail.com>
# Contributor : Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor : fredbezies <fredbezies at gmail dot com>

pkgname=lib32-libpng14
_realname=libpng
pkgver=1.4.22
_apngver=1.4.22
pkgrel=2
pkgdesc="A collection of routines used to create PNG format graphics files - 1.4 version (32-bits)"
arch=('x86_64')
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=('lib32-zlib' 'lib32-gcc-libs')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/$_realname/libpng-${pkgver}.tar.xz"
"http://downloads.sourceforge.net/sourceforge/libpng-apng/libpng14/$pkgver/libpng-${_apngver}-apng.patch.gz")
md5sums=('ce716e09b0ac345f7013023bf7196d8f'
         'd4320433418bce7d595765e9828d453f')
build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"

  cd "${srcdir}/${_realname}-${pkgver}"
  patch -p1 -i "${srcdir}/libpng-${_apngver}-apng.patch"
  libtoolize --force --copy

  # Workaround for Autoconf 1.13.x
  sed 's|AM_CONFIG_HEADER(config.h)|AC_CONFIG_HEADERS([config.h])|g' -i configure.ac

  aclocal
  autoconf
  automake --add-missing
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
  rm -rf "${pkgdir}"/usr/lib32/{libpng.so,libpng.a}
  rm -fr "${pkgdir}"/usr/lib32/pkgconfig/libpng.pc
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
