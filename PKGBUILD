# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=jdk25-openj9-bin
_jdkver=25
_jdkmajor=${_jdkver}
_jdkminor=0
_jdkpatch=3
_jdksubpatch=0
_jdkfullver=${_jdkmajor}.${_jdkminor}.${_jdkpatch}.${_jdksubpatch}
_buildmajor=9
pkgver=${_jdkfullver}
pkgrel=4
pkgdesc="IBM Semeru OpenJ9 with openjdk${_jdkver}"
arch=('x86_64')
url="https://developer.ibm.com/languages/java/semeru-runtimes/downloads"
license=('custom')
depends=('alsa-lib'
         'java-environment-common'
         'ca-certificates-utils'
         'freetype2'
         'fontconfig'
         'harfbuzz'
         'libjpeg-turbo'
         'libx11'
         'libxext'
         'libxrender'
         'libxtst'
         'nss')
provides=(
  "java-environment=${_jdkver}"
  "java-environment-openjdk=${_jdkver}"
  "java-runtime=${_jdkver}"
  "java-runtime-openjdk=${_jdkver}"
  "java-runtime-headless=${_jdkver}"
  "java-runtime-headless-openjdk=${_jdkver}"
)
conflicts=("jdk${_jdkver}-openj9")
source=("https://github.com/ibmruntimes/semeru${_jdkver}-binaries/releases/download/jdk-${_jdkfullver}/ibm-semeru-open-jdk_x64_linux_${_jdkfullver}.tar.gz")
sha256sums=('1f844894d0b48dabbded9f93112752bd31ee0e76544c87742b641a389584fc81')

_jvmdir=usr/lib/jvm/java-${_jdkver}-openj9

package() {
  # Install
  install -d "${pkgdir}/${_jvmdir}"
  cd jdk-${_jdkmajor}.${_jdkminor}.${_jdkpatch}+${_buildmajor}
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
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-openj9${_jdkver}.1}"
  done
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"
}
