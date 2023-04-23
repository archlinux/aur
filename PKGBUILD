# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD heavily borrows from java-openjdk in [extra] maintained by:
# Levente Polyak <anthraxx[at]archlinux[dot]org>
# Guillaume ALAUX <guillaume@archlinux.org>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

_majorver=11
_minorver=0
_securityver=19
_updatever=7
pkgrel=1
pkgver=${_majorver}.${_minorver}.${_securityver}.u${_updatever}
_tag_ver=${_majorver}.${_minorver}.${_securityver}+${_updatever}
_tag_ver_short=${_majorver}.${_minorver}.${_securityver}+${_updatever%.*}

pkgname=jdk11-temurin
pkgdesc="Temurin ${_majorver} (OpenJDK ${_majorver} Java binaries by Adoptium, formerly AdoptOpenJDK)"
arch=('x86_64' 'armv7h')
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
replaces=("jdk11-adoptopenjdk")
backup=(etc/java-${_majorver}-temurin/net.properties
        etc/java-${_majorver}-temurin/logging.properties
        etc/java-${_majorver}-temurin/security/java.security
        etc/java-${_majorver}-temurin/security/policy/limited/exempt_local.policy
        etc/java-${_majorver}-temurin/security/policy/limited/default_US_export.policy
        etc/java-${_majorver}-temurin/security/policy/limited/default_local.policy
        etc/java-${_majorver}-temurin/security/policy/unlimited/default_US_export.policy
        etc/java-${_majorver}-temurin/security/policy/unlimited/default_local.policy
        etc/java-${_majorver}-temurin/security/policy/README.txt
        etc/java-${_majorver}-temurin/security/java.policy
        etc/java-${_majorver}-temurin/management/management.properties
        etc/java-${_majorver}-temurin/management/jmxremote.access
        etc/java-${_majorver}-temurin/management/jmxremote.password.template
        etc/java-${_majorver}-temurin/sound.properties)
install=install_jdk11-temurin.sh
options=(!strip)

source_x86_64=(https://github.com/adoptium/temurin${_majorver}-binaries/releases/download/jdk-${_tag_ver/+/%2B}/OpenJDK${_majorver}U-jdk_x64_linux_hotspot_${_tag_ver_short/+/_}.tar.gz)
sha256sums=('502d5dbdde0e4ef009af0f088e8431e0c1721ba2967951e690bf86d184493f75'
            '464c9a7518831eef7cf952a7bd51a1f0d80c19910d21dc1fce693fa6c2ea65df'
            '0f53d0b34412d1a2f30c33bcd68a8f682f1fc86fc76bf290bbb91cb5c1ad28ed')
sha256sums_x86_64=('5f19fb28aea3e28fcc402b73ce72f62b602992d48769502effe81c52ca39a581')
sha256sums_armv7h=('be07af349f0d2e1ffb7e01e1e8bac8bffd76e22f6cc1354e5b627222e3395f41')
source_armv7h=(https://github.com/adoptium/temurin${_majorver}-binaries/releases/download/jdk-${_tag_ver/+/%2B}/OpenJDK${_majorver}U-jdk_arm_linux_hotspot_${_tag_ver_short/+/_}.tar.gz)
source=(freedesktop-java.desktop
        freedesktop-jconsole.desktop
        freedesktop-jshell.desktop)

_jvmdir=/usr/lib/jvm/java-${_majorver}-temurin
_jdkdir=jdk-${_tag_ver_short}

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
  for f in man/man1/* man/ja/man1/* man/ja_JP.UTF-8/man1/*; do
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
