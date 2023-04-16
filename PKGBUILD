# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD heavily borrows from java-openjdk in [extra] maintained by:
# Levente Polyak <anthraxx[at]archlinux[dot]org>
# Guillaume ALAUX <guillaume@archlinux.org>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

_majorver=18
_completever=18.0.2.1
_updatever=1
pkgrel=1
pkgver=${_completever}.u${_updatever}
_tag_ver=${_completever}+${_updatever}
_versuffix=U

pkgname=jdk18-temurin
pkgdesc="Temurin (OpenJDK ${_majorver} Java binaries by Adoptium, formerly AdoptOpenJDK)"
arch=('x86_64')
url='https://adoptium.net/'
license=('custom')

depends=('java-runtime-common>=3' 'java-environment-common' 'ca-certificates-utils' 'desktop-file-utils' 'libxrender' 'libxtst' 'alsa-lib')
optdepends=('gtk2: for the Gtk+ 2 look and feel'
            'gtk3: for the Gtk+ 3 look and feel')
provides=("java-runtime-headless=${_majorver}"
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
          "openjdk-src=${pkgver}")
replaces=("jdk-adoptopenjdk")
backup=(etc/java-temurin/logging.properties
        etc/java-temurin/management/jmxremote.access
        etc/java-temurin/management/jmxremote.password.template
        etc/java-temurin/management/management.properties
        etc/java-temurin/net.properties
        etc/java-temurin/sdp/sdp.conf.template
        etc/java-temurin/security/java.policy
        etc/java-temurin/security/java.security
        etc/java-temurin/security/policy/limited/default_local.policy
        etc/java-temurin/security/policy/limited/default_US_export.policy
        etc/java-temurin/security/policy/limited/exempt_local.policy
        etc/java-temurin/security/policy/README.txt
        etc/java-temurin/security/policy/unlimited/default_local.policy
        etc/java-temurin/security/policy/unlimited/default_US_export.policy
        etc/java-temurin/sound.properties)
install=install_jdk18-temurin.sh
options=(!strip)

source=(https://github.com/adoptium/temurin${_majorver}-binaries/releases/download/jdk-${_tag_ver/+/%2B}/OpenJDK${_majorver}${_versuffix}-jdk_x64_linux_hotspot_${_tag_ver/+/_}.tar.gz
        freedesktop-java.desktop
        freedesktop-jconsole.desktop
        freedesktop-jshell.desktop)
sha256sums=('7d6beba8cfc0a8347f278f7414351191a95a707d46b6586e9a786f2669af0f8b'
            'ea75ce65e1393a91fcb83beed3b84759a88bbe9df1ab4efa440062bbd2fe6c1f'
            '36b2ff191c81ce5eef9e1eed2acc54dba78b2bcdf47532607f0cc9302503a265'
            'b73453a639017037627d926cf2179d1c7e296d9c0804747848d1c799ca38652c')

_jvmdir=/usr/lib/jvm/java-${_majorver}-temurin
_jdkdir=jdk-${_tag_ver}

package() {

  install -dm 755 "${pkgdir}${_jvmdir}"
  cp -a "${srcdir}/${_jdkdir}"/* "${pkgdir}${_jvmdir}"

  cd "${pkgdir}${_jvmdir}"

  # Conf
  install -dm 755 "${pkgdir}/etc"
  mv conf "${pkgdir}/etc/java-temurin"
  ln -sf /etc/java-temurin conf

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  mv legal "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sf /usr/share/licenses/${pkgname} legal

  # Man pages
  for f in man/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-temurin${_majorver}.1}"
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
