# $Id$
# Maintainer: Franziskus Kiefer <arch@franziskuskiefer.de>

pkgbase=nss-hg
pkgname=nss-hg
pkgver=trunk
pkgrel=1
pkgdesc="Mozilla Network Security Services"
arch=(i686 x86_64)
url="http://www.mozilla.org/projects/security/pki/nss/"
license=('MPL' 'GPL')
_nsprver=4.12
depends=("nspr>=${_nsprver}" 'sqlite' 'zlib' 'sh' 'p11-kit')
makedepends=('perl' 'python2')
options=('!strip' '!makeflags' 'staticlibs')
source=("hg+https://hg.mozilla.org/projects/nss")
sha256sums=('SKIP')

prepare() {
  # Respect LDFLAGS
  sed -e 's/\$(MKSHLIB) -o/\$(MKSHLIB) \$(LDFLAGS) -o/' \
      -i nss/coreconf/rules.mk
}


build() {
  cd nss
  export BUILD_OPT=1
  export NSS_USE_SYSTEM_SQLITE=1
  export NSS_ENABLE_ECC=1
  export NSPR_INCLUDE_DIR="`nspr-config --includedir`"
  export NSPR_LIB_DIR="`nspr-config --libdir`"
  export XCFLAGS="${CFLAGS}"

  [ "$CARCH" = "x86_64" ] && export USE_64=1

  make -C coreconf
  make -C lib/dbm
  make
}

package() {
  install -d "$pkgdir"/usr/{bin,include/nss,lib/pkgconfig}

  NSS_VMAJOR=$(grep '#define.*NSS_VMAJOR' nss/lib/nss/nss.h | awk '{print $3}')
  NSS_VMINOR=$(grep '#define.*NSS_VMINOR' nss/lib/nss/nss.h | awk '{print $3}')
  NSS_VPATCH=$(grep '#define.*NSS_VPATCH' nss/lib/nss/nss.h | awk '{print $3}')

  sed nss/pkg/pkg-config/nss.pc.in \
    -e "s,%libdir%,/usr/lib,g" \
    -e "s,%prefix%,/usr,g" \
    -e "s,%exec_prefix%,/usr/bin,g" \
    -e "s,%includedir%,/usr/include/nss,g" \
    -e "s,%NSPR_VERSION%,${_nsprver},g" \
    -e "s,%NSS_VERSION%,${pkgver},g" \
    > "$pkgdir/usr/lib/pkgconfig/nss.pc"
  ln -s nss.pc "$pkgdir/usr/lib/pkgconfig/mozilla-nss.pc"

  sed nss/pkg/pkg-config/nss-config.in \
    -e "s,@libdir@,/usr/lib,g" \
    -e "s,@prefix@,/usr/bin,g" \
    -e "s,@exec_prefix@,/usr/bin,g" \
    -e "s,@includedir@,/usr/include/nss,g" \
    -e "s,@MOD_MAJOR_VERSION@,${NSS_VMAJOR},g" \
    -e "s,@MOD_MINOR_VERSION@,${NSS_VMINOR},g" \
    -e "s,@MOD_PATCH_VERSION@,${NSS_VPATCH},g" \
    > "$pkgdir/usr/bin/nss-config"
  chmod 755 "$pkgdir/usr/bin/nss-config"

  cd dist/*.OBJ/bin
  install -t "$pkgdir/usr/bin" *util shlibsign signtool signver ssltap

  cd ../lib
  install -t "$pkgdir/usr/lib" *.so
  install -t "$pkgdir/usr/lib" -m644 libcrmf.a *.chk

  cd ../../public/nss
  install -t "$pkgdir/usr/include/nss" -m644 *.h

  rm "$pkgdir/usr/lib/libnssckbi.so"
  ln -s libnssckbi-p11-kit.so "$pkgdir/usr/lib/libnssckbi.so"
}
