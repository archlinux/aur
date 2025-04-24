# Maintainer: puddings233 <puddings233 at outlook dot com>

_java_ver=17
_zulu_build="${_java_ver}.58.21-ca"
pkgname=jre${_java_ver}-zulu-bin
pkgver="${_java_ver}.0.15"
pkgrel=3
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
sha256sums_aarch64=('c4dc33833dd146acb4408ea28ac12ff991c8a86950d3434830f5b75cff91f9eb')
sha256sums_i686=('f9e8713551950ab45adc43e25e9189fe71ed8c743e2878c8c4fe73888b68f9c0')
sha256sums_x86_64=('8227d205e942a0002f37ef79edfb69236c3f90251e94b6a39be6dcbe1a49e794')

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
