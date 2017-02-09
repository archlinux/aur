# Maintainer: Ábel Futó <lebaotuf+arch at gmail dot com>
# Contributor: John Schug <xtr.xtrnet@gmail.com>
pkgname=z88dk
pkgver=1.99B
#_pkgver=1.99A
pkgrel=1
pkgdesc="A small C compiler for the Zilog Z80."
arch=('i686' 'x86_64')
url="http://z88dk.org"
license=('custom:The Clarified Artistic License')
depends=('perl')
backup=(etc/profile.d/z88dk.sh)
source=(http://downloads.sourceforge.net/project/z88dk/z88dk/${pkgver}/${pkgname}-src-${pkgver}.zip
        fix-build.patch
        z88dk.sh)
md5sums=('6412a730d1b38a8ecf393683981a33ae'
         '78871c2414844d5fc812d8994a2e2121'
         'a7d56837ef0cc9fbb05d2e21ddcc335c')

prepare() {
  cd "${srcdir}/${pkgname}"

  patch -Np1 < ../fix-build.patch
  chmod +x config.sh build.sh
}

build() {
  cd "${srcdir}/${pkgname}"

  export PATH="${srcdir}/${pkgname}"/bin:$PATH
  export ZCCCFG="${srcdir}/${pkgname}"/lib/config
  export Z80_OZFILES="${srcdir}/${pkgname}"/lib/
  export MAKEFLAGS="-j1"
  ./build.sh
   make libs
}

package() {
  cd "${srcdir}/${pkgname}"
  make prefix="/usr" DESTDIR="${pkgdir}" install
  make prefix="/usr" DESTDIR="${pkgdir}" install-libs

  install -dm755 ${pkgdir}/etc/profile.d/
  install -m755 ${srcdir}/z88dk.sh ${pkgdir}/etc/profile.d/
  # Include docs
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/
  find doc/* -not \( -path doc/CVS -prune \) -not \( -path doc/netman -prune \) | xargs -i install -m644 "{}" "${pkgdir}/usr/share/doc/${pkgname}"
  # License
  install -D -m755 LICENSE "${pkgdir}/usr/share/licenses/z88dk/LICENSE"
}

# vim:set ts=2 sw=2 et:
