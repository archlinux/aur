# Maintainer: Leonardo Costa <leo95.uqhi2 at aleeas dot com>
# Contributor: Davide Depau <davide@depau.eu>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>


pkgname=jdk11-openj9-bin
_jdkver=11
_jdkminor=0
_jdkpatch=12
_jdkfullver=${_jdkver}.${_jdkminor}.${_jdkpatch}
_openj9ver=0.27.0
_buildvershort=7
_buildver=${_buildvershort}_openj9-${_openj9ver}
_baseurl=https://github.com/ibmruntimes/semeru${_jdkver}-binaries/releases/download/jdk-${_jdkfullver}%2B${_buildver}
pkgver=${_jdkfullver}b${_buildver//-/_}
pkgrel=3
pkgdesc="Eclipse (former IBM) OpenJ9 with openjdk${_jdkver}"
arch=('x86_64' 's390x' 'ppc64le' 'aarch64')
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
conflicts=("jdk${_jdkver}-openj9")
options=(!strip)
source_x86_64=("${_baseurl}/ibm-semeru-open-jdk_x64_linux_${_jdkfullver}_${_buildver}.tar.gz")
source_s390x=("${_baseurl}/ibm-semeru-open-jdk_s390x_linux_${_jdkfullver}_${_buildver}.tar.gz")
source_ppc64le=("${_baseurl}/ibm-semeru-open-jdk_ppc64le_linux_${_jdkfullver}_${_buildver}.tar.gz")
source_aarch64=("${_baseurl}/ibm-semeru-open-jdk_aarch64_linux_${_jdkfullver}_${_buildver}.tar.gz")

sha256sums_x86_64=('4c2d776f69e3ff7d01cd57c0938b7a7f058264425faf18e3708b905e93f915c4')
sha256sums_s390x=('991f8df53079378782b9de3bbfd4c52a19920ea9ba90e9a54c871ce47b599cdb')
sha256sums_ppc64le=('7d49a5b29a84831526f7bffaaee399ac9a26d05712ac4b9cb7ca0a370ed3f020')
sha256sums_aarch64=('f025af94a65872653baeb6f889ec6d592ce9d92391fa04e82fb68a50b96178a7')

_jvmdir=usr/lib/jvm/java-${_jdkver}-j9

package() {
  # Install
  install -d "${pkgdir}/${_jvmdir}"
  cd jdk-${_jdkfullver}+${_buildvershort}
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
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-openjdk11-j9.1}"
  done
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"
}
# vim:set ts=4 sw=4 et:
