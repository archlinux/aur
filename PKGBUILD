# Maintainer: puddings233 <puddings233 at outlook dot com>

_java_ver=17
_zulu_build="${_java_ver}.52.17-ca"
pkgname=jre${_java_ver}-zulu-bin
pkgver="${_java_ver}.0.12"
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
)
install="$pkgname.install"
source_aarch64=("https://cdn.azul.com/zulu/bin/zulu${_zulu_build}-jre${pkgver}-linux_aarch64.tar.gz")
source_i686=("https://cdn.azul.com/zulu/bin/zulu${_zulu_build}-jre${pkgver}-linux_i686.tar.gz")
source_x86_64=("https://cdn.azul.com/zulu/bin/zulu${_zulu_build}-jre${pkgver}-linux_x64.tar.gz")
sha256sums_aarch64=('02519f848f5b87ca59ead4f5e8f6c8df28d98f392307d9df926d84df97910de7')
sha256sums_i686=('82b92256e7e20fd6cb1f6eae2a9901a5f60d828b48342176bc511614ca5d5f27')
sha256sums_x86_64=('3444b27466aa5eab34172a6428de7a9ae57253ec10a2c707d271c48df77ab4d2')

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
  cp -r conf "${pkgdir}/etc/zulu-${_java_ver}"
  ln -s "/etc/zulu-${_java_ver}" "${pkgdir}/${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/zulu-${_java_ver}"
  ln -s "/usr/share/licenses/zulu-${_java_ver}" "${pkgdir}/${_jvmdir}/legal"

  # Man pages
  for f in bin/*; do
    f=$(basename "${f}")
    _man=../jdk/man/man1/"${f}.1"
    test -f "${_man}" && install -Dm 644 "${_man}" "${pkgdir}/usr/share/man/man1/${f}-zulu-${_java_ver}.1"
  done
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"
}

# vim: ts=2 sw=2 et:
