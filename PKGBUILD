# Maintainer: Ole Ernst <olebowle[at]gmx[dot]com>
pkgname=esplorer
pkgver=0.2.0_rc6
pkgrel=1
pkgdesc="Integrated Development Environment (IDE) for ESP8266 developers"
arch=('any')
url="https://esp8266.ru/${pkgname}"
license=('GPL2')
depends=('bash' 'java-runtime')
makedepends=('gendesk')
source=("${pkgname}.zip::https://esp8266.ru/${pkgname}-latest/?f=ESPlorer.zip")
sha256sums=('5b0b8d38f31f36776a3d2252130ae64971c06bce56590663ca398807ac719738')

# server doesn't like HTTP/2
DLAGENTS="$( IFS=$'\n'; echo "${DLAGENTS[*]}" | grep '^https::' ) --http1.1"

prepare() {
  bsdtar xf ESPlorer/ESPlorer.jar --strip-components 1 resources/ESP8266-96x96.png
  gendesk -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --categories "Development;Network;Building;IDE"
  echo -e "#!/bin/sh\njava -jar /usr/share/java/${pkgname}/ESPlorer.jar" > ${pkgname}.sh
}

package() {
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 ESP8266-96x96.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 ESPlorer/ESPlorer.jar "${pkgdir}/usr/share/java/${pkgname}/ESPlorer.jar"
  cp -r ESPlorer/lib "${pkgdir}/usr/share/java/${pkgname}/"
}
