# Maintainer: XOX (milklikecomputer) <0c2c5a81-0f19-4c94-bf0b-a693e3ced027[at]slmails[dot]me>

pkgname='jre-zulu-fx-bin'
pkgver='23.0.1'
pkgrel=1
pkgdesc='A open source, TCK-tested and certified builds of OpenJDK (full-runtime environment with OpenJFX).'
arch=('aarch64' 'x86_64')
url='https://www.azul.com/'
license=('LicenseRef-Java')
depends=(
  'java-environment-common>=3'
  'java-runtime-common>=3'
  'ca-certificates-utils'
)
provides=(
  'java-environment=23'
  'java-environment-openjdk=23'
  'java-runtime=23'
  'java-runtime-openjdk=23'
  'java-runtime-headless=23'
  'java-runtime-headless-openjdk=23'
  'java-openjfx=23'
)
conflicts=('jre-zulu-bin' 'zulu-23-bin' 'zulu-fx-bin')
install="install_${pkgname}.install"
source_aarch64=('https://cdn.azul.com/zulu/bin/zulu23.30.13-ca-fx-jre23.0.1-linux_aarch64.tar.gz')
source_x86_64=('https://cdn.azul.com/zulu/bin/zulu23.30.13-ca-fx-jre23.0.1-linux_x64.tar.gz')
sha256sums_aarch64=('4f544bd3f98fbdb059cf18379ad30193ede13a07d887ef3d85557facbf4677c7')
sha256sums_x86_64=('a90b5bf8ce8eb6b9fb8696fbba2cc6befc602736eed3bdb6fec2876ab8e0a797')

_jvmdir='/usr/lib/jvm/java-23-fx-zulujdk'

package() {
  if [ "${CARCH}" = "aarch64" ]; then
    cd "$srcdir/zulu23.30.13-ca-fx-jre${pkgver}-linux_aarch64"
  else
    cd "$srcdir/zulu23.30.13-ca-fx-jre${pkgver}-linux_x64"
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
