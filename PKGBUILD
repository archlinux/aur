# Maintainer: Ábel Futó <lebaotuf+arch at gmail dot com>
# Contributor: John Schug <xtr.xtrnet@gmail.com>
pkgname=z88dk
pkgver=2.2
pkgrel=2
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
	fix-whitespace-Makefile.patch
        fix-makefile-v2.2.patch
        z88dk.sh)
sha256sums=('942aef3f5c55209a76925c8df681271e8340cf6623bedcb5a2933d4024657a41'
            'dea585b77f15d42b1f9c9ca4bf20b26f884ed828e7b0891afb915361f008a8a1'
            '55a7d58e239f5513cd110d924b30f2cb8d3b3f1d38b3c24d90ddc65bb1e345e2'
            '4eef7c67e5b142db3006a4076876cdae9f386a7b94a66841a5a8fac869bea156')

prepare() {
  cd "${srcdir}/${pkgname}"

  patch -Np0 < ../fix-whitespace-Makefile.patch
  patch -Np0 < ../fix-makefile-v2.2.patch
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
