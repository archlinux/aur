# Maintainer: Madeline Mewmews <maddie at mewmews dot gay>
# Contributor: Sam Guymer <sam at guymer dot me>

_java_ver=8
_jdkname="java-${_java_ver}-jdk-perf"
_zing_build="23.10.0.0"
pkgname="jdk8-perf"
pkgver="${_java_ver}.0.401"
pkgrel=1
pkgdesc='Java SE Subscription Enterprise Performance Pack is a runtime that delivers the performance of the JDK 17 Java Virtual Machine (JVM) to a Java SE 8 runtime.'
arch=('x86_64' 'aarch64')
url='https://www.oracle.com/java/technologies/downloads/#jepp'
license=('custom:Oracle')
depends=(
  'java-environment-common' 'java-runtime-common' 'ca-certificates-utils'
  # not 100% sure if all of these dependencies are needed
  # dependencies from jre8-openjdk-headless
  'nss'
  # dependencies from jre8-openjdk
  'xdg-utils' 'hicolor-icon-theme'
)
provides=(
  "java-environment=$_java_ver"
  "java-environment-openjdk=$_java_ver"
  "java-runtime-headless=$_java_ver"
  "java-runtime-headless-openjdk=$_java_ver"
  "java-runtime=$_java_ver"
  "java-runtime-openjdk=$_java_ver"
)
install="$pkgname.install"
source_aarch64=("local://jdk-8u401-perf-linux-aarch64.tar.gz")
source_x86_64=("local://jdk-8u401-perf-linux-x64.tar.gz")
source=("${pkgname}.install")
#https://cdn.azul.com/zing-zvm/${_zulu_build}/zing${_zulu_build}-3-jdk${pkgver}-linux_x64.tar.gz
#https://cdn.azul.com/zing-zvm/ZVM23.03.0.0/zing23.03.0.0-3-jdk8.0.362-linux_x64.tar.gz
sha256sums_aarch64=('a638e182d44d658196074c5d78241d057f6deb690f89fbac7c29cd14f0dde308')
sha256sums_x86_64=('f4692a87d061049ca0ec819ce63ba0d3d309e0a693184d76b523c212297f321f')
sha256sums=('08d898aa1f737aea0a16d14735d381904fcb4912cbd0b88f427243117899eb49')
_jvmdir="/usr/lib/jvm/${_jdkname}"

# Upstream config files that should go to etc and get backup
_conf_files=(
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
  if [ "${CARCH}" = "aarch64" ]; then
    _conf_files+=('aarch64/jvm.cfg')
    cd "$srcdir/jdk1.8.0_401"
  else
    _conf_files+=('amd64/jvm.cfg')
    cd "$srcdir/jdk1.8.0_401"
  fi

  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -a . "${pkgdir}/${_jvmdir}/"

  # copied from java8-openjdk

  # Set config files
  mv "${pkgdir}${_jvmdir}"/jre/lib/management/jmxremote.password{.template,}
  mv "${pkgdir}${_jvmdir}"/jre/lib/management/snmp.acl{.template,}

  # Conf
  install -dm 755 "${pkgdir}/etc/${_jdkname}"
  for f in "${_conf_files[@]}"; do
    _file="${_jvmdir}/jre/lib/$f"
    install -D -m 644 "${pkgdir}${_file}" "${pkgdir}/etc/${_jdkname}/$f"
    ln -sf "/etc/${_jdkname}/$f" "${pkgdir}${_file}"
  done

  # Install license
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgbase}/"
#  install -m 644 ASSEMBLY_EXCEPTION LICENSE THIRD_PARTY_README "${pkgdir}/usr/share/licenses/${pkgbase}"

#  # Man pages
#  for f in man/man1/* man/ja/man1/*; do
#    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-jdk8-perf}"
#  done
#  rm -r "${pkgdir}/${_jvmdir}/man"
#  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/jre/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/jre/lib/security/cacerts"
}
