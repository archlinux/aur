# Maintainer: Ábel Futó <lebaotuf+arch at gmail dot com>
# Contributor: John Schug <xtr.xtrnet@gmail.com>
pkgname=z88dk
pkgver=1.99C
pkgrel=1
pkgdesc="Developement kit for Z80 computers"
arch=('i686' 'x86_64')
url="http://z88dk.org"
license=('custom:The Clarified Artistic License')
depends=('perl' 'libxml2')
backup=(etc/profile.d/z88dk.sh)
source=(http://downloads.sourceforge.net/project/z88dk/z88dk/${pkgver}/${pkgname}-src-${pkgver}.tgz
        fix-makefile.patch
        z88dk.sh)
sha256sums=('f60932517116195993236cf28668522a3cbd19409cb430030754c7f0c0cb3a77'
            '78aaeb862a714c632e7ed16872ada2c4e246291be716ddb1e7613a2d28405e5c'
            '4eef7c67e5b142db3006a4076876cdae9f386a7b94a66841a5a8fac869bea156')

prepare() {
  cd "${srcdir}/${pkgname}"

  patch -Np1 < ../fix-makefile.patch

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

  install -dm755 ${pkgdir}/etc/profile.d/
  install -m755 ${srcdir}/z88dk.sh ${pkgdir}/etc/profile.d/
  # Include docs
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/images
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/resources
  find doc/* -not \( -path doc/netman -prune \) -not \( -path doc/images -prune \) \
       -not \( -path doc/resources -prune \) | xargs -i install -m644 "{}" "${pkgdir}/usr/share/doc/${pkgname}"
  find doc/images/* | xargs -i install -m644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/images"
  find doc/resources/* | xargs -i install -m644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/resources"
  # License
  install -D -m755 LICENSE "${pkgdir}/usr/share/licenses/z88dk/LICENSE"
}

# vim:set ts=2 sw=2 et:
