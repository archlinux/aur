# Maintainer: Ábel Futó <lebaotuf+arch at gmail dot com>
# Contributor: John Schug <xtr.xtrnet@gmail.com>
pkgname=z88dk
pkgver=2.1
pkgrel=1
pkgdesc="Developement kit for Z80 computers"
arch=('i686' 'x86_64')
url="http://z88dk.org"
license=('custom:The Clarified Artistic License')
depends=('perl' 'libxml2')
backup=(etc/profile.d/z88dk.sh)
source=(https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-src-${pkgver}.tgz
	fix-whitespace-Makefile.patch
        fix-makefile-v2.1.patch
        z88dk.sh)
sha256sums=('f3579ee59b4af552721173165af38223b115ccb67179e79d2f3c0ae64338dc7c'
            '3ae2c544e97a49298e81c3fbd19ff4458b7627a827d83534c34499f7570cfaa8'
            '02ad318eb810f2dff140f66e8c77b946f66018e077a7c27b87824081f6601646'
            '4eef7c67e5b142db3006a4076876cdae9f386a7b94a66841a5a8fac869bea156')

prepare() {
  cd "${srcdir}/${pkgname}"

  patch -Np0 < ../fix-whitespace-Makefile.patch
  patch -Np0 < ../fix-makefile-v2.1.patch
}

build() {
  cd "${srcdir}/${pkgname}"

  export PATH="${srcdir}/${pkgname}"/bin:$PATH
  export ZCCCFG="${srcdir}/${pkgname}"/lib/config
  export Z80_OZFILES="${srcdir}/${pkgname}"/lib/
  export MAKEFLAGS="-j1"
  make
  make -C libsrc clean
  make -C libsrc
}

package() {
  cd "${srcdir}/${pkgname}"
  make -C libsrc prefix="/usr" DESTDIR="${pkgdir}" install
  make prefix="/usr" DESTDIR="${pkgdir}" install

  # Uncomment for a cleaner install directory - no functionality will be lost
  #rm -rf ${pkgdir}/usr/share/z88dk/libsrc/target/{zx,zxn,ts2068}/newlib/obj
  #rm -rf ${pkgdir}/usr/share/z88dk/libsrc/target/zx-common/fcntl/esxdos/obj
  #rm -rf ${pkgdir}/usr/share/z88dk/libsrc/target/zx/fzx/obj/{z80,z80n}

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
