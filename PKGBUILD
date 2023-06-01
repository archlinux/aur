# Maintainer: Tommaso Dordoni <t.dordoni.aur@outlook.com>

_java=17
_jdk=${_java}.0.7
_pkgver_major="23"
_pkgver_minor="05.0.0"
_pkgver_build="2"

pkgname="jdk${_java}-azul-prime-bin"
pkgver="${_pkgver_major}.${_pkgver_minor}_${_pkgver_build}"
pkgrel=1
pkgdesc="Azul Platform Prime Stream Build of OpenJDK 17. TCK compliant, free for development."
arch=(
  'x86_64'
  'aarch64'
)
url="https://www.azul.com/downloads/#prime"
license=('unknown')
depends=(
  'java-environment-common'
  'java-runtime'
  'ca-certificates-utils'
  'libx11'
  'libxi'
  'libxtst'
  'alsa-lib'
  'libxext'
  'libxrender'
)
install="$pkgname.install"
changelog="$pkgname.changelog"
source_x86_64=("https://cdn.azul.com/zing-zvm/ZVM${_pkgver_major}.${_pkgver_minor}/zing${pkgver//_/-}-jdk${_jdk}-linux_x64.tar.gz")
source_aarch64=("https://cdn.azul.com/zing-zvm/ZVM${_pkgver_major}.${_pkgver_minor}/zing${pkgver//_/-}-jdk${_jdk}-linux_aarch64.tar.gz")
sha256sums_x86_64=('9168a4caa77c407b72074d187caefa2dbc1a8464f0806aa69ecb5c7229ece293')
sha256sums_aarch64=('610d34408b9811c239508d5f3804fcc29d6c7446e9e146fcab288183d03763ec')

_jvmdir="/usr/lib/jvm/java-${_java}-azul-prime"

BUILDENV+=('!check')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    cd "$srcdir/zing${pkgver//_/-}-jdk${_jdk}-linux_x64"
  elif [ "${CARCH}" = "aarch64" ]; then
    cd "$srcdir/zing${pkgver//_/-}-jdk${_jdk}-aarch64"
  fi
  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -a . "${pkgdir}/${_jvmdir}/"

  cd "${pkgdir}${_jvmdir}"

  # Conf
  install -dm 755 "${pkgdir}/etc"
  mv conf "${pkgdir}/etc/java-azul-prime"
  ln -sf /etc/java-azul-prime conf

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  mv legal "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sf /usr/share/licenses/${pkgname} legal

  # Man pages
  for f in man/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-azul-prime${_pkgver_major}.1}"
  done
  rm -rf man
  ln -sf /usr/share/man man

  # Link JKS keystore from ca-certificates-utils
  rm -f lib/security/cacerts
  ln -sf /etc/ssl/certs/java/cacerts lib/security/cacerts
}