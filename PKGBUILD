# Maintainer: puddings233 <puddings233 at outlook dot com>

_majorver=25
_minorver=0
_securityver=5.0.3
_updatever=1
_zulu_build="38.109"
pkgname=jre${_majorver}-zulu-bin
pkgver=${_majorver}.${_minorver}.${_securityver}+${_updatever}
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
  "libgcc"
  "libjpeg-turbo"
  "libnet"
  "libstdc++"
  "nss"
  "giflib"
  "libpng"
)
optdepends=(
  'alsa-lib: for basic sound support'
  'gtk3: for the Gtk+ 3 look and feel - desktop usage'
)
provides=(
  "java-runtime=${_majorver}"
  "java-runtime-openjdk=${_majorver}"
  "jre${_majorver}-openjdk=${pkgver}-${pkgrel}"
  "java-runtime-headless=${_majorver}"
  "java-runtime-headless-openjdk=${_majorver}"
  "jre${_majorver}-openjdk-headless=${pkgver}-${pkgrel}"
)
install="$pkgname.install"
source_aarch64=(
  "https://cdn.azul.com/zulu/bin/zulu${_majorver}.${_zulu_build}-ca-jre${_majorver}.${_minorver}.${_securityver}-linux_aarch64.tar.gz"
  "freedesktop-java.desktop"
)
source_x86_64=(
  "https://cdn.azul.com/zulu/bin/zulu${_majorver}.${_zulu_build}-ca-jre${_majorver}.${_minorver}.${_securityver}-linux_x64.tar.gz"
  "freedesktop-java.desktop"
)
sha256sums_aarch64=(
  '604d65f811f942d49099b7c1c1b865ff8b700d51299be0afffa24447a033b866'
  '58ec2bb43ff9bc98e6d14a5c5559d6768cc1b6e16443f4891134a8406fd4482c'
)
sha256sums_x86_64=(
  '740a9a3ed6b60de7ae2c22633f122147572024c1a66663f69aa7672ec48c4b09'
  '58ec2bb43ff9bc98e6d14a5c5559d6768cc1b6e16443f4891134a8406fd4482c'
)

_jvmdir=/usr/lib/jvm/java-${_majorver}-zulu

case "${CARCH}" in
  aarch64) _JARCH='aarch64';;
  x86_64) _JARCH='x64';;
esac

package() {

  cd "$srcdir/zulu${_majorver}.${_zulu_build}-ca-jre${_majorver}.${_minorver}.${_securityver}-linux_${_JARCH}"

  install -dm 755 "${pkgdir}${_jvmdir}"

  cp -a bin lib \
    "${pkgdir}${_jvmdir}"

  # Conf
  install -dm 755 "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/java${_majorver}-zulu"
  ln -s "/etc/java${_majorver}-zulu" "${pkgdir}/${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/java${_majorver}-zulu"
  cp DISCLAIMER "${pkgdir}/usr/share/licenses/java${_majorver}-zulu/"
  ln -s "/usr/share/licenses/java${_majorver}-zulu" "${pkgdir}/${_jvmdir}/legal"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"

  # Desktop files
    install -Dm 644 \
      "${srcdir}/freedesktop-java.desktop" \
      "${pkgdir}/usr/share/applications/java-java${_majorver}-zulu.desktop"
}

# vim: ts=2 sw=2 et:
