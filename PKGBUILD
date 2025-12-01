# Maintainer: Aubrey Carlson (Carlson) <aubreycarlson24@outlook.com>

_javaver=8
_bellver=11
_jdkver=8u472

pkgname="openjdk-liberica8-full-bin"
pkgver="${_javaver}+${_bellver}+${_jdkver}"
pkgrel=1
pkgdesc="Liberica ${_javaver} includes LibericaFX, which is based on OpenJFX ${_javaver} and Minimal VM, where suitable."
arch=('x86_64')
url='https://https://bell-sw.com/pages/downloads'
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
sha1sums=('ff9f4b2fc62bb977e6675eb9d666cf085dd2c23d')
install="install_${pkgname}.sh"

_jvmdir="/usr/lib/jvm/${pkgname}"

_conf_files=(
  amd64/jvm.cfg
  calendars.properties
  content-types.properties
  flavormap.properties
  images/cursors/cursors.properties
  logging.properties
  management/jmxremote.access
  management/jmxremote.password
  management/management.properties
  management/snmp.acl
  net.properties
  psfont.properties.ja
  psfontj2d.properties
  security/java.policy
  security/java.security
  sound.properties
)

package() {
  cd ${srcdir}/jdk${_jdkver}-full
  install -dm 755 "${pkgdir}${_jvmdir}"
  cp -a . "${pkgdir}${_jvmdir}"

  # Conf
  mv "${pkgdir}${_jvmdir}"/jre/lib/management/jmxremote.password{.template,}
  mv "${pkgdir}${_jvmdir}"/jre/lib/management/snmp.acl{.template,}
  install -dm 755 "${pkgdir}/etc/openjdk-liberica/${pkgname}"
  for f in "${_conf_files[@]}"; do
    _file="${_jvmdir}/jre/lib/$f"
    install -Dm 644 "${pkgdir}${_file}" "${pkgdir}/etc/openjdk-liberica/${pkgname}/$f"
    ln -sf "/etc/openjdk-liberica/${pkgname}/$f" "${pkgdir}${_file}"
  done

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm 644 ASSEMBLY_EXCEPTION LICENSE THIRD_PARTY_README "${pkgdir}/usr/share/licenses/${pkgname}"

  # Man pages
  for f in bin/*; do
    f=$(basename "${f}")
    _man=man/man1/"${f}.1"
    test -f "${_man}" && install -Dm 644 "${_man}" "${pkgdir}/usr/share/man/man1/${f}-bell${_javaver}.1"
  done
  rm -r "${pkgdir}${_jvmdir}/man"
  ln -s /usr/share/man "${pkgdir}${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/jre/lib/security/cacerts"
}
