# Maintainer: Ricardo Cabral <ricardo.arturo.cabral@gmail.com>

pkgname=tibia
pkgver=11.21.4812
pkgrel=1
pkgdesc="A fast-paced free massively multiplayer online role-playing game."
arch=('x86_64')
url="http://www.tibia.com"
license=('custom')
depends=('glu' 'libgl' 'libice' 'libxext' 'pcre' 'qt5-base' 'qt5-declarative')
makedepends=('gendesk' 'python-html2text')

source=("${pkgname}-${pkgver}.tar.gz::http://static.tibia.com/download/tibia.x64.tar.gz"
        "${pkgname}-agreement.php::http://www.tibia.com/support/agreement.php"
        "tibia-starter.patch")

sha256sums=('18e82fc7f24bf4a9853fb32e71da10bbaa7c46cbfc02eab9ca7fd40c7e5d2452'
            '965edf1cf67698f9dcfcbced495e0e96a666207a9a0b91fb769ed386a5f1efe5'
            'b110e31868b86de5d0f07218fad2ade20e272dd700f86df7235eac4ef8f8f07c')

prepare() {
  gendesk -f -n
  html2text "${pkgname}-agreement.php" > LICENSE

  # Adjust start-tibia.sh
  patch -Np1 -i "tibia-starter.patch"
}

package() {
  mkdir -p "${pkgdir}/opt/Tibia"
  cp -drv --no-preserve=ownership ${pkgname}-${pkgver}/* "${pkgdir}/opt/Tibia"
  chmod -R 775 "${pkgdir}/opt/Tibia"
  chgrp -R games "${pkgdir}/opt/Tibia"

  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 ${pkgname}-${pkgver}/tibia.ico -t "${pkgdir}/usr/share/pixmaps/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/bin"
  install -Dm755 ${pkgname}-${pkgver}/start-tibia.sh "${pkgdir}/usr/bin/tibia"
}
