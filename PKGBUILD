# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Thomas Kuther <tom@kuther.net>
# Contributor: Alexandre Berthaud <alexandre at berthaud dot me>

_pkgname=kse
pkgname=keystore-explorer
pkgver=5.5.1
pkgrel=1
pkgdesc='KeyStore Explorer is a free GUI replacement for the Java command-line utilities keytool and jarsigner'
arch=('any')
url='https://keystore-explorer.org'
license=('GPL3')
depends=('java-runtime')
makedepends=('gradle' 'java-environment')
conflicts=('keystore-explorer-bin' 'keystore-explorer-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kaikramer/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('03c94f0ac5fcc52543bfbd5e5bcc646264190bb7e93d96c12661a8b5a2c959d1d7060edfe61badc12228cf321e94a32550849bcfccf23466b51f7e2bdf878610')

build() {
  cd "${pkgname}-${pkgver}"/${_pkgname}
  gradle clean build
}

package() {
  cd "${pkgname}-${pkgver}"
  # Extract package data
  bsdtar -xf "${_pkgname}/build/distributions/${_pkgname}-${pkgver}.tar"

  # JAR
  install -dm755 "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}/lib/"*.jar "${pkgdir}/usr/share/java/${pkgname}"
  ln -sf . "${pkgdir}/usr/share/java/${pkgname}/lib"

  # Binary
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${_pkgname}-${pkgver}/bin/${_pkgname}" "${pkgdir}/usr/share/java/${pkgname}"
  ln -sf "/usr/share/java/${pkgname}/lib/kse" "${pkgdir}/usr/bin/kse"

  # Desktop
  for size in 16 32 48 128 256 512; do
    install -Dm644 "${_pkgname}/icons/${_pkgname}_${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
  done
  install -Dm644 "${_pkgname}/icons/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  install -Dm644 "${_pkgname}/res/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Doc
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${_pkgname}/res/readme.txt" "${pkgdir}/usr/share/doc/${pkgname}/readme.txt"
}
