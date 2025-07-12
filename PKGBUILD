# Maintainer: Aubrey Carlson (Carlson) <aubreycarlson24@outlook.com>

_javaver=21
_zuluver=21.42.19
_jdkver=21.0.7

pkgname="openjdk-zulu${_javaver}-ca-fx-bin"
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
b2sums=('c69ff6687aad5127df9b5f3eee0bac832d40fe116419cabc5161ddd8498500b51fd08032a187def091b309697efe1c3ff13ad66d0553136a57d2f2946cf4dde4')
install="install_${pkgname}.sh"

_jvmdir="/usr/lib/jvm/${pkgname}"

package() {
  cd ${srcdir}/zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_x64
  install -dm 755 "${pkgdir}${_jvmdir}"
  cp -a . "${pkgdir}${_jvmdir}"

  # Conf
  install -dm 755 "${pkgdir}/etc/openjdk-zulu"
  cp -r conf "${pkgdir}/etc/openjdk-zulu/${pkgname}"
  rm -r "${pkgdir}${_jvmdir}/conf"
  ln -s /etc/openjdk-zulu/${pkgname} "${pkgdir}${_jvmdir}/conf"

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
