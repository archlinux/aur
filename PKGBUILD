# Maintainer: Aubrey Carlson (Carlson) <aubreycarlson24@outlook.com>

_javaver=8
_zuluver=8.82.0.21
_jdkver=8.0.432

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
sha256sums=("f2908402ea28eec909e8465192ecf5d633f611b015bae8e955ea66810a3a31f9")
install="install_${pkgname}.sh"

_jvmdir="/usr/lib/jvm/${pkgname}"

package() {
  cd ${srcdir}/zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_x64
  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -a . "${pkgdir}/${_jvmdir}"

  # Conf
  _conf_files+=('amd64/jvm.cfg')
  install -dm 755 "${pkgdir}/etc/${pkgname}"
  for f in "${_conf_files[@]}"; do
    _file="${_jvmdir}/jre/lib/$f"
    install -D -m 644 "${pkgdir}${_file}" "${pkgdir}/etc/${pkgname}/$f"
    ln -sf "/etc/${pkgname}/$f" "${pkgdir}${_file}"
  done

  # Legal
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m 644 ASSEMBLY_EXCEPTION LICENSE THIRD_PARTY_README "${pkgdir}/usr/share/licenses/${pkgname}"

  # Man pages
  for f in man/man1/* man/ja/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-zulu-8.1}"
  done
  rm -rf "${pkgdir}/${_jvmdir}/man"
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"
}
