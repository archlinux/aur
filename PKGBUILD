# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=jdk11-openj9-bin
_openj9ver=0.12.1
_majorver=11.0.2
_buildver=9_openj9-${_openj9ver}
pkgver=${_majorver}b${_buildver//-/_}
pkgrel=1
pkgdesc="Eclipse (former IBM) OpenJ9 with openjdk11"
arch=('x86_64')
url="https://adoptopenjdk.net/index.html?variant=openjdk11&jvmVariant=openj9"
license=('GPL2')
depends=('java-environment-common' 'ca-certificates-utils' 'nss')
provides=(
  "java-environment=11"
  "java-environment-openjdk=11"
  "java-runtime=11"
  "java-runtime-openjdk=11"
  "java-runtime-headless=11"
  "java-runtime-headless-openjdk=11"
)
source=("https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-${_majorver}%2B${_buildver}/OpenJDK11U-jdk_x64_linux_openj9_${_majorver}_${_buildver}_openj9-${_openj9ver}.tar.gz")
sha256sums=('a9b298391dc0baf49e935683fb13b1b18ef5fd5b1d0e1a1318c8e425ffdbcbcd')

_jvmdir=usr/lib/jvm/java-11-j9

package() {
  # Install
  install -d "${pkgdir}/${_jvmdir}"
  cd jdk-${_majorver}+${_buildver}
  cp -a bin demo include jmods lib release "${pkgdir}/${_jvmdir}/"
  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  # Legal
  install -d "${pkgdir}/usr/share/licenses/java11-j9"
  cp -a legal "${pkgdir}/usr/share/licenses/java11-j9/"
  ln -s /usr/share/licenses/java11-j9 "${pkgdir}/${_jvmdir}/legal"
  # Conf
  install -d "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/java11-j9"
  ln -s /etc/java11-j9 "${pkgdir}/${_jvmdir}/conf"
  # Man pages
  for f in man/man1/* man/ja/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-openjdk11-j9.1}"
  done
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"
}
# vim:set ts=2 sw=2 et:
