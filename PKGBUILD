# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

_majorver=8
_variant=hotspot
pkgrel=1
pkgver=8.0.242.08
_tag_ver=8u242-b08

pkgname=jre8-adoptopenjdk-hotspot
pkgdesc="AdoptOpenJDK Java ${_majorver} full runtime environment"
arch=('x86_64')
url='https://adoptopenjdk.net/'
license=('custom')

depends=('java-runtime-common>=3' 'ca-certificates-utils' 'desktop-file-utils' 'libxrender' 'libxtst' 'alsa-lib')
optdepends=('gtk2: for the Gtk+ 2 look and feel'
            'gtk3: for the Gtk+ 3 look and feel')
provides=("java-runtime=${_majorver}"
          "java-runtime-openjdk=${_majorver}")
install=install_jdk-adoptopenjdk.sh

source=(https://github.com/AdoptOpenJDK/openjdk${_majorver}-binaries/releases/download/jdk${_tag_ver}/OpenJDK${_majorver}U-jre_x64_linux_${_variant}_${_tag_ver//-/}.tar.gz
        freedesktop-java.desktop
        freedesktop-jconsole.desktop
        freedesktop-jshell.desktop)
sha256sums=('5edfaefdbb0469d8b24d61c8aef80c076611053b1738029c0232b9a632fe2708'
            '47a879c24f1cfe41c239c4d39458c08522e36cad8b1dd4f334b493f84a7a23a6'
            '5be900de884c6acd287ddb980721f1ed5bf7f584ebe90feacab3de3ceec3495a'
            '6731d03365296fa8609e483fcbcf6d93bf727aa67ce60bf4969da33c861337aa')

_jvmdir=/usr/lib/jvm/java-${_majorver}-adoptopenjdk-hotspot/jre
_jdkdir=jdk${_tag_ver}-jre

package() {

  install -dm 755 "${pkgdir}${_jvmdir}"
  cp -a "${srcdir}/${_jdkdir}"/* "${pkgdir}${_jvmdir}"

  cd "${pkgdir}${_jvmdir}"

  # Licenses
  install -dm 755 "${pkgdir}/usr/share/licenses"
  mkdir "${pkgdir}/usr/share/licenses/${pkgname}"
  mv ASSEMBLY_EXCEPTION "${pkgdir}/usr/share/licenses/${pkgname}/ASSEMBLY_EXCEPTION"
  mv LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mv THIRD_PARTY_README "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_README"
  ln -sf /usr/share/licenses/${pkgname}/ASSEMBLY_EXCEPTION ASSEMBLY_EXCEPTION
  ln -sf /usr/share/licenses/${pkgname}/LICENSE LICENSE
  ln -sf /usr/share/licenses/${pkgname}/THIRD_PARTY_README THIRD_PARTY_README

  # Man Pages
  for f in man/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-adoptopenjdk${_majorver}.1}"
  done
  rm -rf man
  ln -sf /usr/share/man man

  # Link JKS keystore from ca-certificates-utils.
  rm -f lib/security/cacerts
  ln -sf /etc/ssl/certs/java/cacerts lib/security/cacerts

  # Desktop Files
  for f in jconsole java jshell; do
    install -Dm 644 \
      "${srcdir}/freedesktop-${f}.desktop" \
      "${pkgdir}/usr/share/applications/${f}-${pkgname}.desktop"
  done

}
