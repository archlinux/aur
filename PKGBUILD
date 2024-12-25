# Maintainer: Aubrey Carlson (Carlson) <aubreycarlson24@outlook.com>

_javaver=21
_zuluver=21.38.21
_jdkver=21.0.5

pkgname="openjdk-zulu${_javaver}-ca-fx-bin"
pkgver="${_zuluver}+${_jdkver}"
pkgrel=1
pkgdesc="Azul Zulu Builds of OpenJDK ${_javaver} With OpenJFX are open source, TCK-tested and certified builds of OpenJDK ${_javaver}."
arch=('x86_64')
url='https://www.azul.com/downloads'
license=('custom')
depends=('java-environment-common>=3'
         'java-runtime-common>=3'
         'ca-certificates-utils')
provides=("java-environment=${_jdkver}"
          "java-environment-openjdk=${_jdkver}"
          "jdk${_javaver}-openjdk=${_jdkver}"
          "java-runtime=${_jdkver}"
          "java-runtime-openjdk=${_jdkver}"
          "jre${_javaver}-openjdk=${_jdkver}"
          "java-runtime-headless=${_jdkver}"
          "java-runtime-headless-openjdk=${_jdkver}"
          "jre${_javaver}-openjdk-headless=${_jdkver}")
source=("https://cdn.azul.com/zulu/bin/zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_x64.tar.gz")
sha256sums=("01735b97399ec9facc8e9937622da9b505a3b10ce7ffc877d83fe581d13b13c5")
install="install_${pkgname}.sh"

_jvmdir="/usr/lib/jvm/${pkgname}"

package() {
  cd ${srcdir}/zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_x64
  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -a . "${pkgdir}/${_jvmdir}"

  # Conf
  install -dm 755 "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/${pkgname}"
  rm -r "${pkgdir}/${_jvmdir}/conf"
  ln -s /etc/${pkgname} "${pkgdir}/${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}/${_jvmdir}/legal"
  ln -s /usr/share/licenses/${pkgname} "${pkgdir}/${_jvmdir}/legal"

  # Man pages
  for f in bin/*; do
    f=$(basename "${f}")
    _man=man/man1/"${f}.1"
    test -f "${_man}" && install -Dm 644 "${_man}" "${pkgdir}/usr/share/man/man1/${f}-zulu${_jdkver}.1"
  done
  rm -r "${pkgdir}/${_jvmdir}/man"
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"
}
