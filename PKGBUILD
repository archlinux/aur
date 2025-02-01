# Maintainer: XOX (milklikecomputer) <Brilliunt7164[at]proton[dot]me>

pkgname='jre-zulu-fx'
pkgver='23.0.2+7'
pkgrel=1
pkgdesc='A open source, TCK-tested and certified builds of OpenJDK (full-runtime environment with OpenJFX).'
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
  'java-openjfx=23'
)
conflicts=('jre-zulu' 'zulu-23-bin' 'zulu-fx-bin')
options=('!debug')
install="install_${pkgname}.install"
source_aarch64=('https://cdn.azul.com/zulu/bin/zulu23.32.11-ca-fx-jre23.0.2-linux_aarch64.tar.gz')
source_x86_64=('https://cdn.azul.com/zulu/bin/zulu23.32.11-ca-fx-jre23.0.2-linux_x64.tar.gz')
sha256sums_aarch64=('c13eb52e7b98f88de846867c42f3f7f36c4fc1467790e6c92a792d2ff645a9d0')
sha256sums_x86_64=('18a8002445bc6e45ed32cbfeeea5df67ec0e7c22945f4a6e58616564a7219709')

_jvmdir='/usr/lib/jvm/java-23-fx-zulujdk'

package() {
  if [ "${CARCH}" = "aarch64" ]; then
    cd "$srcdir/zulu23.32.11-ca-fx-jre23.0.2-linux_aarch64"
  else
    cd "$srcdir/zulu23.32.11-ca-fx-jre23.0.2-linux_x64"
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
