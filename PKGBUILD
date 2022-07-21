# Maintainer: Maddie Zhan <maddie at emzee dot be>

_jdkname=zulu-13
pkgname="${_jdkname}-bin"
_java_ver=13
_zulu_build=13.50.15-ca
pkgver=13.0.12
pkgrel=1
pkgdesc='Zulu Community builds of OpenJDK are fully certified and 100% open source Java Development Kits (JDKs) for all Java development and production workloads.'
arch=('x86_64' 'aarch64')
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
_tarbalarch="$CARCH"
[ "$CARCH" = "x86_64" ] && _tarballarch="x64"
_tarballname="zulu${_zulu_build}-jdk${pkgver}-linux_${_tarballarch}"
source=("https://cdn.azul.com/zulu/bin/${_tarballname}.tar.gz")
sha256sums=('6a9a96d7b599a046e3442ec048be1ab87cc2a7f99e74658f409e268f508e04f9')
[ "$CARCH" = "aarch64" ] && source=("https://cdn.azul.com/zulu-embedded/bin/${_tarballname}.tar.gz")
[ "$CARCH" = "aarch64" ] && sha256sums=('f4797a33c32c3dcf279a0376fa427aa4d4f864cec7988141fdc4d29bf1b31476')

_jvmdir="/usr/lib/jvm/${_jdkname}"

package() {
  cd "$srcdir/${_tarballname}"

  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -a . "${pkgdir}/${_jvmdir}/"

  # copied from java13-openjdk

  # Conf
  install -dm 755 "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/${_jdkname}"
  rm -r "${pkgdir}/${_jvmdir}/conf"
  ln -s "/etc/${_jdkname}" "${pkgdir}/${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/${_jdkname}"
  rm -r "${pkgdir}/${_jvmdir}/legal"
  ln -s "/usr/share/licenses/${_jdkname}" "${pkgdir}/${_jvmdir}/legal"

  # Man pages
  for f in bin/*; do
    f=$(basename "${f}")
    _man=../jdk/man/man1/"${f}.1"
    test -f "${_man}" && install -Dm 644 "${_man}" "${pkgdir}/usr/share/man/man1/${f}-${_jdkname}.1"
  done
  rm -r "${pkgdir}/${_jvmdir}/man"
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
}
