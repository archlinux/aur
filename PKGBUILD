# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD heavily borrows from java-openjdk in [extra] maintained by:
# Levente Polyak <anthraxx[at]archlinux[dot]org>
# Guillaume ALAUX <guillaume@archlinux.org>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

_majorver=24
_completever=24.0.2
_updatever=12
pkgrel=1
pkgver=${_completever}.u${_updatever}
_tag_ver=${_completever}+${_updatever}
#_tag_ver=${_majorver}+${_updatever}
_versuffix=U

pkgname=jdk-temurin
pkgdesc="Temurin (OpenJDK ${_majorver} Java binaries by Adoptium, formerly AdoptOpenJDK)"
arch=('x86_64')
url='https://adoptium.net/'
license=('custom')

depends=('java-runtime-common>=3' 'java-environment-common' 'ca-certificates-utils' 'desktop-file-utils' 'libxrender' 'libxtst' 'alsa-lib')
optdepends=('gtk2: for the Gtk+ 2 look and feel'
            'gtk3: for the Gtk+ 3 look and feel')
provides=("java-runtime-headless=${_majorver}"
          "java-runtime-headless-openjdk=${_majorver}"
          "java-runtime=${_majorver}"
          "java-runtime-openjdk=${_majorver}"
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
install=install_jdk-temurin.sh
options=(!strip)

source=(https://github.com/adoptium/temurin${_majorver}-binaries/releases/download/jdk-${_tag_ver/+/%2B}/OpenJDK${_majorver}${_versuffix}-jdk_x64_linux_hotspot_${_tag_ver/+/_}.tar.gz
        freedesktop-java.desktop
        freedesktop-jconsole.desktop
        freedesktop-jshell.desktop)
sha256sums=('aea1cc55e51cf651c85f2f00ad021603fe269c4bb6493fa97a321ad770c9b096'
            'ce49e3435f1e229260f429d61896be9a6f9d2b0cdc72d2c0091fed6ac55c388a'
            'decb720bd8d5e8628e836af8813bfbcf7fec00a4d119765e993a19cf235d8784'
            'a71dbdb6f769bf33a55e78ef0fe2300929a9a291b6e5ccba4245c67f679321a5')

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
