# Maintainer: Deleted User <deleted-user@example.com>

_java=17
_jdk=${_java}.0.17.0.101
_jdkname="java${_java}-zulu-prime"
_pkgver_major="26"
_pkgver_minor="01.0.0"
_pkgver_build="11"

pkgname="jdk${_java}-zulu-prime-bin"
pkgver="${_pkgver_major}.${_pkgver_minor}_${_pkgver_build}"
pkgrel=1
pkgdesc="Azul Platform Prime Stream Build of OpenJDK 17. TCK compliant, free for development."
arch=(
  'x86_64'
  'aarch64'
)
url="https://www.azul.com/downloads/#prime"
license=('custom:Azul Platform Prime Stream License Agreement')
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
options=('!strip')
provides=(
  "java-runtime=${_java}"
  "java-environment=${_java}"
  "java-runtime-headless=${_java}"
)
install="$pkgname.install"
source=(
  freedesktop-java.desktop
  freedesktop-jconsole.desktop
  freedesktop-jshell.desktop
  java-icon16.png
  java-icon24.png
  java-icon32.png
  java-icon48.png

)
sha256sums=(
  'd40da1d3f3efadd8b30fd4ab0d5c9efe5fdda53a781f90e9280b5423f15038f5'
  '24ad8300bb7dcbfe44b216c2942fcf562fc501529514b3459045a2bcb6adbf11'
  '282d4e5cc5f965b434322e149d117690ea636b2ea0072a165b35f6c107afe1e1'
  'fc8a191aa0c78850194758c77937966cc5bd0fbd2b604188b466571ebcdae570'
  'c9079bc3676873b39967861c24036074bf6d224442994b4c4ce79e888602fcd5'
  '8b2491d0b5cbc67075dcae4d29c8a92b9ab813d9eca05a2f16ee3b3efb970e65'
  'e15912c341217081f40f73a89203c765e501470ef3a01099c1995139214ff4d6'

)
source_x86_64=("https://cdn.azul.com/zing-zvm/ZVM${_pkgver_major}.${_pkgver_minor}/zing${pkgver//_/-}-jdk${_jdk}-linux_x64.tar.gz")
source_aarch64=("https://cdn.azul.com/zing-zvm/ZVM${_pkgver_major}.${_pkgver_minor}/zing${pkgver//_/-}-jdk${_jdk}-linux_aarch64.tar.gz")
sha256sums_x86_64=('e34d1949c1d2144152b2f4cd3c47ee63de2f0c4a050d12ac2ee6083d4ccaf018')
sha256sums_aarch64=('fa030a57d535342817965cead8ba2d117770c1c817823fb49c351a6eaee00fbf')

_jvmdir=/usr/lib/jvm/java-${_java}-zulu-prime

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

  # Icons
  for s in 16 24 32 48; do
    install -Dm 644 \
      "${srcdir}/java-icon${s}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/${_jdkname}.png"
  done
  
  # Desktop files
  for f in jconsole java jshell; do
    install -Dm 644 \
      "${srcdir}/freedesktop-${f}.desktop" \
      "${pkgdir}/usr/share/applications/${f}-${_jdkname}.desktop"
  done
}
