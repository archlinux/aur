# Maintainer: Ábel Futó <lebaotuf+arch at gmail dot com>
# Contributor: John Schug <xtr.xtrnet@gmail.com>
pkgname=z88dk
pkgver=1.10.1
_pkgver=1.10
pkgrel=1
pkgdesc="A small C compiler for the Zilog Z80."
arch=('i686' 'x86_64')
url="http://z88dk.org"
license=('custom:The Clarified Artistic License')
depends=('glibc')
backup=(etc/profile.d/z88dk.sh)
source=(http://downloads.sourceforge.net/project/z88dk/z88dk/${_pkgver}/${pkgname}-${pkgver}.tgz
        z88dk.sh)
md5sums=('7898bc04f9e5275845d6117cafa74096'
         'affe59b56fbba4d6a145f899bb073227')

prepare() {
  cd "${srcdir}/${pkgname}"

  # Do not override bool definition
  sed -i "s/typedef int bool;//" src/z80asm/types.h
}

build() {
  cd "${srcdir}/${pkgname}"

  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make prefix="/usr" DESTDIR="${pkgdir}" install

  echo "export ZCCCFG=/usr/share/z88dk/lib/config/" > ${pkgdir}/usr/share/z88dk/exports
  echo "export Z80_OZFILES=/usr/share/z88dk/lib/" >> ${pkgdir}/usr/share/z88dk/exports

  install -dm755 ${pkgdir}/etc/profile.d/
  install -m755 ${srcdir}/z88dk.sh ${pkgdir}/etc/profile.d/
  # Include docs
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/
  find doc/* -not \( -path doc/CVS -prune \) -not \( -path doc/netman -prune \) | xargs -i install -m644 "{}" "${pkgdir}/usr/share/doc/${pkgname}"
  # License
  install -D -m755 LICENSE "${pkgdir}/usr/share/licenses/z88dk/LICENSE"
}

# vim:set ts=2 sw=2 et:
