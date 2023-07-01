# Maintainer: Tommaso Dordoni <t dot dordoni dot aur at outlook dot com>

_java=17
_jdk=${_java}.0.7
_jdkname="java-${_java}-zulu-prime"
_pkgver_major="23"
_pkgver_minor="06.0.0"
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
sha256sums_x86_64=('11e474f0dd242c88ff7865923117484aeaeab4eb4ca518bf2f5f6bdf0f65e842')
sha256sums_aarch64=('d5454ab98ea8fff5fdbc0ded3aad5a5d0eb46be15557ad5c2d56420b772555b6')

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