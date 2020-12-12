# Maintainer: Sam Guymer <sam at guymer dot me>

_jdkname=zulu-11
pkgname="${_jdkname}-bin"
_java_ver=11
_zulu_build=11.43.55-ca
pkgver=11.0.9.1
pkgrel=1
pkgdesc='Zulu Community builds of OpenJDK are fully certified and 100% open source Java Development Kits (JDKs) for all Java development and production workloads.'
arch=('x86_64')
url='https://www.azul.com/products/zulu-community/'
license=('custom')
depends=(
  'java-environment-common>=3'
  'java-runtime-common>=3'
  'ca-certificates-utils'
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
_tarballname="zulu${_zulu_build}-jdk${pkgver}-linux_x64"
source=("https://cdn.azul.com/zulu/bin/${_tarballname}.tar.gz")
sha256sums=('6c79bfe8bb06c82b72ef2f293a14becef56b3078d298dc75fda4225cbb2d3d0c')

_jvmdir="/usr/lib/jvm/${_jdkname}"

package() {
  cd "$srcdir/${_tarballname}"

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
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-zulu-11.1}"
  done
  rm -rf "${pkgdir}/${_jvmdir}/man"
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
}
