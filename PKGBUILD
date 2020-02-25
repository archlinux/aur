# $Id$
# Maintainer: Franziskus Kiefer <arch@franziskuskiefer.de>
# Contributor:

_pkgname=nss
pkgname=nss-hg
pkgver=3.51.0r15514.ab0e7e272e36
pkgrel=1
pkgdesc="Mozilla Network Security Services"
arch=(i686 x86_64)
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
license=('MPL' 'GPL')
_nsprver=4.24
depends=("nspr>=${_nsprver}" sqlite zlib sh p11-kit)
makedepends=(gyp perl python ninja mercurial)
options=('!strip' '!makeflags' 'staticlibs')
source=("hg+https://hg.mozilla.org/projects/nss")
sha256sums=('SKIP')
conflicts=('nss')
provides=('nss')

pkgver() {
  local vmajor vminor vpatch
  cd "$_pkgname"

  { read vmajor; read vminor; read vpatch; } \
    < <(awk '/#define.*NSS_V(MAJOR|MINOR|PATCH)/ {print $3}' lib/nss/nss.h)

  printf "%s.%s.%sr%s.%s" "$vmajor" "$vminor" "$vpatch" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd nss
  tag=$(hg id https://hg.mozilla.org/projects/nss#default)
  hg up $tag
  ./build.sh --opt --system-sqlite --system-nspr \
             --disable-tests --enable-libpkix
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

  cd dist/Release/bin
  install -t "$pkgdir/usr/bin" *util shlibsign signtool signver ssltap

  cd ../lib
  install -t "$pkgdir/usr/lib" *.so
  install -t "$pkgdir/usr/lib" -m644 *.chk

  cd ../../public/nss
  install -t "$pkgdir/usr/include/nss" -m644 *.h

  rm "$pkgdir/usr/lib/libnssckbi.so"
  ln -sf pkcs11/p11-kit-trust.so "$pkgdir/usr/lib/libnssckbi.so"
}
