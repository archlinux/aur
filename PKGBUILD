# Maintainer: Aubrey Carlson (Carlson) <aubreycarlson24@outlook.com>

_javaver=24
_bellver=37
_jdkver=24

pkgname="openjdk-liberica-full-bin"
pkgver="${_javaver}+${_bellver}+${_jdkver}"
pkgrel=1
pkgdesc="Liberica ${_javaver} includes LibericaFX, which is based on OpenJFX ${_javaver} and Minimal VM, where suitable."
arch=('x86_64')
url='https://bell-sw.com/pages/downloads'
license=('custom')
depends=('java-environment-common>=3'
         'java-runtime-common>=3'
         'ca-certificates-utils')
provides=("java-environment=${_javaver}"
          "java-environment-openjdk=${_javaver}"
          "java-runtime=${_javaver}"
          "java-runtime-openjdk=${_javaver}"
          "java-runtime-headless=${_javaver}"
          "java-runtime-headless-openjdk=${_javaver}"
          "jre-openjdk=${_javaver}"
          "jdk-openjdk=${_javaver}"
          "jre-openjdk-headless=${_javaver}"
          "java-openjfx=${_javaver}"
          "java${_javaver}-environment=${_javaver}"
          "java${_javaver}-environment-openjdk=${_javaver}"
          "java${_javaver}-runtime=${_javaver}"
          "java${_javaver}-runtime-openjdk=${_javaver}"
          "java${_javaver}-runtime-headless=${_javaver}"
          "java${_javaver}-runtime-headless-openjdk=${_javaver}"
          "jre${_javaver}-openjdk=${_javaver}"
          "jdk${_javaver}-openjdk=${_javaver}"
          "jre${_javaver}-openjdk-headless=${_javaver}"
          "java${_javaver}-openjfx=${_javaver}")
source=("https://download.bell-sw.com/java/${_jdkver}+${_bellver}/bellsoft-jdk${_jdkver}+${_bellver}-linux-amd64-full.tar.gz")
sha1sums=("868b5c716265373dabf84e7329bcfa70bef27b20")
install="install_${pkgname}.sh"

_jvmdir="/usr/lib/jvm/${pkgname}"

package() {
  cd ${srcdir}/jdk-${_jdkver}-full
  install -dm 755 "${pkgdir}${_jvmdir}"
  cp -a . "${pkgdir}${_jvmdir}"

  # Conf
  install -dm 755 "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/${pkgname}"
  rm -r "${pkgdir}${_jvmdir}/conf"
  ln -s /etc/${pkgname} "${pkgdir}${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}${_jvmdir}/legal"
  ln -s /usr/share/licenses/${pkgname} "${pkgdir}${_jvmdir}/legal"

  # Man pages
  # for f in bin/*; do
  #   f=$(basename "${f}")
  #   _man=man/man1/"${f}.1"
  #   test -f "${_man}" && install -Dm 644 "${_man}" "${pkgdir}/usr/share/man/man1/${f}-bell${_javaver}.1"
  # done
  # rm -r "${pkgdir}${_jvmdir}/man"
  # ln -s /usr/share/man "${pkgdir}${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"
}
