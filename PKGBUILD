# Maintainer: nycex <bernhard / ithnet.com>

# Based on jdk11-adoptopenjdk

_majorver=11
_minorver=0
_securityver=15
_updatever=1
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
conflicts=('jdk11-openjdk-dcevm-conflicts-fixed')
replaces=('jdk11-openjdk-dcevm-conflicts-fixed')

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
  java11-openjdk-dcevm-${_tag_ver}.tar.gz::https://github.com/TravaOpenJDK/trava-jdk-11-dcevm/releases/download/dcevm-${_tag_ver}/Openjdk11u-dcevm-linux-x64.tar.gz
  freedesktop-java.desktop
  freedesktop-jconsole.desktop
  freedesktop-jshell.desktop
)

b2sums=('c61a4a731083488d9dc1b4ab4b2fde26ac9607b736b80bae31c4c2726fc0dc4f9e20cb7a198fef143dba4e474f6e27dc1a0ab756320aa426b84e383167f897b8'
        'aa36d91c29dc026188b39a4c4dbc783f11c6dc4dcd49b2a3c81c4f8275dc775f51aec5bea76e62ed0a7298eb01cde432caf84db68380385bee4760fbc5a81473'
        'd3ca17323864dbec4fcb3d7c2a13255e16aa9aaa745b32708189d6bb4ac5e782a0c818b0b76a3ee19447370259a1ba738b46096313c9e6c659063ec459415ad0'
        '56b4a166aa89b2f3d1d7858430ebf0b9f41a9c47d7d3de1ffb44fe932cce7ebc7ace1b5ceb0de12aaaf98672a9c3a1804cb3dbf2166796aed21abea9058585cc')

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
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-openjdk-dcevm${_majorver}.1}"
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
