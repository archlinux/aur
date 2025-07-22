# Maintainer: Elvis Parsaloi <parsaloi35@gmail.com>
_jdkname=liberica-nik-23-full
pkgname="${_jdkname}-bin"
_java_ver=21
_pkgver=${_java_ver}.0.8+13
_nikver=23.1.8
pkgver=${_nikver/+/.}
pkgrel=1
pkgdesc='Liberica NIK is a downstream of GraalVM Community edition. The full version provides support for JavaFX and Swing.'
arch=(x86_64)
url='https://bell-sw.com/'
license=('custom')
depends=('java-environment-common=3' 'java-runtime-common>=3' 'ca-certificates-utils')
optdepends=('ffmpeg' 'freetype2' 'gtk2' 'gtk3' 'libnet')
provides=(
  "java-environment=${_java_ver}"
  "java-environment-openjdk=${_java_ver}"
  "java-openjfx=${_java_ver}"
  "java-runtime-headless=${_java_ver}"
  "java-runtime-headless-openjdk=${_java_ver}"
  "java-runtime=${_java_ver}"
  "java-runtime-openjdk=${_java_ver}"
  "liberica-jdk-${_java_ver}-bin=${_pkgver}"
  "liberica-jdk-${_java_ver}-full-bin=${_pkgver}"
  "liberica-jdk-${_java_ver}-lite-bin=${_pkgver}"
  "liberica-jre-${_java_ver}-bin=${_pkgver}"
  "liberica-jre-${_java_ver}-full-bin=${_pkgver}"
)
install=${_jdkname}.install

backup=(
  "etc/${_jdkname}/logging.properties"
  "etc/${_jdkname}/management/jmxremote.access"
  "etc/${_jdkname}/management/jmxremote.password.template"
  "etc/${_jdkname}/management/management.properties"
  "etc/${_jdkname}/net.properties"
  "etc/${_jdkname}/security/java.policy"
  "etc/${_jdkname}/security/java.security"
  "etc/${_jdkname}/security/policy/README.txt"
  "etc/${_jdkname}/security/policy/limited/default_US_export.policy"
  "etc/${_jdkname}/security/policy/limited/default_local.policy"
  "etc/${_jdkname}/security/policy/limited/exempt_local.policy"
  "etc/${_jdkname}/security/policy/unlimited/default_US_export.policy"
  "etc/${_jdkname}/security/policy/unlimited/default_local.policy"
  "etc/${_jdkname}/sound.properties"
)

source=(
  'freedesktop-java.desktop.in'
  'freedesktop-jconsole.desktop.in'
  'freedesktop-jshell.desktop.in'
  "${_jdkname}16.png::https://raw.githubusercontent.com/openjdk/jdk/master/src/java.desktop/unix/classes/sun/awt/X11/java-icon16.png"
  "${_jdkname}24.png::https://raw.githubusercontent.com/openjdk/jdk/master/src/java.desktop/unix/classes/sun/awt/X11/java-icon24.png"
  "${_jdkname}32.png::https://raw.githubusercontent.com/openjdk/jdk/master/src/java.desktop/unix/classes/sun/awt/X11/java-icon32.png"
  "${_jdkname}48.png::https://raw.githubusercontent.com/openjdk/jdk/master/src/java.desktop/unix/classes/sun/awt/X11/java-icon48.png"
)

source_x86_64=(
  "https://download.bell-sw.com/vm/${_nikver/+*}/bellsoft-liberica-vm-full-openjdk${_pkgver}-${_nikver}+1-linux-amd64.tar.gz"
)

sha1sums=(  
  '648589b6de677b9ef3f8864494bf69aaa7e4fc8e'
  '00eacd0bb3f880bfac258413431388ff0613dadb'
  '4039a3cbbea0467f224b324ee4fe5d378a49d4aa'
  '36096a57cebd346e08efc68326fe77960d43726f'
  'b8233f9ff931ce97a265827fac18ed90f4e248c6'
  'a0da2952bc87a425182c3ac88e88649fbaa7cb65'
  'eb36aa73a9be98164447774217865b91e79d503c'
)

sha1sums_x86_64=('76718e38bd6123fc8a9bcc258d54044deb5cce77')

_jvmdir="/usr/lib/jvm/${_jdkname}"

prepare() {
  for f in *.desktop.in; do
    sed "s|@@VER@@|${_java_ver}|g" "$f" > "${f/.in/}"
  done
}

package() {
  cd "bellsoft-liberica-vm-full-openjdk${_java_ver}-${_nikver/+*}"

  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -a . "${pkgdir}/${_jvmdir}/"

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
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-${_jdkname}.1}"
  done
  rm -rf "${pkgdir}/${_jvmdir}/man"
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"

  # Icons and launchers
  for s in 16 24 32 48; do
    install -Dm644 "${srcdir}/${_jdkname}${s}.png" "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/${_jdkname}.png"
  done
  for f in java jconsole jshell; do
    install -Dm644 "${srcdir}/freedesktop-${f}.desktop" "${pkgdir}/usr/share/applications/${f}-${_jdkname}.desktop"
  done
}
