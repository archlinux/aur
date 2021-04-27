# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD heavily borrows from java-openjdk in [extra] maintained by:
# Levente Polyak <anthraxx[at]archlinux[dot]org>
# Guillaume ALAUX <guillaume@archlinux.org>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

_majorver=16
_completever=16.0.1
_updatever=9
pkgrel=1
pkgver=${_completever}.u${_updatever}
_tag_ver=${_completever}+${_updatever}

pkgname=jdk-adoptopenjdk
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
backup=(etc/${pkgname}/logging.properties
        etc/${pkgname}/management/jmxremote.access
        etc/${pkgname}/management/jmxremote.password.template
        etc/${pkgname}/management/management.properties
        etc/${pkgname}/net.properties
        etc/${pkgname}/sdp/sdp.conf.template
        etc/${pkgname}/security/java.policy
        etc/${pkgname}/security/java.security
        etc/${pkgname}/security/policy/limited/default_local.policy
        etc/${pkgname}/security/policy/limited/default_US_export.policy
        etc/${pkgname}/security/policy/limited/exempt_local.policy
        etc/${pkgname}/security/policy/README.txt
        etc/${pkgname}/security/policy/unlimited/default_local.policy
        etc/${pkgname}/security/policy/unlimited/default_US_export.policy
        etc/${pkgname}/sound.properties)
install=install_jdk-adoptopenjdk.sh

source=(https://github.com/AdoptOpenJDK/openjdk${_majorver}-binaries/releases/download/jdk-${_tag_ver/+/%2B}/OpenJDK${_majorver}U-jdk_x64_linux_hotspot_${_tag_ver/+/_}.tar.gz
        freedesktop-java.desktop
        freedesktop-jconsole.desktop
        freedesktop-jshell.desktop)
sha256sums=('7fdda042207efcedd30cd76d6295ed56b9c2e248cb3682c50898a560d4aa1c6f'
            'e931a0070e4a69dd4b37789c28057c1b956e9830fbedc0efe38aa9988a02b444'
            'bb86dc8ef9ad1bac2045b575e84fb6696d70104dd610d8a5507b068d1f96cc58'
            '31122fb2dc414968d7cea452e5abc90c32813cce8db2f83023d19fe04b40f6d5')

_jvmdir=/usr/lib/jvm/java-${_majorver}-adoptopenjdk
_jdkdir=jdk-${_tag_ver}

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
  for f in man/man1/*; do
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
