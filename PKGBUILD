# Maintainer: Mariell Hoversholm <proximyst at proximyst dot com>
# Contributor: Schrodinger Zhu <i at zhuyi dot fan>
# Contributor: Davide Depau <davide at depau dot eu>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=jdk14-openj9-bin
_jdkver=14
_jdkminor=0
_jdkpatch=1
_jdkfullver=${_jdkver}.${_jdkminor}.${_jdkpatch}
_openj9ver=0.20.0
_buildvershort=7
_buildver=${_buildvershort}_openj9-${_openj9ver}
pkgver=${_jdkfullver}b${_buildver//-/_}
pkgrel=1
pkgdesc="Eclipse (former IBM) OpenJ9 with openjdk${_jdkver}"
arch=('x86_64')
url="https://adoptopenjdk.net/index.html?variant=openjdk${_jdkver}&jvmVariant=openj9"
license=('GPL2')
depends=('java-environment-common' 'ca-certificates-utils' 'nss')
provides=(
  "java-environment=${_jdkver}"
  "java-environment-openjdk=${_jdkver}"
  "java-runtime=${_jdkver}"
  "java-runtime-openjdk=${_jdkver}"
  "java-runtime-headless=${_jdkver}"
  "java-runtime-headless-openjdk=${_jdkver}"
)
options=(!strip)
source=("https://github.com/AdoptOpenJDK/openjdk${_jdkver}-binaries/releases/download/jdk-${_jdkfullver}%2B${_buildver}/OpenJDK${_jdkver}U-jdk_x64_linux_openj9_${_jdkfullver}_${_buildver}.tar.gz")
sha256sums=('2350592f4b0db1439fdd48d4fa7e05b270f271dcc79b2c7f174489ee2f6b14c1')

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
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-openjdk14-j9.1}"
  done
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"
}
# vim:set ts=2 sw=2 et:
