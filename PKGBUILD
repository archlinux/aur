# $Id$
# From: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Maintainer: Heavysink <winstonwu91 at gmail>

pkgname=openjdk12
_majorver=12
_buildver=12
_ea=ea
pkgver=${_majorver}b${_buildver}
pkgrel=1
pkgdesc="Java OpenJDK ${_majorver} Early-Access Build from Oracle."
arch=('x86_64')
url="http://jdk.java.net/${_majorver}"
license=('GPL2')
depends=('java-environment-common' 'java-runtime-common' 'ca-certificates-utils' 'nss')
provides=(
  "java-environment=${_majorver}" 
  "java-environment-openjdk=${_majorver}"
  "java-runtime=${_majorver}" 
  "java-runtime-openjdk=${_majorver}"
  "java-runtime-headless=${_majorver}"
  "java-runtime-headless-openjdk=${_majorver}"
)
source=("https://download.java.net/java/early_access/jdk${_majorver}/${_buildver}/GPL/openjdk-${_majorver}-${_ea}+${_buildver}_linux-x64_bin.tar.gz")
_sha256sums=$(curl -n https://download.java.net/java/early_access/jdk12/12/GPL/openjdk-${_majorver}-${_ea}+${_buildver}_linux-x64_bin.tar.gz.sha256)
sha256sums=(${_sha256sums})

_jvmdir=usr/lib/jvm/java-${_majorver}-openjdk

package() {
  # Install
  install -d "${pkgdir}/${_jvmdir}"
  cd jdk-${_majorver}
  cp -a bin include jmods lib release "${pkgdir}/${_jvmdir}/"
  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  # Legal
  install -d "${pkgdir}/usr/share/licenses/java${_majorver}-openjdk"
  cp -a legal "${pkgdir}/usr/share/licenses/java${_majorver}-openjdk/"
  ln -s /usr/share/licenses/java${_majorver}-openjdk "${pkgdir}/${_jvmdir}/legal"
  # Conf
  install -d "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/java${_majorver}-openjdk"
  ln -s /etc/java${_majorver}-openjdk "${pkgdir}/${_jvmdir}/conf"
}
# vim:set ts=2 sw=2 et:
