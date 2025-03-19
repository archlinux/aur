# Maintainer: Aubrey Carlson (Carlson) <aubreycarlson24@outlook.com>

_javaver=24
_zuluver=24.28.85
_jdkver=24.0.0

pkgname="openjdk-zulu-ca-fx-bin"
pkgver="${_javaver}+${_zuluver}+${_jdkver}"
pkgrel=1
pkgdesc="Azul Zulu Builds of OpenJDK ${_javaver} With OpenJFX are open source, TCK-tested and certified builds of OpenJDK ${_javaver}."
arch=('x86_64')
url='https://www.azul.com/downloads'
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
source=("https://cdn.azul.com/zulu/bin/zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_x64.tar.gz")
b2sums=("cde1af579aa4cf27a5665bb5ab46690bcbb95d0ca302927d5bba9863e3e4653ea6a281df1eb944d9ab9884f29e3bde2d214a8990030b36132483d9335708f0a3")
install="install_${pkgname}.sh"

_jvmdir="/usr/lib/jvm/${pkgname}"

package() {
  cd ${srcdir}/zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_x64
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
  for f in bin/*; do
    f=$(basename "${f}")
    _man=man/man1/"${f}.1"
    test -f "${_man}" && install -Dm 644 "${_man}" "${pkgdir}/usr/share/man/man1/${f}-zulu${_javaver}.1"
  done
  rm -r "${pkgdir}${_jvmdir}/man"
  ln -s /usr/share/man "${pkgdir}${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"
}
