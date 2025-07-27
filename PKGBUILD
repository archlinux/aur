# Maintainer: puddings233 <puddings233 at outlook dot com>

_java_ver=17
_zulu_build="${_java_ver}.60.17-ca"
pkgname=jre${_java_ver}-zulu-bin
pkgver="${_java_ver}.0.16"
pkgrel=1
pkgdesc='Azul Zulu OpenJDK full runtime environment, bin version.'
arch=('aarch64' 'i686' 'x86_64')
url='https://www.azul.com/downloads/'
license=('custom')
depends=(
  "java-runtime-common>=3"
  "ca-certificates-utils"
  "nss"
  "libnet"
  "glibc"
  "gcc-libs"
  "libpng"
)
conflicts=(
  "jdk17-openjdk"
  "jre17-openjdk"
  "jre17-openjdk-headless"
  "zulu-17-bin"
  "zulu-17-fx-bin"
  "zulu17-fx-bin"
)
provides=(
  "java-runtime-headless=$_java_ver"
  "java-runtime-headless-openjdk=$_java_ver"
  "java-runtime=$_java_ver"
  "java-runtime-openjdk=$_java_ver"
  "jre${_java_ver}-openjdk=${pkgver}-${pkgrel}"
  "jre${_java_ver}-openjdk-headless=${pkgver}-${pkgrel}"
)
install="$pkgname.install"
source_aarch64=("https://cdn.azul.com/zulu/bin/zulu${_zulu_build}-jre${pkgver}-linux_aarch64.tar.gz")
source_i686=("https://cdn.azul.com/zulu/bin/zulu${_zulu_build}-jre${pkgver}-linux_i686.tar.gz")
source_x86_64=("https://cdn.azul.com/zulu/bin/zulu${_zulu_build}-jre${pkgver}-linux_x64.tar.gz")
sha256sums_aarch64=('c322b8e7aef06b8ea1aa32f896f25a272a3cf3f6b202418e192161e8d667c460')
sha256sums_i686=('9e0b5292f7fede3ead0aad345446a50eb675f5b8266889dbca9b38a85b03cf59')
sha256sums_x86_64=('0111fb8b77921b0f9a717b3aeb34c5407aaf8381dd68d7d1e596ba2321cd18b1')

_jvmdir=/usr/lib/jvm/java-${_java_ver}-zulu

case "${CARCH}" in
  aarch64) _JARCH='aarch64';;
  x86_64) _JARCH='x64';;
  i686)   _JARCH='i686';;
esac

package() {

  cd "$srcdir/zulu${_zulu_build}-jre${pkgver}-linux_${_JARCH}"

  install -dm 755 "${pkgdir}${_jvmdir}"

  cp -a bin lib \
    "${pkgdir}${_jvmdir}"

  # Conf
  install -dm 755 "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/java${_java_ver}-zulu"
  ln -s "/etc/java${_java_ver}-zulu" "${pkgdir}/${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/java${_java_ver}-zulu"
  cp DISCLAIMER "${pkgdir}/usr/share/licenses/java${_java_ver}-zulu/"
  ln -s "/usr/share/licenses/java${_java_ver}-zulu" "${pkgdir}/${_jvmdir}/legal"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"
}

# vim: ts=2 sw=2 et:
