# Maintainer: Elvis Parsaloi <parsaloi35@gmail.com>
_jdkname=liberica-nik-25-full
pkgname="${_jdkname}-bin"
_java_ver=25
_pkgver=${_java_ver}+37
_nikver=25.0.0+1
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
  "https://download.bell-sw.com/vm/${_nikver/+*}/bellsoft-liberica-vm-full-openjdk${_pkgver}-${_nikver}-linux-amd64.tar.gz"
)

sha1sums=(
  'ece0a6c64fe7b5ece556457c9bf768ef3bec1485'
  '47084145338ac067418c71bf371ac324bcfe92b6'
  '7821b9b4f5463270f15ce8ae7ec970a93d45e8b1'
  '36096a57cebd346e08efc68326fe77960d43726f'
  'b8233f9ff931ce97a265827fac18ed90f4e248c6'
  'a0da2952bc87a425182c3ac88e88649fbaa7cb65'
  'eb36aa73a9be98164447774217865b91e79d503c'
)

sha1sums_x86_64=('306eec0bf07e60070ad7094ff197a3f73c0a6ed7')

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

  # Man pages (conditional: only if directory exists)
  if [[ -d man/man1 ]]; then
    for f in man/man1/*; do
      install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-${_jdkname}.1}"
    done
    rm -rf "${pkgdir}/${_jvmdir}/man"
    ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"
  fi

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
