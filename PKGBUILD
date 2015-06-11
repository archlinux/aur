# $Id: PKGBUILD 231649 2015-02-17 09:16:00Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbasename=nss
pkgname=${_pkgbasename}-chacha20
pkgver=3.19.1
pkgrel=0
pkgdesc="Mozilla Network Security Services with ChaCha20-Poly1305"
arch=(i686 x86_64)
url="http://www.mozilla.org/projects/security/pki/nss/"
license=('MPL' 'GPL')
_nsprver=4.10.7
depends=("nspr>=${_nsprver}" 'sqlite' 'zlib' 'sh' 'p11-kit')
conflicts=('nss')
provides=('nss')
makedepends=('perl')
options=('!strip' '!makeflags' 'staticlibs')
source=("https://ftp.mozilla.org/pub/security/nss/releases/NSS_${pkgver//./_}_RTM/src/${_pkgbasename}-${pkgver}.tar.gz"
        nss.pc.in
        nss-config.in
        ssl-renegotiate-transitional.patch
        mozilla820740-chacha20.patch)
sha256sums=('b7be709551ec13206d8e3e8c065b894fa981c11573115e9478fa051029c52fff'
            'b9f1428ca2305bf30b109507ff335fa00bce5a7ce0434b50acd26ad7c47dd5bd'
            'e44ac5095b4d88f24ec7b2e6a9f1581560bd3ad41a3d198596d67ef22f67adb9'
            '12df04bccbf674db1eef7a519a28987927b5e9c107b1dc386686f05e64f49a97'
            '5e9b6e3d1b35b0c634178d07d1b289a641b397d8199099917fbb240c83f8d5b9')

prepare() {
  cd "${srcdir}"/${_pkgbasename}-${pkgver}

  # Adds transitional SSL renegotiate support - patch from Debian
  patch -Np3 -i "${srcdir}/ssl-renegotiate-transitional.patch"

  patch -Np1 -i "${srcdir}/mozilla820740-chacha20.patch"

  # Respect LDFLAGS
  sed -e 's/\$(MKSHLIB) -o/\$(MKSHLIB) \$(LDFLAGS) -o/' \
      -i nss/coreconf/rules.mk

}


build() {
  cd "${srcdir}"/${_pkgbasename}-${pkgver}/nss

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
  cd "${srcdir}"/${_pkgbasename}-${pkgver}
  install -d "$pkgdir"/usr/{bin,include/nss,lib/pkgconfig}

  NSS_VMAJOR=$(grep '#define.*NSS_VMAJOR' nss/lib/nss/nss.h | awk '{print $3}')
  NSS_VMINOR=$(grep '#define.*NSS_VMINOR' nss/lib/nss/nss.h | awk '{print $3}')
  NSS_VPATCH=$(grep '#define.*NSS_VPATCH' nss/lib/nss/nss.h | awk '{print $3}')

  sed ../nss.pc.in \
    -e "s,%libdir%,/usr/lib,g" \
    -e "s,%prefix%,/usr,g" \
    -e "s,%exec_prefix%,/usr/bin,g" \
    -e "s,%includedir%,/usr/include/nss,g" \
    -e "s,%NSPR_VERSION%,${_nsprver},g" \
    -e "s,%NSS_VERSION%,${pkgver},g" \
    > "$pkgdir/usr/lib/pkgconfig/nss.pc"
  ln -s nss.pc "$pkgdir/usr/lib/pkgconfig/mozilla-nss.pc"

  sed ../nss-config.in \
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
  ln -s pkcs11/p11-kit-trust.so "$pkgdir/usr/lib/libnssckbi.so"
}
