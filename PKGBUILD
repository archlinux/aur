# Maintainer: Quinn Evans <qgevans7@gmail.com>
# Contributor: Ábel Futó <lebaotuf+arch at gmail dot com>
# Contributor: John Schug <xtr.xtrnet@gmail.com>
pkgname=z88dk-sdcc
provides=('z88dk')
conflicts=('z88dk')
pkgver=2.3
pkgrel=1
pkgdesc="Development kit for Z80 computers (with SDCC [and thus new library] enabled)"
arch=('i686' 'x86_64')
url="http://z88dk.org"
license=('custom:The Clarified Artistic License')
depends=('libxml2' 'boost-libs')
makedepends=('perl' 'perl-modern-perl' 'perl-yaml-tiny' 'perl-cpu-z80-assembler'
	     'perl-path-tiny' 'perl-clone'
	     'ragel' 're2c' 'dos2unix' 'boost')
backup=(etc/profile.d/z88dk.sh)
source=(https://github.com/z88dk/z88dk/releases/download/v${pkgver}/z88dk-src-${pkgver}.tgz
        z88dk.sh)
sha256sums=('e08887ef9344f8dbd9d669bb904e17c35290a316bb1fe8b02c1a45b0d291292f'
            '4eef7c67e5b142db3006a4076876cdae9f386a7b94a66841a5a8fac869bea156')

build() {
  cd "${srcdir}/z88dk"

  export PATH="${srcdir}/z88dk"/bin:$PATH
  export ZCCCFG="${srcdir}/z88dk"/lib/config
  export Z80_OZFILES="${srcdir}/z88dk"/lib/
  export BUILD_SDCC=1
  export BUILD_SDCC_HTTP=1
  make -j1
  make -C libsrc clean
  make -C libsrc
}

package() {
  cd "${srcdir}/z88dk"
  make -C libsrc PREFIX="/usr" DESTDIR="${pkgdir}" install
  make PREFIX="/usr" DESTDIR="${pkgdir}" install

  # Uncomment for a cleaner install directory - no functionality will be lost
  #rm -rf ${pkgdir}/usr/share/z88dk/libsrc/target/{zx,zxn,ts2068}/newlib/obj
  #rm -rf ${pkgdir}/usr/share/z88dk/libsrc/target/zx-common/fcntl/esxdos/obj
  #rm -rf ${pkgdir}/usr/share/z88dk/libsrc/target/zx/fzx/obj/{z80,z80n}

  install -dm755 ${pkgdir}/etc/profile.d/
  install -m644 ${srcdir}/z88dk.sh ${pkgdir}/etc/profile.d/
  # Include docs
  install -dm755 ${pkgdir}/usr/share/doc/z88dk
  install -dm755 ${pkgdir}/usr/share/doc/z88dk/images
  install -dm755 ${pkgdir}/usr/share/doc/z88dk/resources
  install -dm755 ${pkgdir}/usr/share/doc/z88dk/target/gl
  install -dm755 ${pkgdir}/usr/share/doc/z88dk/features
  find doc/* -not \( -path doc/netman -prune \) -not \( -path doc/images -prune \) \
       -not \( -path doc/resources -prune \) -not \( -path doc/target -prune \) \
       -not \( -path doc/features -prune \) | xargs -i install -m644 "{}" \
       "${pkgdir}/usr/share/doc/z88dk"
  find doc/images/* | xargs -i install -m644 "{}" "${pkgdir}/usr/share/doc/z88dk/images"
  find doc/resources/* | xargs -i install -m644 "{}" "${pkgdir}/usr/share/doc/z88dk/resources"
  find doc/target/gl/* | xargs -i install -m644 "{}" "${pkgdir}/usr/share/doc/z88dk/target/gl"
  find doc/features/* | xargs -i install -m644 "{}" "${pkgdir}/usr/share/doc/z88dk/features"

  # License
  install -D -m755 LICENSE "${pkgdir}/usr/share/licenses/z88dk/LICENSE"
}

# vim:set ts=2 sw=2 et:
