_java_ver=8
_jdkname="zulu${_java_ver}-fx"
_zulu_build="${_java_ver}.88.0.19-ca-fx"
pkgname="${_jdkname}-bin"
pkgver="${_java_ver}.0.462"
pkgrel=1
pkgdesc='Azul Zulu Builds of OpenJDK With OpenJFX are open source, TCK-tested and certified builds of OpenJDK.'
arch=('x86_64')
url='https://www.azul.com/downloads/'
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
  "java-runtime=$_java_ver"
  "java-runtime-openjdk=$_java_ver"
  "java-runtime-headless=$_java_ver"
  "java-runtime-headless-openjdk=$_java_ver"
  "java-openjfx=$_java_ver"
)
conflicts=('zulu-8-bin')
options=('!debug')
install="$pkgname.install"
source_x86_64=("https://cdn.azul.com/zulu/bin/zulu${_zulu_build}-jdk${pkgver}-linux_x64.tar.gz")
sha256sums_x86_64=('c1b265b5f77e437a5b85d63bb945f9202bffc3a5df9613ee4a62b9e031116eaf')

_jvmdir="/usr/lib/jvm/${pkgname}"

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
  _conf_files+=('amd64/jvm.cfg')
  cd "$srcdir/zulu${_zulu_build}-jdk${pkgver}-linux_x64"
  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -a . "${pkgdir}/${_jvmdir}/"

  # copied from java8-openjdk

  # Set config files
  mv "${pkgdir}${_jvmdir}"/jre/lib/management/jmxremote.password{.template,}
  mv "${pkgdir}${_jvmdir}"/jre/lib/management/snmp.acl{.template,}

  # Conf
  install -dm 755 "${pkgdir}/etc/${pkgname}"
  for f in "${_conf_files[@]}"; do
    _file="${_jvmdir}/jre/lib/$f"
    install -D -m 644 "${pkgdir}${_file}" "${pkgdir}/etc/${pkgname}/$f"
    ln -sf "/etc/${pkgname}/$f" "${pkgdir}${_file}"
  done

  # Install license
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgbase}/"
  install -m 644 ASSEMBLY_EXCEPTION LICENSE THIRD_PARTY_README "${pkgdir}/usr/share/licenses/${pkgbase}"

  # Man pages
  for f in man/man1/* man/ja/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-zulu-8.1}"
  done
  rm -rf "${pkgdir}/${_jvmdir}/man"
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/jre/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/jre/lib/security/cacerts"
}
