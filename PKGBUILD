# Maintainer: Yang Jeong Hun (Nevuly) <onyxclover9931@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon"m2x+dev>
# Contributor: Sam Guymer <sam at guymer dot me>

# This PKGBUILD adapted from zulu-8-bin

_jdkname=liberica-jdk-8-full
pkgname="${_jdkname}-bin"
_java_ver=8
pkgver=8u372+7
pkgrel=1
pkgdesc='BellSoft builds of OpenJDK are fully certified and 100% open source Java Development Kits (JDKs) for all Java development and production workloads. Full version includes OpenJFX.'
arch=(i686 x86_64)
url='https://bell-sw.com/'
license=('custom')
depends=('java-environment-common=3' 'java-runtime-common>=3' 'ca-certificates-utils')
optdepends=(ffmpeg freetype2 gtk2 gtk3 libnet)
provides=(
  "java-environment=$_java_ver"
  "java-environment-openjdk=$_java_ver"
  "java-runtime-headless=$_java_ver"
  "java-runtime-headless-openjdk=$_java_ver"
  "java-runtime=$_java_ver"
  "java-runtime-openjdk=$_java_ver"
  "liberica-jdk-8-bin=$pkgver"
  "liberica-jdk-8-lite-bin=$pkgver"
  "liberica-jre-8-bin=$pkgver"
  "liberica-jre-8-full-bin=$pkgver"
)
install=$_jdkname.install

source_i686=(https://download.bell-sw.com/java/$pkgver/bellsoft-jdk$pkgver-linux-i586-full.tar.gz)
source_x86_64=(https://download.bell-sw.com/java/$pkgver/bellsoft-jdk$pkgver-linux-amd64-full.tar.gz)

# Upstream-provided
sha1sums_i686=('98da3605ad50d08f8d1582d30604b7f88a8cab53')
sha1sums_x86_64=('fbb0b19caf5e847958992831e32eca0f3784ef96')

_jvmdir="/usr/lib/jvm/${_jdkname}"

# Upstream config files that should go to etc and get backup
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
  cd jdk${pkgver/+*/}-full

  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -a * "${pkgdir}/${_jvmdir}/"

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
  install -d -m 755 "${pkgdir}/usr/share/licenses/${_jdkname}/"
  install -m 644 ASSEMBLY_EXCEPTION LICENSE THIRD_PARTY_README "${pkgdir}/usr/share/licenses/${_jdkname}"

  # Man pages
  for f in man/man1/* man/ja/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-$_jdkname.1}"
  done
  rm -rf "${pkgdir}/${_jvmdir}/man"
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/jre/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/jre/lib/security/cacerts"
}
