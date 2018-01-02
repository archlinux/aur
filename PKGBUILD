# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Yonathan Dossow <ydossow@archlinux.cl>

pkgname=jss
pkgver=4.4.2
pkgrel=1
pkgdesc="Network Security Services for Java (JSS) is a Java interface to NSS"
arch=('x86_64' 'i686')
url="https://developer.mozilla.org/En/JSS"
license=(GPL)
depends=('java-runtime' 'nspr' 'nss')
makedepends=('java-environment=7')
source=("http://pki.fedoraproject.org/pki/sources/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "http://pki.fedoraproject.org/pki/sources/${pkgname}/${pkgver}/jss-HMAC-test-for-AES-encrypt-unwrap.patch"
        "http://pki.fedoraproject.org/pki/sources/${pkgname}/${pkgver}/jss-HMAC-unwrap-keywrap-FIPSMODE.patch"
        "http://pki.fedoraproject.org/pki/sources/${pkgname}/${pkgver}/jss-ObjectNotFoundException-message.patch"
        "http://pki.fedoraproject.org/pki/sources/${pkgname}/${pkgver}/jss-PBE-padded-block-cipher-enhancements.patch"
        "http://pki.fedoraproject.org/pki/sources/${pkgname}/${pkgver}/jss-SignatureAlgorithm.patch"
	"http://pki.fedoraproject.org/pki/sources/${pkgname}/${pkgver}/jss-fix-PK11Store-getEncryptedPrivateKeyInfo-segfault.patch")
sha512sums=('71f76aef2905c374a0d87b25a73db2498562fe16cef1489c5859271d2ae264695dd2b00880539c35b21f4e0b19856abc5028b813fe05b33352304b538182b251'
            '31b59225baa57dd2c50cff027f654320dc0d77dc6c147654af1d693bd970bc8657a52f1981fff9172fd903abc800268101f3d1ee0a89fdd319a87e46ed9d1dc3'
            'bc7a67d9fe9f6b7fb6a5b8e88941310cc744c01d5686217321220dce7cc3fcfca5d9842a8b86e4807d58684e5f24355b191b91e8755cb34612615c8a9a0cd7fb'
            '063e1cb7d541c59a6c77cfc36475fd292448e76b78473d5f9708b511399a13876644ebe07d4600eeecb01c23e784324523c17b3adff25f4a7f75120e79e926c7'
            '21a2dedb5e02cca376f7f7c327cc7a78a563786744702ee470e12f69025ab37a48f21536a095fd4670179a5634a4c787c6eb7fcf5742b9ed46b26286d3c06d9c'
            '66fb4d6bb34c40c6e0b604dd49da38d789ab54dc1711632341afcb1d56c2b8ff0158b7f63465e53d7eeba1dceeb78ae25bc65d23fb685db2669fd379b96b4512'
            '1759ff2b113bf6c23c207ac25323d66e00b415732a1c35fac6768d5497e9c80fc8750d42fd6bc711dab03e7f69b88d8cd42e3c4b31fc957cdafa90f7b8abc4c9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/jss"

  # Enable compiler optimizations and disable debugging code
  export BUILD_OPT=1

  export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
  export PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1

  export USE_INSTALLED_NSPR=1
  export NSPR_INCLUDE_DIR=$(pkg-config --cflags-only-I nspr | sed 's/-I//')
  #export NSPR_LIB_DIR=$(pkg-config --libs-only-L nspr | sed 's/-L//')
  export NSPR_LIB_DIR=/usr/lib

  export USE_INSTALLED_NSS=1
  export NSS_INCLUDE_DIR=$(pkg-config --cflags-only-I nss | sed 's/-I//')
  #export NSS_LIB_DIR=$(pkg-config --libs-only-L nss | sed 's/-L//')
  export NSS_LIB_DIR=/usr/lib

  export XCFLAGS="-g"

  if [[ -z "${JAVA_HOME}" ]]; then
    export JAVA_HOME=/usr/lib/jvm/default
  fi

  if [[ "${CARCH}" = "x86_64" ]]; then
    export USE_64=1
  fi

  msg2 "Fedora patches..."

  patch -p1 -i ../../jss-HMAC-test-for-AES-encrypt-unwrap.patch
  patch -p1 -i ../../jss-PBE-padded-block-cipher-enhancements.patch
  patch -p1 -i ../../jss-fix-PK11Store-getEncryptedPrivateKeyInfo-segfault.patch
  patch -p1 -i ../../jss-HMAC-unwrap-keywrap-FIPSMODE.patch
  patch -p1 -i ../../jss-SignatureAlgorithm.patch
  patch -p1 -i ../../jss-ObjectNotFoundException-message.patch

  # Parallel make is not supported
  make -j1 -C coreconf
  make -j1 -C .
  make -j1 -C . javadoc
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/java/"
  install -m644 dist/xpclass.jar "${pkgdir}/usr/lib/java/jss4.jar"

  # We have to use the name libjss4.so because this is dynamically
  # loaded by the jar file.
  install -dm755 "${pkgdir}/usr/lib/jss/"
  install -m755 \
    dist/Linux*.OBJ/lib/libjss4.so \
    "${pkgdir}/usr/lib/jss/"

  pushd "${pkgdir}/usr/lib/jss/"
    ln -sf /usr/lib/java/jss4.jar jss4.jar
  popd
}
