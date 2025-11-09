# Maintainer: Ábel Futó <lebaotuf+arch at gmail dot com>
# Contributor: John Schug <xtr.xtrnet@gmail.com>
pkgname=z88dk
pkgver=2.4
pkgrel=1
pkgdesc="Developement kit for Z80 computers"
arch=('i686' 'x86_64')
url="http://z88dk.org"
license=('custom:The Clarified Artistic License')
depends=('libxml2')
makedepends=('perl' 'perl-modern-perl' 'perl-yaml-tiny' 'perl-cpu-z80-assembler'
	     'perl-path-tiny' 'perl-clone'
	     'ragel' 're2c' 'dos2unix')
backup=(etc/profile.d/z88dk.sh)
source=(https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-src-${pkgver}.tgz
        z88dk.sh)
sha256sums=('96a57a01d44ff1d65d84e38b04aebb0a4e10eccb4845cb71f5a26f10abe7c5ac'
            '4eef7c67e5b142db3006a4076876cdae9f386a7b94a66841a5a8fac869bea156')

build() {
  cd "${srcdir}/${pkgname}"

  _MAKEFLAGS="${MAKEFLAGS}"
  export PATH="${srcdir}/${pkgname}"/bin:$PATH
  export ZCCCFG="${srcdir}/${pkgname}"/lib/config
  export Z80_OZFILES="${srcdir}/${pkgname}"/lib/
  export MAKEFLAGS="-j1"
  make
  export MAKEFLAGS="${_MAKEFLAGS}"
  make -C libsrc clean
  make -C libsrc
}

package() {
  cd "${srcdir}/${pkgname}"
  make -C libsrc PREFIX="/usr" DESTDIR="${pkgdir}" install
  make PREFIX="/usr" DESTDIR="${pkgdir}" install

  # Uncomment for a cleaner install directory - no functionality will be lost
  #rm -rf ${pkgdir}/usr/share/z88dk/libsrc/target/{zx,zxn,ts2068}/newlib/obj
  #rm -rf ${pkgdir}/usr/share/z88dk/libsrc/target/zx-common/fcntl/esxdos/obj
  #rm -rf ${pkgdir}/usr/share/z88dk/libsrc/target/zx/fzx/obj/{z80,z80n}

  install -dm755 ${pkgdir}/etc/profile.d/
  install -m644 ${srcdir}/z88dk.sh ${pkgdir}/etc/profile.d/
  # Include docs
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/images
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/resources
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/target/gl
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/features
  find doc/* -not \( -path doc/netman -prune \) -not \( -path doc/images -prune \) \
       -not \( -path doc/resources -prune \) -not \( -path doc/target -prune \) \
       -not \( -path doc/features -prune \) | xargs -i install -m644 "{}" \
       "${pkgdir}/usr/share/doc/${pkgname}"
  find doc/images/* | xargs -i install -m644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/images"
  find doc/resources/* | xargs -i install -m644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/resources"
  find doc/target/gl/* | xargs -i install -m644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/target/gl"
  find doc/features/* | xargs -i install -m644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/features"

  # License
  install -D -m755 LICENSE "${pkgdir}/usr/share/licenses/z88dk/LICENSE"
}

# vim:set ts=2 sw=2 et:
