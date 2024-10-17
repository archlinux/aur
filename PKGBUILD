# Maintainer: puddings233 <puddings233 at outlook dot com>

_java_ver=17
_zulu_build="${_java_ver}.54.21-ca"
pkgname=jre${_java_ver}-zulu-bin
pkgver="${_java_ver}.0.13"
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
sha256sums_aarch64=('ee0d9b75a5d4126a2758d4af3de893eb09e0207a05c8f29f1615ea2ddb959fc9')
sha256sums_i686=('ecfc0bafd03876420d769cfb6084eb4c2e5f2cf2f49f4b6b766ef7ea6b61558b')
sha256sums_x86_64=('2d74f026d0d184075ad99de343c6a24bd702eb25d87ce6de5e3ab8df1cd3ef25')

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
