# Maintainer: puddings233 <puddings233 at outlook dot com>
#
_java_ver=25
_zulu_build="${_java_ver}.34.17-ca"
pkgname=jre${_java_ver}-zulu-bin
pkgver="${_java_ver}.0.3"
pkgrel=1
pkgdesc='Azul Zulu OpenJDK full runtime environment, bin version.'
arch=('aarch64' 'x86_64')
url='https://www.azul.com/downloads/'
license=('custom')
depends=(
  "java-runtime-common>=3"
  "ca-certificates-utils"
  "freetype2"
  "glibc"
  "harfbuzz"
  "lcms2"
  "libfreetype.so"
  "libgcc"
  "libharfbuzz.so"
  "libjpeg.so"
  "libjpeg-turbo"
  "liblcms2.so"
  "libnet"
  "libstdc++"
  "nss"
  "giflib"
  "libgif.so"
  "libpng"
)
conflicts=(
  "jdk25-openjdk"
  "jre25-openjdk"
  "jre25-openjdk-headless"
  "zulu-25-bin"
  "zulu25-fx-bin"
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
sha256sums_aarch64=('b2056ebf2431b0ec4f4c4aeb5b839c02ea7df8a90e2fd4d8de86ff8972e8bc53')
sha256sums_x86_64=('39ee4454be16822d6899b40e24098ddfe54c00cc406f3dd7757692dc8171051e')

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
