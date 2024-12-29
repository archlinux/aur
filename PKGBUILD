# Maintainer: Aubrey Carlson (Carlson) <aubreycarlson24@outlook.com>

_javaver=8
_zuluver=8.82.0.21
_jdkver=8.0.432

pkgname="openjdk-zulu${_javaver}-ca-fx-bin"
pkgver="${_zuluver}+${_jdkver}"
pkgrel=3
pkgdesc="Azul Zulu Builds of OpenJDK ${_javaver} With OpenJFX are open source, TCK-tested and certified builds of OpenJDK ${_javaver}."
arch=('x86_64')
url='https://www.azul.com/downloads'
license=('custom')
depends=('java-environment-common>=3'
         'java-runtime-common>=3'
         'ca-certificates-utils')
provides=("java-environment=${_javaver}"
          "java-environment-openjdk=${_javaver}"
          "jdk${_javaver}-openjdk=${_javaver}"
          "java-runtime=${_javaver}"
          "java-runtime-openjdk=${_javaver}"
          "jre${_javaver}-openjdk=${_javaver}"
          "java-runtime-headless=${_javaver}"
          "java-runtime-headless-openjdk=${_javaver}"
          "jre${_javaver}-openjdk-headless=${_javaver}"
          "java-openjfx=${_javaver}"
          "java${_javaver}-openjfx=${_javaver}")
source=("https://cdn.azul.com/zulu/bin/zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_x64.tar.gz")
sha256sums=("e355aea5f7c47d1119808cfcfc496fa296ddeb02c2f22391772356fcb657df86")
install="install_${pkgname}.sh"

_jvmdir="/usr/lib/jvm/${pkgname}"

package() {
  cd ${srcdir}/zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_x64
  install -dm 755 "${pkgdir}${_jvmdir}"
  cp -a . "${pkgdir}${_jvmdir}"

  # Conf
  install -dm 755 "${pkgdir}/etc/${pkgname}"
  cp -r jre/lib/{management,security,logging.properties,net.properties,sound.properties} "${pkgdir}/etc/${pkgname}"
  rm -r "${pkgdir}${_jvmdir}/jre/lib/management" \
        "${pkgdir}${_jvmdir}/jre/lib/security" \
        "${pkgdir}${_jvmdir}/jre/lib/logging.properties" \
        "${pkgdir}${_jvmdir}/jre/lib/net.properties" \
        "${pkgdir}${_jvmdir}/jre/lib/sound.properties"
  ln -s /etc/${pkgname}/management "${pkgdir}${_jvmdir}/jre/lib"
  ln -s /etc/${pkgname}/security "${pkgdir}${_jvmdir}/jre/lib"
  ln -s /etc/${pkgname}/logging.properties "${pkgdir}${_jvmdir}/jre/lib"
  ln -s /etc/${pkgname}/net.properties "${pkgdir}${_jvmdir}/jre/lib"
  ln -s /etc/${pkgname}/sound.properties "${pkgdir}${_jvmdir}/jre/lib"

  # Legal
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m 644 ASSEMBLY_EXCEPTION LICENSE THIRD_PARTY_README "${pkgdir}/usr/share/licenses/${pkgname}"

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
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/etc/${pkgname}/security/cacerts"
}
