# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD heavily borrows from java-openjdk in [extra] maintained by:
# Levente Polyak <anthraxx[at]archlinux[dot]org>
# Guillaume ALAUX <guillaume@archlinux.org>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

_majorver=11
_minorver=0
_securityver=11
_updatever=9
pkgrel=1
pkgver=${_majorver}.${_minorver}.${_securityver}.u${_updatever}
_tag_ver=${_majorver}.${_minorver}.${_securityver}+${_updatever}
_tag_ver_short=${_majorver}.${_minorver}.${_securityver}+${_updatever%.*}

pkgname=jdk11-adoptopenjdk
pkgdesc="OpenJDK Java ${_majorver} development kit (AdoptOpenJDK build)"
arch=('x86_64')
url='https://adoptopenjdk.net/'
license=('custom')

depends=('java-runtime-common>=3' 'ca-certificates-utils' 'desktop-file-utils' 'libxrender' 'libxtst' 'alsa-lib')
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
backup=(etc/${pkgname}/net.properties
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
        etc/${pkgname}/sound.properties)
install=install_jdk11-adoptopenjdk.sh

source=(https://github.com/AdoptOpenJDK/openjdk${_majorver}-binaries/releases/download/jdk-${_tag_ver/+/%2B}/OpenJDK${_majorver}U-jdk_x64_linux_hotspot_${_tag_ver_short/+/_}.tar.gz
        freedesktop-java.desktop
        freedesktop-jconsole.desktop
        freedesktop-jshell.desktop)


_jvmdir=/usr/lib/jvm/java-${_majorver}-adoptopenjdk
_jdkdir=jdk-${_tag_ver_short}

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
sha256sums=('e99b98f851541202ab64401594901e583b764e368814320eba442095251e78cb'
            '734aab5e8fca5360fd996142a0c0ff23434da56f83c21b26cfbcbf31556230eb'
            '53b7da18785675438d1d7cfa776be419a313c11049c48f791c7426224fe51025'
            'bc4305c5870fa8e050c0a2cbc629a8f84e366200b436429c789038596a4259f6')
