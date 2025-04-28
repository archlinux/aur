# Maintainer: Arthur Brugiere <contact@arthurbrugiere.fr>

# This PKGBUILD heavily borrows from jdk21-temurin maintained by:
# Michael Lass <bevan@bi-co.net>

_majorver=23
_completever=23.0.2
_updatever=7
pkgrel=1
pkgver=${_completever}.u${_updatever}
_tag_ver=${_completever}+${_updatever}
_versuffix=U

pkgname=jdk23-temurin
pkgdesc="Temurin ${_majorver} (OpenJDK ${_majorver} Java binaries by Adoptium, formerly AdoptOpenJDK)"
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
backup=(etc/java-${_majorver}-temurin/logging.properties
        etc/java-${_majorver}-temurin/management/jmxremote.access
        etc/java-${_majorver}-temurin/management/jmxremote.password.template
        etc/java-${_majorver}-temurin/management/management.properties
        etc/java-${_majorver}-temurin/net.properties
        etc/java-${_majorver}-temurin/sdp/sdp.conf.template
        etc/java-${_majorver}-temurin/security/java.policy
        etc/java-${_majorver}-temurin/security/java.security
        etc/java-${_majorver}-temurin/security/policy/limited/default_local.policy
        etc/java-${_majorver}-temurin/security/policy/limited/default_US_export.policy
        etc/java-${_majorver}-temurin/security/policy/limited/exempt_local.policy
        etc/java-${_majorver}-temurin/security/policy/README.txt
        etc/java-${_majorver}-temurin/security/policy/unlimited/default_local.policy
        etc/java-${_majorver}-temurin/security/policy/unlimited/default_US_export.policy
        etc/java-${_majorver}-temurin/sound.properties)
install=install_jdk${_majorver}-temurin.sh
options=(!strip)

source=(https://github.com/adoptium/temurin${_majorver}-binaries/releases/download/jdk-${_tag_ver/+/%2B}/OpenJDK${_majorver}${_versuffix}-jdk_x64_linux_hotspot_${_tag_ver/+/_}.tar.gz
        freedesktop-java.desktop
        freedesktop-jconsole.desktop
        freedesktop-jshell.desktop)
sha256sums=('870ac8c05c6fe563e7a3878a47d0234b83c050e83651d2c47e8b822ec74512dd'
            '858f1e7700a3c5658ea2b3874f3ad32b1ffffd1e93c21f7d16b57095c307183d'
            '41af2cbeed31a4f463f22fb409de9efe16b38904cdb5b104ae9414d9a7845a03'
            '177e31fa4be661c04b6294e6611ee8630dbd303d896ccaa10454511bf72bf63f')

_jvmdir=/usr/lib/jvm/java-${_majorver}-temurin
_jdkdir=jdk-${_tag_ver}

package() {

  install -dm 755 "${pkgdir}${_jvmdir}"
  cp -a "${srcdir}/${_jdkdir}"/* "${pkgdir}${_jvmdir}"

  cd "${pkgdir}${_jvmdir}"

  # Conf
  install -dm 755 "${pkgdir}/etc"
  mv conf "${pkgdir}/etc/java-${_majorver}-temurin"
  ln -sf /etc/java-${_majorver}-temurin conf

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
