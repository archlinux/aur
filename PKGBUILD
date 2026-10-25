# Maintainer: puddings233 <puddings233 at outlook dot com>

_majorver=17
_minorver=0
_securityver=21
_updatever=9
_zulu_build="70.111"
pkgname=jre${_majorver}-zulu-bin
pkgver=${_majorver}.${_minorver}.${_securityver}+${_updatever}
pkgrel=1
pkgdesc='Azul Zulu OpenJDK full runtime environment, bin version.'
arch=('aarch64' 'i686' 'x86_64')
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
source_i686=(
  "https://cdn.azul.com/zulu/bin/zulu${_majorver}.${_zulu_build}-ca-jre${_majorver}.${_minorver}.${_securityver}-linux_i686.tar.gz"
  "freedesktop-java.desktop"
)
source_x86_64=(
  "https://cdn.azul.com/zulu/bin/zulu${_majorver}.${_zulu_build}-ca-jre${_majorver}.${_minorver}.${_securityver}-linux_x64.tar.gz"
  "freedesktop-java.desktop"
)
sha256sums_aarch64=(
  '6ef6ddc863022083d1d33509eff2d5fb580d000cebfdcf5602a6a3c6239d1557'
  '4b0278be06c9705063305da113c9b9e6ddf3c00d3a3c51e894885e08ba42dbcb'
)
sha256sums_i686=(
  'f971684957a57f30a162d71732bfaa5bcc097a873d220abaa9aeea1b0793c7e9'
  '4b0278be06c9705063305da113c9b9e6ddf3c00d3a3c51e894885e08ba42dbcb'
)
sha256sums_x86_64=(
  '95f5ca5ad770f631f94738f328e6da8f085452443aae54f95b8a45be9f6c2d9d'
  '4b0278be06c9705063305da113c9b9e6ddf3c00d3a3c51e894885e08ba42dbcb'
)

_jvmdir=/usr/lib/jvm/java-${_majorver}-zulu

case "${CARCH}" in
  aarch64) _JARCH='aarch64';;
  i686)   _JARCH='i686';;
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
