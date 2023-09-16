# Maintainer: Pinghigh Dai <pinghigh24678@outlook.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=jdk17-openj9-bin
_jdkver=17
_jdkminor=0
_jdkpatch=8
#_jdksubpatch=0
_jdkfixpack=1
_jdkfullver=${_jdkver}.${_jdkminor}.${_jdkpatch}.${_jdkfixpack}
_openj9ver=0.40.0
_patchver=1
_buildver=${_patchver}_openj9-${_openj9ver}
pkgrel=1
pkgdesc="IBM® Semeru Runtime Certified Edition, Version ${_jdkver}"
pkgver=${_jdkfullver}b${_buildver//-/_}
arch=('x86_64')
url="https://developer.ibm.com/languages/java/semeru-runtimes/downloads"
license=('custom')
depends=('java-environment-common' 'ca-certificates-utils' 'nss')
provides=(
  "java-environment=${_jdkver}"
  "java-environment-openjdk=${_jdkver}"
  "java-runtime=${_jdkver}"
  "java-runtime-openjdk=${_jdkver}"
  "java-runtime-headless=${_jdkver}"
  "java-runtime-headless-openjdk=${_jdkver}"
)
conflicts=("jdk${_jdkver}-openj9-bin" "jdk${_jdkver}-openj9")
options=(!strip)
source=("https://github.com/ibmruntimes/semeru${_jdkver}-certified-binaries/releases/download/jdk-${_jdkfullver}%2B${_buildver}/ibm-semeru-certified-jdk_x64_linux_${_jdkfullver}.tar.gz")

b2sums=('0683343236cf317afa5b7945ad303d9bacad90984a9a50c192cf5738a33de2f42f12f7e43117aaf5916c552138a1836fb1ef6b208b26d9138c54ff7e7bd1fcb5')

_jvmdir=usr/lib/jvm/java-${_jdkver}-j9

package() {
  # Install
  install -d "${pkgdir}/${_jvmdir}"
  cd jdk-${_jdkfullver}+${_patchver}
  cp -a bin include jmods lib release "${pkgdir}/${_jvmdir}/"
  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  # Legal
  install -d "${pkgdir}/usr/share/licenses/java${_jdkver}-j9"
  cp -a legal "${pkgdir}/usr/share/licenses/java${_jdkver}-j9/"
  ln -s /usr/share/licenses/java${_jdkver}-j9 "${pkgdir}/${_jvmdir}/legal"
  # Conf
  install -d "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/java${_jdkver}-j9"
  ln -s /etc/java${_jdkver}-j9 "${pkgdir}/${_jvmdir}/conf"
  # Man pages
  for f in man/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-openjdk${_jdkver}-j9.1}"
  done
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"
}
# vim:set ts=4 sw=4 et:
