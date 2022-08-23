# Maintainer: Leonardo Costa <leo95.uqhi2 at aleeas dot com>
# Contributor: Davide Depau <davide@depau.eu>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>


pkgname=jdk11-openj9-bin
_jdkver=11
_jdkminor=0
_jdkpatch=16
_jdkpatchminor=1
_jdkfullver=${_jdkver}.${_jdkminor}.${_jdkpatch}.${_jdkpatchminor}
_openj9ver=0.33.1
_buildvershort=1
_buildver=${_buildvershort}_openj9-${_openj9ver}
_baseurl=https://github.com/ibmruntimes/semeru${_jdkver}-binaries/releases/download/jdk-${_jdkfullver}%2B${_buildver}
pkgver=${_jdkfullver}b${_buildver//-/_}
pkgrel=1
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

sha256sums_x86_64=('4eb9dc86bf92e144d7a2c8d6c2a6beac28c17b7348f2f0524e715548f52fd8f1')
sha256sums_s390x=('df4b746a0fc51bbab38aa86822a5f8e5587ed2b997cdd764de1c349d8caaa784')
sha256sums_ppc64le=('d71e5d26b7240d0e8a80499221ab79e5eed30ab1d985a5316bcfd240148435f8')
sha256sums_aarch64=('fad70f5bd615d08d9b3e6222ce738be713050eedc8dce4b57bdccc85747d9ff6')

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
