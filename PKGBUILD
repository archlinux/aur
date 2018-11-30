# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=jdk11-openj9-bin
_majorver=11.0.1
_buildver=13
pkgver=${_majorver}b${_buildver}
pkgrel=1
pkgdesc="Eclipse (former IBM) OpenJ9 with openjdk${_majorver}"
arch=('x86_64')
url="https://adoptopenjdk.net/index.html?variant=openjdk11-openj9"
license=('GPL2')
depends=('java-environment-common' 'ca-certificates-utils' 'nss')
provides=(
  "java-environment=${_majorver}" 
  "java-environment-openjdk=${_majorver}"
  "java-runtime=${_majorver}" 
  "java-runtime-openjdk=${_majorver}"
  "java-runtime-headless=${_majorver}"
  "java-runtime-headless-openjdk=${_majorver}"
)
source=("https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-${_majorver}%2B${_buildver}/OpenJDK11U-jdk_x64_linux_openj9_jdk-${_majorver}_${_buildver}_openj9-0.11.0_${_majorver}_${_buildver}.tar.gz")
sha256sums=('ef9bf07cba79082285a9d426ea4eb3e8df57561ce2afe07cc5f299a8fa203279')

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
