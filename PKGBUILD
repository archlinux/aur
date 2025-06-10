# Maintainer: envolution
# Contributor: Jonathan Liu <net147@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=evrouter
pkgver=0.4
pkgrel=6
pkgdesc="An Input Event Router for Linux"
arch=('i686' 'x86_64')
url="http://www.bedroomlan.org/projects/evrouter"
license=('GPL-2.0-or-later')
depends=('libxtst')
makedepends=('automake')
source=(http://debian.bedroomlan.org/debian/pool/main/e/${pkgname}/${pkgname}_${pkgver}.tar.gz
evrouter-modern-compiler-fixes.patch)
md5sums=('eef1b9d8e3b545c330eb025670ffa3e8'
         '5ec6c3392bc127c6a2fc9630fc701d78')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np2 -i ../evrouter-modern-compiler-fixes.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i '87d' ./src/evrouter.c
  sed -i '46d' ./configure.ac
  aclocal
  automake --add-missing
  ./configure --prefix=/usr --without-xmms
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -D -m644 debian/changelog "${pkgdir}/usr/share/doc/${pkgname}/changelog"
  install -D -m644 debian/copyright "${pkgdir}/usr/share/doc/${pkgname}/copyright"
  install -D -m755 src/example "${pkgdir}/usr/share/doc/${pkgname}/examples/example"
}

# vim:set ts=2 sw=2 et:
