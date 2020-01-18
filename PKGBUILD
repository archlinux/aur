# Maintainer: Sam Guymer <sam at guymer dot me>

_jdkname=zulu-13
pkgname="${_jdkname}-bin"
_java_ver=13
_zulu_build=13.29.9-ca
pkgver=13.0.2
pkgrel=1
pkgdesc='Zulu Community builds of OpenJDK are fully certified and 100% open source Java Development Kits (JDKs) for all Java development and production workloads.'
arch=('x86_64')
url='https://www.azul.com/products/zulu-community/'
license=('custom')
depends=(
  'java-environment-common=3' 'java-runtime-common>=3' 'ca-certificates-utils'
  # not 100% sure if all of these dependencies are needed
  # dependencies from jre13-openjdk-headless
  'nss' 'libjpeg-turbo' 'lcms2' 'libnet' 'freetype2'
  # dependencies from jre13-openjdk
  'giflib'
  # dependencies from java13-openjdk
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
_tarballname="zulu${_zulu_build}-jdk${pkgver}-linux_x64"
source=("https://cdn.azul.com/zulu/bin/${_tarballname}.tar.gz")
sha256sums=('ecb3f9626a9bc810daeb0f4e7d69474b7ae19fe0634658713e009ca6b1f1be98')

_jvmdir="/usr/lib/jvm/${_jdkname}"

package() {
  cd "$srcdir/${_tarballname}"

  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -a . "${pkgdir}/${_jvmdir}/"

  # copied from java13-openjdk

  # Conf
  install -dm 755 "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/${_jdkname}"
  ln -s "/etc/${_jdkname}" "${pkgdir}/${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/${_jdkname}"
  ln -s "/usr/share/licenses/${_jdkname}" "${pkgdir}/${_jvmdir}/legal"

  # Man pages
  for f in bin/*; do
    f=$(basename "${f}")
    _man=../jdk/man/man1/"${f}.1"
    test -f "${_man}" && install -Dm 644 "${_man}" "${pkgdir}/usr/share/man/man1/${f}-${_jdkname}.1"
  done
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
}
