# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=morris
pkgver=0.2
pkgrel=5
pkgdesc="An implementation of the board game Nine Men's Morris"
arch=('i686' 'x86_64')
url="http://nine-mens-morris.net/"
license=('GPL3')
depends=('gtk2' 'gconf' 'boost-libs')
makedepends=('intltool' 'boost')
source=("http://www.nine-mens-morris.net/data/${pkgname}-${pkgver}.tar.bz2"
        "http://deb.debian.org/debian/pool/main/m/morris/morris_${pkgver}-6.debian.tar.xz")
sha512sums=('bd22f76f3ad8558018cb923592e55090febbc7421a073dd3a377f92fbf51dd7f810d6552e16dc196fa1e837ce02790732906ac608be4b672d5e1da3d0962ad38'
            '19747086cdfb8e35fe01b4f2c36c90f81d934afcfe627d798deb15963db956732f60072e3b688c11358efdd5066f1f0b5c09e4cbc87aec154bca119198180ee9')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 < "${srcdir}/debian/patches/autoreconf.patch"
  patch -Np1 < "${srcdir}/debian/patches/boost-signals.patch"
  autoreconf -if
  intltoolize -c -f
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
