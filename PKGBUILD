# Maintainer: Maddie Mewmews <maddie at mewmews gay>
# Contributor: Sam Guymer <sam at guymer dot me>

_java_ver=8
_jdkname="zing-${_java_ver}"
_zing_build="23.10.0.0"
pkgname="${_jdkname}-bin"
pkgver="${_java_ver}.0.392"
pkgrel=1
pkgdesc='Azul Platform Prime is a modern, TCK-compliant Java platform based on OpenJDK.'
arch=('aarch64' 'x86_64')
url='https://docs.azul.com/prime/prime-quick-start-tar'
license=('custom')
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
source_aarch64=("https://cdn.azul.com/zing-zvm/ZVM${_zing_build}/zing${_zing_build}-3-jdk${pkgver}-linux_aarch64.tar.gz")
source_x86_64=("https://cdn.azul.com/zing-zvm/ZVM${_zing_build}/zing${_zing_build}-3-jdk${pkgver}-linux_x64.tar.gz")
source=("${pkgname}.install")
#https://cdn.azul.com/zing-zvm/${_zulu_build}/zing${_zulu_build}-3-jdk${pkgver}-linux_x64.tar.gz
#https://cdn.azul.com/zing-zvm/ZVM23.03.0.0/zing23.03.0.0-3-jdk8.0.362-linux_x64.tar.gz
sha256sums_aarch64=('bee45958b8efa19bbceb0fd87ab00ff21027cd1e465ad351326f8f78d1c00f61')
sha256sums_x86_64=('a0e892a19246307a83149a3400ea03ce9ceef47c423e1c30e0858edf1d96cac4')
sha256sums=('1762188053ca0c6413cfeb4fba26a5075072726fe230e54e1a18a1793abe5b84')
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
    cd "$srcdir/zing${_zing_build}-3-jdk${pkgver}-linux_aarch64"
  else
    _conf_files+=('amd64/jvm.cfg')
    cd "$srcdir/zing${_zing_build}-3-jdk${pkgver}-linux_x64"
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

  # Man pages
  for f in man/man1/* man/ja/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-zulu-8.1}"
  done
  rm -r "${pkgdir}/${_jvmdir}/man"
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/jre/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/jre/lib/security/cacerts"
}
