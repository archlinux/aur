# Maintainer: Aashik S  aashiks at gmail dot com, ashik at inflo dot ws
# PKGBUILD re-used from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=jdk11-openj9-bin

pkgname=jdk11-msopenjdk-bin
_jdkver=11
_jdkminor=0
_jdkpatch=13
_jdkfullver=${_jdkver}.${_jdkminor}.${_jdkpatch}
_buildvermajor=8
_buildvershort=${_buildvermajor}.1
_buildver=${_buildvershort}-linux-x64
pkgver=${_jdkfullver}b${_buildver//-/_}
pkgrel=5
pkgdesc="Microsoft openjdk${_jdkver} (Preview)"
arch=('x86_64')
url="https://www.microsoft.com/openjdk"
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
source=("https://aka.ms/download-jdk/microsoft-jdk-${_jdkfullver}.${_buildver}.tar.gz")

sha256sums=('f775d2625a3194e85522c9ac5af6e51e4f4b9c2669e11a1303a1981faf4ae449')

_jvmdir=usr/lib/jvm/java-${_jdkver}-msopenjdk

package() {
  # Install
  install -d "${pkgdir}/${_jvmdir}"
  cd jdk-${_jdkfullver}+${_buildvermajor}
  cp -a bin include jmods lib release "${pkgdir}/${_jvmdir}/"
  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  # Legal
  install -d "${pkgdir}/usr/share/licenses/java${_jdkver}-msopenjdk"
  cp -a legal "${pkgdir}/usr/share/licenses/java${_jdkver}-msopenjdk"
  ln -s /usr/share/licenses/java${_jdkver}-msopenjdk "${pkgdir}/${_jvmdir}/legal"
  # Conf
  install -d "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/java${_jdkver}-msopenjdk"
  ln -s /etc/java${_jdkver}-msopenjdk "${pkgdir}/${_jvmdir}/conf"
  # Man pages
  for f in man/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-openjdk11-msopenjdk}"
  done
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"
}
