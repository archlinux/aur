# Maintainer: Sam Guymer <sam at guymer dot me>

_jdkname=zulu-8
pkgname="${_jdkname}-bin"
_java_ver=8
_zulu_build=8.70.0.23-ca
pkgver=8.0.372
pkgrel=1
pkgdesc='Zulu Community builds of OpenJDK are fully certified and 100% open source Java Development Kits (JDKs) for all Java development and production workloads.'
arch=('aarch64' 'x86_64')
url='https://www.azul.com/products/zulu-community/'
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
source_aarch64=("https://cdn.azul.com/zulu-embedded/bin/zulu${_zulu_build}-jdk${pkgver}-linux_aarch64.tar.gz")
source_x86_64=("https://cdn.azul.com/zulu/bin/zulu${_zulu_build}-jdk${pkgver}-linux_x64.tar.gz")
sha256sums_aarch64=('c76da27e2cd5c396d72633baf27edd17031d87e5cb6c8620255dcd0384e61afa')
sha256sums_x86_64=('afcda0f08cd05efd3bd60b021618931595ab03689f1c1fefcd46ef7761276d10')

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
    cd "$srcdir/zulu${_zulu_build}-jdk${pkgver}-linux_aarch64"
  else
    _conf_files+=('amd64/jvm.cfg')
    cd "$srcdir/zulu${_zulu_build}-jdk${pkgver}-linux_x64"
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
