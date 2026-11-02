# Maintainer: puddings233 <puddings233 at outlook dot com>

_majorver=17
_minorver=0
_securityver=21.0.3
_updatever=1
_zulu_build="70.113"
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
  '35f87569d36db2c4245ab49309b1e3f2c2cc279b07cc15140aabd9239015a23f'
  '4b0278be06c9705063305da113c9b9e6ddf3c00d3a3c51e894885e08ba42dbcb'
)
sha256sums_i686=(
  'e535df5c2dcafe96ce6950873fc558010f91b4d48af84e974c8bd605db857a72'
  '4b0278be06c9705063305da113c9b9e6ddf3c00d3a3c51e894885e08ba42dbcb'
)
sha256sums_x86_64=(
  '1921269ee6866125deebf04c8de8c05a6e7810f7cd0ad723e02c2990288e1757'
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
