# Maintainer: Ole Ernst <olebowle[at]gmx[dot]com>
pkgname=esplorer
pkgver=0.2.0_rc6
_gitver=eb6654ce133376680d9a9444798f38282546c9b1
pkgrel=2
pkgdesc="Integrated Development Environment (IDE) for ESP8266 developers"
arch=('any')
url="https://esp8266.ru/${pkgname}"
license=('GPL2')
depends=('bash' 'java-runtime')
makedepends=('gendesk' 'git' 'maven')
source=("${pkgname}::git+https://github.com/4refr0nt/ESPlorer#commit=${_gitver}")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}"
  mvn clean package -Dmaven.repo.local="${srcdir}/.mvn"
  gendesk -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --categories "Development;Network;Building;IDE"
  echo -e "#!/bin/sh\njava -jar /usr/share/java/${pkgname}/ESPlorer.jar" > "${pkgname}.sh"
}

package() {
  cd "${pkgname}"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 target/ESPlorer.jar "${pkgdir}/usr/share/java/${pkgname}/ESPlorer.jar"
  install -Dm644 src/main/resources/resources/ESP8266-96x96.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
