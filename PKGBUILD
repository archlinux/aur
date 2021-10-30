# Maintainer: Leonardo Costa <leo95.uqhi2 at aleeas dot com>
# Contributor: Davide Depau <davide@depau.eu>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>


pkgname=jdk11-openj9-bin
_jdkver=11
_jdkminor=0
_jdkpatch=13
_jdkfullver=${_jdkver}.${_jdkminor}.${_jdkpatch}
_openj9ver=0.29.0
_buildvershort=8
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

sha256sums_x86_64=('3975e2732cf632ca8f41c237ba7e033fd96bda262b79861f83b4e2ac62c90c3d')
sha256sums_s390x=('6c3ebb4af0f4066e721e1f0078438458775f4b93bfd2d0be1066c54ccf015654')
sha256sums_ppc64le=('7b304c52974f51611b45a2ab7949503e33a204b8a4ae705eb3c74789350174d3')
sha256sums_aarch64=('151dca23e1fdb43eaa60631c96895be9aa7bb751e7fdf88ddffa1c32157fb417')

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
