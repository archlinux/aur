# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=openjdk-devel
_majorver=12
_buildver=24
pkgver=${_majorver}b${_buildver}
pkgrel=1
pkgdesc="Java OpenJDK ${_majorver} Early-Access Builds"
arch=('x86_64')
url="http://jdk.java.net/${_majorver}/"
license=('custom')
depends=('java-environment-common' 'java-runtime-common' 'ca-certificates-utils' 'nss')
provides=(
  "java-environment=${_majorver}" 
  "java-environment-openjdk=${_majorver}"
  "java-runtime=${_majorver}" 
  "java-runtime-openjdk=${_majorver}"
  "java-runtime-headless=${_majorver}"
  "java-runtime-headless-openjdk=${_majorver}"
)
source=("https://download.java.net/java/early_access/jdk${_majorver}/${_buildver}/GPL/openjdk-${_majorver}-ea+${_buildver}_linux-x64_bin.tar.gz")
sha256sums=('dd927d41c2174f66e3fa2ffc847386e081d111318b235d2b9f4fb64b40624072')
install=install_jdk12-openjdk.sh

_jvmdir=/usr/lib/jvm/java-${_majorver}-openjdk

package() {
  # Install
  install -d "${pkgdir}${_jvmdir}"
  cd jdk-${_majorver}
  cp -a bin include jmods lib release "${pkgdir}${_jvmdir}/"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"

  # Legal
  install -d "${pkgdir}/usr/share/licenses/java-${_majorver}-openjdk"
  cp -a legal "${pkgdir}/usr/share/licenses/java-${_majorver}-openjdk/"
  ln -s /usr/share/licenses/java${_majorver}-openjdk "${pkgdir}${_jvmdir}/legal"

  # Conf
  install -d "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/java-${_majorver}-openjdk"
  ln -s /etc/java${_majorver}-openjdk "${pkgdir}${_jvmdir}/conf"
}
