# Maintainer: puddings233 <puddings233 at outlook dot com>

_majorver=21
_minorver=0
_securityver=13.1
_updatever=2
_zulu_build="54.201"
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
  'b57818391fb10a7afe5f636fac1bc8644cdd998230bf3d94538456d7e781493b'
  '64e1442e837d09e950059c56e0908107488edfbf7cf9c0b71fa8442ea3451270'
)
sha256sums_x86_64=(
  'f38eaca721b30cf779c745999b8320aa4ac5660c261a6b87bd7b953d1b59f63b'
  '64e1442e837d09e950059c56e0908107488edfbf7cf9c0b71fa8442ea3451270'
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
