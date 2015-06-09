# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

ver_major=6
ver_minor=0
ver_subminor=7
lib_suffix=${ver_major}0

ver_nspr=4.6
ver_nss=3.11
ver_svrcore=4.0.3

pkgname=mozldap
pkgver=${ver_major}.${ver_minor}.${ver_subminor}
pkgrel=1
pkgdesc="Mozilla LDAP C SDK"
arch=(i686 x86_64)
url="http://www.mozilla.org/directory/csdk.html"
license=(MPL GPL LGPL)
depends=(libsasl nspr nss svrcore)
source=("ftp://ftp.mozilla.org/pub/mozilla.org/directory/c-sdk/releases/v${pkgver}/src/${pkgname}-${pkgver}.tar.gz")
sha512sums=('bad8005941acaf98f53a60c6c8b697a680e8efe736817b063853ff1f07f052d3257ba7c28f502e37e0c2544fe00d24d31787ccbf892deb43c5481d49ed434b71')

build() {
  cd "${pkgname}-${pkgver}/c-sdk"

  case "${CARCH}" in
  x86_64)
    local x64="--enable-64bit"
    local x64make="USE_64=1"
    ;;
  *)
    local x64=""
    local x64make=""
    ;;
  esac

  ./configure \
    --prefix=/usr \
    ${x64} \
    --with-sasl \
    --enable-clu \
    --with-system-svrcore \
    --enable-optimize \
    --disable-debug

  # Enable compiler optimizations and disable debugging code
  export BUILD_OPT=1

  # Generate symbolic info for debuggers
  export XCFLAGS="${CFLAGS}"

  export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
  export PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1

  make ${x64make}
}

package() {
  cd "${pkgname}-${pkgver}"

  # Set up our package file
  install -dm755 "${pkgdir}"/usr/lib/pkgconfig/
  sed -e "s,%libdir%,/usr/lib,g" \
      -e "s,%prefix%,/usr,g" \
      -e "s,%major%,${ver_major},g" \
      -e "s,%minor%,${ver_minor},g" \
      -e "s,%submin%,${ver_subminor},g" \
      -e "s,%libsuffix%,${lib_suffix},g" \
      -e "s,%bindir%,/usr/lib/${pkgname},g" \
      -e "s,%exec_prefix%,/usr,g" \
      -e "s,%includedir%,/usr/include/${pkgname},g" \
      -e "s,%NSPR_VERSION%,${ver_nspr},g" \
      -e "s,%NSS_VERSION%,${ver_nss},g" \
      -e "s,%SVRCORE_VERSION%,${ver_svrcore},g" \
      -e "s,%MOZLDAP_VERSION%,${pkgver},g" \
      < c-sdk/mozldap.pc.in \
      > "${pkgdir}"/usr/lib/pkgconfig/${pkgname}.pc

  # There is no make install target so we'll do it ourselves.

  install -dm755 "${pkgdir}"/usr/include/${pkgname}/
  install -dm755 "${pkgdir}"/usr/lib/${pkgname}/

  # Copy the binary libraries we want
  for file in libssldap${lib_suffix}.so \
              libprldap${lib_suffix}.so \
              libldap${lib_suffix}.so \
              libldif${lib_suffix}.so; do
    install -m755 ../dist/lib/${file} "${pkgdir}"/usr/lib/
  done

  # Copy the binaries we want
  for file in ldapsearch \
              ldapmodify \
              ldapdelete \
              ldapcmp \
              ldapcompare \
              ldappasswd; do
    install -m755 ../dist/bin/${file} "${pkgdir}"/usr/lib/${pkgname}/
  done

  # Copy the include files
  for file in ../dist/public/ldap/*.h; do
    install -p -m644 ${file} "${pkgdir}"/usr/include/${pkgname}/
  done

  # Copy the developer files
  install -dm755 "${pkgdir}"/usr/share/${pkgname}/
  cp -r c-sdk/ldap/examples "${pkgdir}"/usr/share/${pkgname}/
  install -dm755 "${pkgdir}"/usr/share/${pkgname}/etc/
  install -m644 c-sdk/ldap/examples/xmplflt.conf \
                "${pkgdir}"/usr/share/${pkgname}/etc/
  install -m644 c-sdk/ldap/libraries/libldap/ldaptemplates.conf \
                "${pkgdir}"/usr/share/${pkgname}/etc/
  install -m644 c-sdk/ldap/libraries/libldap/ldapfilter.conf \
                "${pkgdir}"/usr/share/${pkgname}/etc/
  install -m644 c-sdk/ldap/libraries/libldap/ldapsearchprefs.conf \
                "${pkgdir}"/usr/share/${pkgname}/etc/
}
