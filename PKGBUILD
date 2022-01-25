# Maintainer: Maddie Zhan <maddie at emzee dot be>

_jdkname=zulu-13
pkgname="${_jdkname}-bin"
_java_ver=13
_zulu_build=13.46.15-ca
pkgver=13.0.10
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
sha256sums=('c5206b3f2497f15dc71d7ad278c3c500c5c30b0f9c8cfd60ca3ec95b08c92350')
[ "$CARCH" = "aarch64" ] && source=("https://cdn.azul.com/zulu-embedded/bin/${_tarballname}.tar.gz")
[ "$CARCH" = "aarch64" ] && sha256sums=('7f2cb93caa1d5a074fb960bd2c01ebc4e010458bf4d1aa41e746967e24d33296')

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
