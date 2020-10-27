# Maintainer: Jonathon Fernyhough <jonathon"m2x+dev>
# Contributor: Sam Guymer <sam at guymer dot me>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>

# This PKGBUILD adapted from zulu-11-bin

_jdkname=liberica-jdk-full
pkgname="${_jdkname}-bin"
_java_ver=15.0.1
pkgver=${_java_ver}+9
pkgrel=2
pkgdesc='BellSoft builds of OpenJDK are fully certified and 100% open source Java Development Kits (JDKs) for all Java development and production workloads. Full version includes OpenJFX.'
arch=(aarch64 armv7h armv8h x86_64)
url='https://bell-sw.com/'
license=('custom')
depends=('java-environment-common=3' 'java-runtime-common>=3' 'ca-certificates-utils')
optdepends=(ffmpeg freetype2 gtk2 gtk3 libnet)
provides=(
  "java-environment=${_java_ver/.*}"
  "java-environment-openjdk=${_java_ver/.*}"
  "java-openjfx=${_java_ver/.*}"
  "java-runtime-headless=${_java_ver/.*}"
  "java-runtime-headless-openjdk=${_java_ver/.*}"
  "java-runtime=${_java_ver/.*}"
  "java-runtime-openjdk=${_java_ver/.*}"
  "liberica-jdk-bin=$pkgver"
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
        etc/${_jdkname}/security/java.policy
        etc/${_jdkname}/security/java.security
        etc/${_jdkname}/security/policy/README.txt
        etc/${_jdkname}/security/policy/limited/default_US_export.policy
        etc/${_jdkname}/security/policy/limited/default_local.policy
        etc/${_jdkname}/security/policy/limited/exempt_local.policy
        etc/${_jdkname}/security/policy/unlimited/default_US_export.policy
        etc/${_jdkname}/security/policy/unlimited/default_local.policy
        etc/${_jdkname}/sound.properties)

source=(freedesktop-java.desktop
        freedesktop-jconsole.desktop
        freedesktop-jshell.desktop
        ${_jdkname}16.png::https://hg.openjdk.java.net/jdk-updates/jdk15u/raw-file/c346ef23c8a6/src/java.desktop/unix/classes/sun/awt/X11/java-icon16.png
        ${_jdkname}24.png::https://hg.openjdk.java.net/jdk-updates/jdk15u/raw-file/c346ef23c8a6/src/java.desktop/unix/classes/sun/awt/X11/java-icon24.png
        ${_jdkname}32.png::https://hg.openjdk.java.net/jdk-updates/jdk15u/raw-file/c346ef23c8a6/src/java.desktop/unix/classes/sun/awt/X11/java-icon32.png
        ${_jdkname}48.png::https://hg.openjdk.java.net/jdk-updates/jdk15u/raw-file/c346ef23c8a6/src/java.desktop/unix/classes/sun/awt/X11/java-icon48.png)
sha1sums=(73b9ab762976cb9c2bfcecdbd6334b4c727b0876
          96890ae2efed2f4244036bc59d018c2707fa9749
          dbcbe1243717288176b17e203982f41d32c4a419
          36096a57cebd346e08efc68326fe77960d43726f
          b8233f9ff931ce97a265827fac18ed90f4e248c6
          a0da2952bc87a425182c3ac88e88649fbaa7cb65
          eb36aa73a9be98164447774217865b91e79d503c)

source_aarch64=(https://download.bell-sw.com/java/$pkgver/bellsoft-jdk$pkgver-linux-aarch64-full.tar.gz)
source_armv7h=(https://download.bell-sw.com/java/$pkgver/bellsoft-jdk$pkgver-linux-arm32-vfp-hflt-full.tar.gz)
source_armv8h=(${source_armv7h[@]})
source_x86_64=(https://download.bell-sw.com/java/$pkgver/bellsoft-jdk$pkgver-linux-amd64-full.tar.gz)

# Upstream-provided
sha1sums_aarch64=('39ac4db4b2d63c48b18f226bd4b25b34f0f3ad4e')
sha1sums_armv7h=('bdd4ade7c6618a028ccf393c778da9a2fc613242')
sha1sums_armv8h=(${sha1sums_armv7h[@]})
sha1sums_x86_64=('d9266c6a8b8f512ccb4efc67ddfc2f5bf7e8fa07')

_jvmdir="/usr/lib/jvm/${_jdkname}"

package() {
  cd jdk-$_java_ver-full

  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -a . "${pkgdir}/${_jvmdir}/"

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

  # Man pages
  for f in man/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-$_jdkname.1}"
  done
  rm -rf "${pkgdir}/${_jvmdir}/man"
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"

  # Icons and launchers
  for s in 16 24 32 48; do
    install -Dm644 "${srcdir}"/${_jdkname}${s}.png "${pkgdir}"/usr/share/icons/hicolor/${s}x${s}/apps/${_jdkname}.png
  done
  for f in java jconsole jshell; do
    install -Dm644 "${srcdir}"/freedesktop-${f}.desktop "${pkgdir}"/usr/share/applications/${f}-${_jdkname}.desktop
  done
}
