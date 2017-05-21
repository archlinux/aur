# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Yonathan Dossow <ydossow@archlinux.cl>

pkgname=jss-redhat
pkgver=4.2.6
pkgrel=2
pkgdesc="Network Security Services for Java (JSS) is a Java interface to NSS (Red Hat version)"
arch=('x86_64' 'i686')
url="https://developer.mozilla.org/En/JSS"
license=(GPL)
depends=('java-runtime' 'nspr' 'nss')
makedepends=('java-environment=7')
source=('https://archives.fedoraproject.org/pub/fedora/linux/development/26/Everything/source/tree/Packages/j/jss-4.2.6-44.fc26.src.rpm')
sha256sums=('e602d24e47821b6307c3fedf757c19e55cc1c3b689aed084f3d6bdea12d5d373')

prepare() {
  cd "${srcdir}"
  rm -rf "jss-${pkgver}"
  tar -xzf "jss-${pkgver}.tar.gz"

  cd "jss-${pkgver}"
  patch -p1 -i "${srcdir}/jss-key_pair_usage_with_op_flags.patch"
  patch -p1 -i "${srcdir}/jss-javadocs-param.patch"
  patch -p1 -i "${srcdir}/jss-ipv6.patch"
  patch -p1 -i "${srcdir}/jss-ECC-pop.patch"
  patch -p1 -i "${srcdir}/jss-loadlibrary.patch"
  patch -p1 -i "${srcdir}/jss-ocspSettings.patch"
  patch -p1 -i "${srcdir}/jss-ECC_keygen_byCurveName.patch"
  patch -p1 -i "${srcdir}/jss-VerifyCertificate.patch"
  patch -p1 -i "${srcdir}/jss-bad-error-string-pointer.patch"
  patch -p1 -i "${srcdir}/jss-VerifyCertificateReturnCU.patch"
  patch -p1 -i "${srcdir}/jss-ECC-HSM-FIPS.patch"
  patch -p1 -i "${srcdir}/jss-eliminate-native-compiler-warnings.patch"
  patch -p1 -i "${srcdir}/jss-eliminate-java-compiler-warnings.patch"
  patch -p1 -i "${srcdir}/jss-PKCS12-FIPS.patch"
  patch -p1 -i "${srcdir}/jss-eliminate-native-coverity-defects.patch"
  patch -p1 -i "${srcdir}/jss-PBE-PKCS5-V2-secure-P12.patch"
  patch -p1 -i "${srcdir}/jss-wrapInToken.patch"
  patch -p1 -i "${srcdir}/jss-HSM-manufacturerID.patch"
  patch -p1 -i "${srcdir}/jss-ECC-Phase2KeyArchivalRecovery.patch"
  patch -p1 -i "${srcdir}/jss-undo-JCA-deprecations.patch"
  patch -p1 -i "${srcdir}/jss-undo-BadPaddingException-deprecation.patch"
  patch -p1 -i "${srcdir}/jss-fixed-build-issue-on-F17-or-newer.patch"
  patch -p1 -i "${srcdir}/jss-SHA-OID-fix.patch"
  patch -p1 -i "${srcdir}/jss-RC4-strengh-verify.patch"
  patch -p1 -i "${srcdir}/jss-support-TLS1_1-TLS1_2.patch"
  patch -p1 -i "${srcdir}/jss-WindowsCompileFix.patch"
  patch -p1 -i "${srcdir}/jss-WindowsLoadLibrary.patch"
  patch -p1 -i "${srcdir}/jss-Fixed-build-failures.patch"
  patch -p1 -i "${srcdir}/jss-VerifyCertificate-enhancement.patch"
  patch -p1 -i "${srcdir}/jss-lunasaUnwrap.patch"
  patch -p1 -i "${srcdir}/jss-symkey-enhancements.patch"
  patch -p1 -i "${srcdir}/jss-crmf-envelopedData.patch"
}

build() {
  cd "${srcdir}/jss-${pkgver}"

  # Enable compiler optimizations and disable debugging code
  export BUILD_OPT=1

  export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
  export PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1

  export NSPR_INCLUDE_DIR=$(pkg-config --cflags-only-I nspr | sed 's/-I//')
  export NSPR_LIB_DIR=$(pkg-config --libs-only-L nspr | sed 's/-L//')

  export NSS_INCLUDE_DIR=$(pkg-config --cflags-only-I nss | sed 's/-I//')
  export NSS_LIB_DIR=$(pkg-config --libs-only-L nss | sed 's/-L//')

  if [[ -z "${JAVA_HOME}" ]]; then
    export JAVA_HOME=/usr/lib/jvm/default
  fi

  if [[ "${CARCH}" = "x86_64" ]]; then
    export USE_64=1
  fi

  cd mozilla
  # Parallel make is not supported
  make -j1 -C security/coreconf
  make -j1 -C security/jss
  make -j1 -C security/jss javadoc
}

package() {
  cd "${srcdir}/jss-${pkgver}/mozilla"

  install -dm755 "${pkgdir}/usr/lib/java/jss-redhat"
  install -m644 dist/xpclass.jar "${pkgdir}/usr/lib/java/jss-redhat/jss4.jar"

  # We have to use the name libjss4.so because this is dynamically
  # loaded by the jar file.
  install -dm755 "${pkgdir}/usr/lib/jss-redhat/"
  install -m755 dist/Linux*.OBJ/lib/libjss4.so "${pkgdir}/usr/lib/jss-redhat/"

  cd "${pkgdir}/usr/lib/jss-redhat/"
  ln -sf /usr/lib/java/jss-redhat/jss4.jar
}

# vim:set ts=2 sw=2 et:
