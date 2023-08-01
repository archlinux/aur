# Maintainer: Tommaso Dordoni <t dot dordoni dot aur at outlook dot com>

_java=17
_jdk=${_java}.0.8
_jdkname="java-${_java}-zulu-prime"
_pkgver_major="23"
_pkgver_minor="07.0.0"
_pkgver_build="2"

pkgname="jdk${_java}-zulu-prime-bin"
pkgver="${_pkgver_major}.${_pkgver_minor}_${_pkgver_build}"
pkgrel=1
pkgdesc="Azul Platform Prime Stream Build of OpenJDK 17. TCK compliant, free for development."
arch=(
  'x86_64'
  'aarch64'
)
url="https://www.azul.com/downloads/#prime"
license=('unknown')
depends=(
  'java-environment-common'
  'java-runtime-common'
  'ca-certificates-utils'
  'libxi'
  'libxext'
  'libxrender'
  'libx11'
  'libxtst'
  'alsa-lib'
)
provides=(
  "java-runtime=${_java}"
  "java-environment=${_java}"
)
install="$pkgname.install"
source_x86_64=("https://cdn.azul.com/zing-zvm/ZVM${_pkgver_major}.${_pkgver_minor}/zing${pkgver//_/-}-jdk${_jdk}-linux_x64.tar.gz")
source_aarch64=("https://cdn.azul.com/zing-zvm/ZVM${_pkgver_major}.${_pkgver_minor}/zing${pkgver//_/-}-jdk${_jdk}-linux_aarch64.tar.gz")
sha256sums_x86_64=('82711e536066743e4dd8bc9124ae14a1ba477dfe743fb2eaba2c18216a7382c8')
sha256sums_aarch64=('62eff422453cf56d37f101810373a5372e23f5de057eaff41879bcec2af3d5da')

_jvmdir="/usr/lib/jvm/${_jdkname}"

BUILDENV+=('!check')

package() {
  case "${CARCH}" in
  x86_64)
    cd "$srcdir/zing${pkgver//_/-}-jdk${_jdk}-linux_x64"
    ;;
  aarch64)
    cd "$srcdir/zing${pkgver//_/-}-jdk${_jdk}-aarch64"
    ;;
  esac
  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -a . "${pkgdir}/${_jvmdir}/"

  # based on java-openjdk package_jdk-openjdk
  # https://github.com/archlinux/svntogit-packages/blob/3f6aa8ddd98f728a9b0701288a933d16f0e8bbaf/trunk/PKGBUILD

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
    _man=man/man1/"${f}.1"
    test -f "${_man}" && install -Dm 644 "${_man}" "${pkgdir}/usr/share/man/man1/${f}-${_jdkname}.1"
  done
  rm -r "${pkgdir}/${_jvmdir}/man"
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
}