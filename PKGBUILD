# Maintainer: Sam Guymer <sam at guymer dot me>
# https://github.com/SAP/SapMachine/releases/download/sapmachine-11.0.5/sapmachine-jdk-11.0.5_linux-x64_bin.tar.gz

_packagename=sapmachine
_java_ver=11
_jdkname=${_packagename}-jdk-${_java_ver}
pkgname="${_jdkname}-bin"
_sapmachine_jdk_build=11.35.13-ca
pkgver=11.0.5
pkgrel=1
pkgdesc='This project contains a downstream version of the OpenJDK project. It is used to build and maintain a SAP supported version of OpenJDK for SAP customers and partners who wish to use OpenJDK to run their applications.'
arch=('x86_64')
url='https://sap.github.io/SapMachine/'
license=('custom')
depends=(
  'java-environment-common=3' 'java-runtime-common>=3' 'ca-certificates-utils'
  # not 100% sure if all of these dependencies are needed
  # dependencies from jre11-openjdk-headless
  'nss' 'libjpeg-turbo' 'lcms2' 'libnet' 'freetype2'
  # dependencies from jre11-openjdk
  'giflib'
  # dependencies from java11-openjdk
  'hicolor-icon-theme' 'libelf'
)
provides=(
  "java-environment=$_java_ver"
  "java-environment-openjdk=$_java_ver"
  "java-runtime-headless=$_java_ver"
  "java-runtime-headless-openjdk=$_java_ver"
  "java-runtime=$_java_ver"
  "java-runtime-openjdk=$_java_ver"
)
install="$pkgname.install"
_tarballname="sapmachine-jdk-${pkgver}_linux-x64_bin"
source=("https://github.com/SAP/SapMachine/releases/download/${_packagename}-${pkgver}/${_tarballname}.tar.gz")
sha256sums=('f8b849bbd044acfd38972987305bd4c8bf5706a794ec12b51f1ed747a492ca55')

_jvmdir="/usr/lib/jvm/${_jdkname}"

package() {
  cd "$srcdir/${_packagename}-jdk-${pkgver}"

  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -a . "${pkgdir}/${_jvmdir}/"

  # copied from java11-openjdk

  # Conf
  install -dm 755 "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/${_jdkname}"
  rm -rf "${pkgdir}/${_jvmdir}/conf"
  ln -s "/etc/${_jdkname}" "${pkgdir}/${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/${_jdkname}"
  rm -rf "${pkgdir}/${_jvmdir}/legal"
  ln -s "/usr/share/licenses/${_jdkname}" "${pkgdir}/${_jvmdir}/legal"

  # Man pages
  for f in man/man1/* man/ja/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-${_packagename}-${pkgver}}"
  done
  rm -rf "${pkgdir}/${_jvmdir}/man"
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
}
