# Maintainer: Rubin Simons <me@rubin55.org>

# jdk-25+36_openj9-0.56.0-m2
pkgname=jdk25-openj9-bin
_jdkver=25
_jdkminor=0
_jdkpatch=0
_jdksubpatch=0
_jdkfullver=${_jdkver} #.${_jdkminor}.${_jdkpatch}.${_jdksubpatch}
_openj9ver=0.56.0-m2
_buildvershort=36
_buildver=${_buildvershort}_openj9-${_openj9ver}
pkgver=${_jdkfullver}b${_buildver//-/_}
pkgrel=1
pkgdesc="IBM Semeru OpenJ9 with openjdk${_jdkver}"
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
conflicts=("jdk${_jdkver}-openj9")
options=(!strip)
source=("https://github.com/ibmruntimes/semeru${_jdkver}-binaries/releases/download/jdk-${_jdkfullver}%2B${_buildver}/ibm-semeru-open-jdk_x64_linux_${_jdkfullver}_${_buildver}.tar.gz")

sha256sums=('7b0607f4937b8cdaee6d1996c785ccba88d9029bbf47e0779e13ba1e40e5d546')

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
  
  # Man pages (note: there seem to be no manpages in this release? recheck later)
  #for f in man/man1/*; do
  #  install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-openjdk${_jdkver}-j9.1}"
  #done
  #ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"
}
