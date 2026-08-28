# Maintainer: Rory Healy <roryhealy@proton.me>
# Contributor: Pinghigh Dai <pinghigh24678@outlook.com>

pkgname=jdk17-openj9-bin
_jdkver=17
_jdkminor=0
_jdkpatch=20
_jdkmainver=${_jdkver}.${_jdkminor}.${_jdkpatch}
_jdksubpatch=1
_jdkfullver=${_jdkmainver}.${_jdksubpatch}
_openj9ver=0.61.0
_patchver=10
pkgrel=1
pkgdesc="IBM Semeru OpenJ9 with openjdk${_jdkver}"
pkgver="${_jdkfullver}_openj9_${_openj9ver}"
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
source=("https://github.com/ibmruntimes/semeru${_jdkver}-binaries/releases/download/jdk-${_jdkmainver}.${_patchver}/ibm-semeru-open-jdk_x64_linux_${_jdkmainver}.${_patchver}.tar.gz")

sha256sums=('ba94140d369118e8a85ccfd8f099335a0bce09949d5b0eb5acce69ac0b4ec86c')

_jvmdir=usr/lib/jvm/java-${_jdkver}-openj9

package() {
  # Install
  install -d "${pkgdir}/${_jvmdir}"
  cd jdk-${_jdkmainver}.${_patchver}
  cp -a bin include jmods lib release "${pkgdir}/${_jvmdir}/"
  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  # Legal
  install -d "${pkgdir}/usr/share/licenses/java${_jdkver}-openj9"
  cp -a legal "${pkgdir}/usr/share/licenses/java${_jdkver}-openj9/"
  ln -s /usr/share/licenses/java${_jdkver}-openj9 "${pkgdir}/${_jvmdir}/legal"
  # Conf
  install -d "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/java${_jdkver}-openj9"
  ln -s /etc/java${_jdkver}-openj9 "${pkgdir}/${_jvmdir}/conf"
  # Man pages
  for f in man/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-openjdk${_jdkver}-openj9.1}"
  done
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"
}
# vim:set ts=4 sw=4 et:
