# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=morris
pkgver=0.2
pkgrel=4
pkgdesc="An implementation of the board game Nine Men's Morris"
arch=('i686' 'x86_64')
url="http://nine-mens-morris.net/"
license=('GPL3')
depends=('gtk2' 'gconf' 'boost-libs')
makedepends=('intltool' 'boost')
source=("http://www.nine-mens-morris.net/data/${pkgname}-${pkgver}.tar.bz2"
        "http://deb.debian.org/debian/pool/main/m/morris/morris_${pkgver}-6.debian.tar.xz")
sha256sums=('f96c387c2bf98de4c6d4a3b687b8127d1de53f4f957df11ce5bc329a3562c38b'
            '34f1a8195e1dd933647c0b3c362d6f8badc90be7c0f9a07539e58f11544bc990')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  for patch in ../debian/patches/*.patch; do 
    patch -Np1 < $patch
  done

  install ../debian/autoreconf.sh "${srcdir}/${pkgname}-${pkgver}"/autoreconf
  ./autoreconf
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 "AUTHORS" "README" "${pkgdir}/usr/share/doc/${pkgname}"
  install -D ../debian/morris.6 "${pkgdir}"/usr/share/man/man6/morris.6
}
