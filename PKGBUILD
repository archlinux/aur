# Maintainer: XOX (milklikecomputer) <Brilliunt7164[at]proton[dot]me>

pkgname='jre-zulu'
pkgver='23.0.2+7'
pkgrel=1
pkgdesc='A open source, TCK-tested and certified builds of OpenJDK (full-runtime environment).'
arch=('aarch64' 'x86_64')
url='https://www.azul.com/'
license=('LicenseRef-Java')
depends=(
  'java-runtime-common>=3'
  'ca-certificates-utils'
)
provides=(
  'java-runtime=23'
  'java-runtime-headless=23'
  'java-runtime-openjdk=23'
  'java-runtime-headless-openjdk=23'
  'jre23-openjdk=23.0.2'
  'jre23-openjdk-headless=23.0.2'
)
conflicts=('jre-zulu-fx' 'zulu-23-bin' 'zulu-fx-bin')
options=('!debug')
install="install_${pkgname}.install"
source_aarch64=('https://cdn.azul.com/zulu/bin/zulu23.32.11-ca-jre23.0.2-linux_aarch64.tar.gz')
source_x86_64=('https://cdn.azul.com/zulu/bin/zulu23.32.11-ca-jre23.0.2-linux_x64.tar.gz')
sha256sums_aarch64=('2b9bee7e79633f98083035157b0524e8ec440d8b656b2a9a9988f3472a5e0c4f')
sha256sums_x86_64=('adeda833618e0923180210c932d1b40387f5486c41014a7ff3c9acc5d799b85b')

_jvmdir='/usr/lib/jvm/java-23-zulujdk'

package() {
  if [ "${CARCH}" = "aarch64" ]; then
    cd "$srcdir/zulu23.32.11-ca-jre23.0.2-linux_aarch64"
  else
    cd "$srcdir/zulu23.32.11-ca-jre23.0.2-linux_x64"
  fi

  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -a . "${pkgdir}/${_jvmdir}/"

  # based on java-openjdk (package_jre-openjdk, jdk-openjdk), zulu-23-bin and zulu-fx-bin

  # Conf
  install -dm 755 "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/${pkgname}"
  rm -r "${pkgdir}/${_jvmdir}/conf"
  ln -s "/etc/${pkgname}" "${pkgdir}/${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}/${_jvmdir}/legal"
  ln -s "/usr/share/licenses/${pkgname}" "${pkgdir}/${_jvmdir}/legal"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
}
