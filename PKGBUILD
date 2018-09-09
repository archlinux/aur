# Maintainer: Sam Guymer <sam at guymer dot me>

_jdkname=zulu-10
pkgname="${_jdkname}-bin"
_java_ver=10
_zulu_build=10.3+5
pkgver=10.0.2
pkgrel=2
pkgdesc='Zulu is a certified build of OpenJDK that is fully compliant with the Java SE standard.'
arch=('x86_64')
url='https://www.azul.com/zulu'
license=('custom')
depends=(
  # not 100% sure if all of these dependencies are needed
  # dependencies from jre10-openjdk-headless
  'java-runtime-common>=3' 'ca-certificates-utils' 'nss' 'libjpeg-turbo' 'lcms2' 'libnet' 'freetype2'
  # dependencies from jre10-openjdk
  'giflib'
  # dependencies from java10-openjdk
  'java-environment-common=3' 'hicolor-icon-theme' 'libelf'
)
provides=(
  "java-environment=$_java_ver"
  "java-environment-openjdk=$_java_ver"
)
install="$pkgname.install"
_tarballname="zulu${_zulu_build}-jdk${pkgver}-linux_x64"
source=("http://cdn.azul.com/zulu/bin/${_tarballname}.tar.gz")
md5sums=('a6343f4a37510c805963f12761e50113')

_jvmdir="/usr/lib/jvm/${_jdkname}"

package() {
  cd "$srcdir/${_tarballname}"

  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -a . "${pkgdir}/${_jvmdir}/"

  # copied from java10-openjdk

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
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-zulu-10.1}"
  done
  rm -rf "${pkgdir}/${_jvmdir}/man"
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
}
