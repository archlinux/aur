# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.8.0
pkgrel=1
pkgdesc="XML parsing library, version 2"
arch=(i686 x86_64)
license=('custom')
depends=('zlib>=1.2.4' 'readline>=6.1' 'ncurses>=5.7' 'xz')
makedepends=('python2')
options=('!libtool')
url="http://www.xmlsoft.org/"
source=(ftp://ftp.xmlsoft.org/${pkgname}/${pkgname}-${pkgver}.tar.gz
        http://www.w3.org/XML/Test/xmlts20080205.tar.gz)
md5sums=('c62106f02ee00b6437f0fb9d370c1093'
         'b255be9a1c7f7021e52448e4ec8d7a0d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -e 's|/usr/bin/python -u|/usr/bin/python2 -u|g' -e 's|/usr/bin/python$|/usr/bin/python2|g' -i python/tests/*.py
  ./configure --prefix=/usr --with-threads --with-history \
     --with-python=/usr/bin/python2
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mv "${srcdir}/xmlconf" .
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
