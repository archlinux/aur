# Maintainer: Stefan Zobel <stefan dot zobel at gmail dot com>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=java-openjdk-ea-bin

_majorver=21
_buildver=26
pkgver=${_majorver}b${_buildver}
pkgrel=1


_JARCH='x64'
case "${CARCH}" in
  x86_64)  _JARCH='x64';;
  aarch64) _JARCH='aarch64';;
esac


pkgdesc="Java OpenJDK ${_majorver} Early-Access Build"
arch=('x86_64' 'aarch64')
url="https://jdk.java.net/${_majorver}"
license=('GPL2')
depends=(
  'java-environment-common>=3' 'java-runtime-common>=3'
  'ca-certificates-utils' 'nss' 'libxrender' 'libxtst'
  'alsa-lib' 'freetype2'
)
provides=(
  "java-environment=${_majorver}"
  "java-environment-openjdk=${_majorver}"
  "java-runtime=${_majorver}"
  "java-runtime-openjdk=${_majorver}"
  "java-runtime-headless=${_majorver}"
  "java-runtime-headless-openjdk=${_majorver}"
)
source=("https://download.java.net/java/early_access/jdk${_majorver}/${_buildver}/GPL/openjdk-${_majorver}-ea+${_buildver}_linux-${_JARCH}_bin.tar.gz")


if [[ $_JARCH == "x64" ]]; then
sha256sums=('16c6b09c742e73c9e092134517ecc36db2a5e44453c8b8b5374cfac1ee367a28')
else
sha256sums=('aa59bb222c548c18c21cb05a71854a46263a618a72ec6f2f408328689280380d')
fi


_eaname=java-${_majorver}-openjdk
_jvmdir=/usr/lib/jvm/${_eaname}

package() {
  # Install
  install -d "${pkgdir}${_jvmdir}"
  cd jdk-${_majorver}
  cp -a bin include jmods lib release "${pkgdir}${_jvmdir}/"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"

  # Legal
  install -d "${pkgdir}/usr/share/licenses/${_eaname}"
  cp -a legal "${pkgdir}/usr/share/licenses/${_eaname}/"
  ln -s /usr/share/licenses/${_eaname} "${pkgdir}${_jvmdir}/legal"

  # Conf
  install -d "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/${_eaname}"
  ln -s /etc/${_eaname} "${pkgdir}${_jvmdir}/conf"
}
# vim:set ts=2 sw=2 et:
