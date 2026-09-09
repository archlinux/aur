# Maintainer: Yang Jeong Hun (Nevuly) <onyxclover9931@gmail.com>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Jonathon Fernyhough <jonathon"m2x+dev>
# Contributor: Sam Guymer <sam at guymer dot me>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>

# This PKGBUILD adapted from zulu-11-bin

_jdkname=liberica-jdk-full
pkgname="${_jdkname}-bin"
_java_ver=26
pkgver=26.0.2.1+1
pkgrel=1
pkgdesc='BellSoft builds of OpenJDK are fully certified and 100% open source Java Development Kits (JDKs) for all Java development and production workloads. Full version includes OpenJFX.'
arch=(aarch64 armv7h armv8h x86_64)
url='https://bell-sw.com/'
license=('custom')
depends=('java-environment-common=3' 'java-runtime-common>=3' 'ca-certificates-utils')
optdepends=(ffmpeg freetype2 gtk2 gtk3 libnet)
provides=(
  "java-environment=${pkgver/.*}"
  "java-environment-openjdk=${pkgver/.*}"
  "java-openjfx=${pkgver/.*}"
  "java-runtime-headless=${pkgver/.*}"
  "java-runtime-headless-openjdk=${pkgver/.*}"
  "java-runtime=${pkgver/.*}"
  "java-runtime-openjdk=${pkgver/.*}"
  "liberica-jdk-bin=$pkgver"
  "liberica-jdk-full-bin=$pkgver"
  "liberica-jdk-lite-bin=$pkgver"
  "liberica-jre-bin=$pkgver"
  "liberica-jre-full-bin=$pkgver"
)
install=$_jdkname.install

backup=(etc/${_jdkname}/logging.properties
        etc/${_jdkname}/management/jmxremote.access
        etc/${_jdkname}/management/jmxremote.password.template
        etc/${_jdkname}/management/management.properties
        etc/${_jdkname}/net.properties
        etc/${_jdkname}/security/java.security
        etc/${_jdkname}/security/policy/README.txt
        etc/${_jdkname}/security/policy/limited/default_US_export.policy
        etc/${_jdkname}/security/policy/limited/default_local.policy
        etc/${_jdkname}/security/policy/limited/exempt_local.policy
        etc/${_jdkname}/security/policy/unlimited/default_US_export.policy
        etc/${_jdkname}/security/policy/unlimited/default_local.policy
        etc/${_jdkname}/sound.properties)

source=(freedesktop-java.desktop.in
        freedesktop-jconsole.desktop.in
        freedesktop-jshell.desktop.in)
source_aarch64=(https://download.bell-sw.com/java/$pkgver/bellsoft-jdk$pkgver-linux-aarch64-full.tar.gz)
source_armv7h=(https://download.bell-sw.com/java/$pkgver/bellsoft-jdk$pkgver-linux-arm32-vfp-hflt-full.tar.gz)
source_armv8h=(${source_armv7h[@]})
source_x86_64=(https://download.bell-sw.com/java/$pkgver/bellsoft-jdk$pkgver-linux-amd64-full.tar.gz)

sha1sums=('ec278cbc0a5f7a188140703c63e3b9cdb3931c29'
          '41cece227a4641fbb1e04d246c51ac2dac7f0012'
          '13af0192b2ffe02efaf5ae6a592b3ea15d9f7194')
sha1sums_aarch64=('b8c54a09b2d3b735cf491564ac0619c64d7f2c40')
sha1sums_armv7h=('d867d1722cc5cc68901d87ac264d11208a481749')
sha1sums_armv8h=('d867d1722cc5cc68901d87ac264d11208a481749')
sha1sums_x86_64=('2fceb3573f9f85579a314a8f8d850acae036357c')

# Skip debug package generation and stripping for prebuilt binaries
options=(!debug !strip)

# Upstream-provided

_jvmdir="/usr/lib/jvm/${_jdkname}"

prepare() {
  for f in *.desktop.in; do
    sed "s|@@VER@@|${pkgver/.*}|g; s|@@PATH@@|${_jvmdir}|g" $f >> ${f/.in}
  done
}

package() {
  cd jdk-${pkgver/+*}-full

  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -r . "${pkgdir}/${_jvmdir}/"

  # copied from java11-openjdk

  # Conf
  install -dm 755 "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/${_jdkname}"
  rm -rf "${pkgdir}/${_jvmdir}/conf"
  ln -s "/etc/${_jdkname}" "${pkgdir}/${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/${_jdkname}"
  rm -rf "${pkgdir}/${_jvmdir}/legal"
  ln -s "/usr/share/licenses/${_jdkname}" "${pkgdir}/${_jvmdir}/legal"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"

  # Launchers
  for f in java jconsole jshell; do
    install -Dm644 "${srcdir}"/freedesktop-${f}.desktop "${pkgdir}"/usr/share/applications/${f}-${_jdkname}.desktop
  done
}
