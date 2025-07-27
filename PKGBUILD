# Maintainer: puddings233 <puddings233 at outlook dot com>
#
_java_ver=21
_zulu_build="${_java_ver}.44.17-ca"
pkgname=jre${_java_ver}-zulu-bin
pkgver="${_java_ver}.0.8"
pkgrel=1
pkgdesc='Azul Zulu OpenJDK full runtime environment, bin version.'
arch=('aarch64' 'x86_64')
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
  "jdk21-openjdk"
  "jre21-openjdk"
  "jre21-openjdk-headless"
  "zulu-21-bin"
  "zulu21-fx-bin"
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
source_x86_64=("https://cdn.azul.com/zulu/bin/zulu${_zulu_build}-jre${pkgver}-linux_x64.tar.gz")
sha256sums_aarch64=('1c37817d821a4ed8e4fb015809d71c1f651c15dadcc6b62e61b58bccb3145a78')
sha256sums_x86_64=('0af24b31e3542ddd20e29f02c7dca46c1952db751843ae6b849534b257ecdd15')

_jvmdir=/usr/lib/jvm/java-${_java_ver}-zulu

case "${CARCH}" in
  aarch64) _JARCH='aarch64';;
  x86_64) _JARCH='x64';;
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
