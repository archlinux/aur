# Maintainer: therealfarfetchd <aur@therealfarfetchd.dev>

# Based on jdk11-adoptopenjdk

_majorver=11
_minorver=0
_securityver=5
_updatever=5
_tag_ver="${_majorver}.${_minorver}.${_securityver}+${_updatever}"
pkgver="${_majorver}.${_minorver}.${_securityver}.u${_updatever}"
pkgrel=1

pkgname='jdk11-openjdk-dcevm'
pkgdesc='OpenJDK Java 11 development kit with DCEVM patches (Trava build)'
arch=('x86_64')
url='https://github.com/TravaOpenJDK/trava-jdk-11-dcevm'
license=('custom')

depends=('java-runtime-common>=3' 'ca-certificates-utils' 'desktop-file-utils' 'libxrender' 'libxtst' 'alsa-lib')

optdepends=(
  'gtk2: for the Gtk+ 2 look and feel'
  'gtk3: for the Gtk+ 3 look and feel'
)

provides=(
  "java-runtime-headless=${_majorver}"
  "java-runtime-headless-openjdk=${_majorver}"
  "jre${_majorver}-openjdk-headless=${pkgver}"
  "jre-openjdk-headless=${pkgver}"
  "java-runtime=${_majorver}"
  "java-runtime-openjdk=${_majorver}"
  "jre${_majorver}-openjdk=${pkgver}"
  "jre-openjdk=${pkgver}"
  "java-environment=${_majorver}"
  "java-environment-openjdk=${_majorver}"
  "jdk${_majorver}-openjdk=${pkgver}"
  "jdk-openjdk=${pkgver}"
  "openjdk${_majorver}-src=${pkgver}"
  "openjdk-src=${pkgver}"
)

backup=(
  etc/${pkgname}/net.properties
  etc/${pkgname}/logging.properties
  etc/${pkgname}/security/java.security
  etc/${pkgname}/security/policy/limited/exempt_local.policy
  etc/${pkgname}/security/policy/limited/default_US_export.policy
  etc/${pkgname}/security/policy/limited/default_local.policy
  etc/${pkgname}/security/policy/unlimited/default_US_export.policy
  etc/${pkgname}/security/policy/unlimited/default_local.policy
  etc/${pkgname}/security/policy/README.txt
  etc/${pkgname}/security/java.policy
  etc/${pkgname}/management/management.properties
  etc/${pkgname}/management/jmxremote.access
  etc/${pkgname}/management/jmxremote.password.template
  etc/${pkgname}/sound.properties
)

install='install_jdk11-openjdk-dcevm.sh'

source=(
  https://github.com/TravaOpenJDK/trava-jdk-11-dcevm/releases/download/dcevm-${_tag_ver}/java11-openjdk-dcevm-linux.tar.gz
  freedesktop-java.desktop
  freedesktop-jconsole.desktop
  freedesktop-jshell.desktop
)

sha256sums=(
  '78ff7c57d14eb7a62008ab6275a0e66070bfb6dbd2055cd0e31c508a6324c4ee'
  '428325db0d1483e73bf075fa6ef06c7a50dcbf452651751e93c4c0cb018c127a'
  'a51ea0dc28347d43175832546454cf13b8c453408c4439df962a157f4af7e81c'
  'bba0bbf1cef35199c7e6fc0531142d15c2a1231f4c9d9c292316d0d415eae148'
)

_jvmdir=/usr/lib/jvm/java-${_majorver}-openjdk-dcevm
_jdkdir=dcevm-${_tag_ver}

package() {
  install -dm 755 "${pkgdir}${_jvmdir}"
  cp -a "${srcdir}/${_jdkdir}"/* "${pkgdir}${_jvmdir}"

  cd "${pkgdir}${_jvmdir}"

  # Conf
  install -dm 755 "${pkgdir}/etc"
  mv conf "${pkgdir}/etc/${pkgname}"
  ln -sf /etc/${pkgname} conf

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  mv legal "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sf /usr/share/licenses/${pkgname} legal

  # Man pages
  for f in man/man1/* man/ja/man1/* man/ja_JP.UTF-8/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-adoptopenjdk${_majorver}.1}"
  done
  rm -rf man
  ln -sf /usr/share/man man

  # Link JKS keystore from ca-certificates-utils
  rm -f lib/security/cacerts
  ln -sf /etc/ssl/certs/java/cacerts lib/security/cacerts

  # Desktop files
  for f in jconsole java jshell; do
    install -Dm 644 \
      "${srcdir}/freedesktop-${f}.desktop" \
      "${pkgdir}/usr/share/applications/${f}-${pkgname}.desktop"
  done

}
