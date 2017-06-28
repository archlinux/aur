# Maintainer: Ricardo Cabral <ricardo.arturo.cabral@gmail.com>

pkgname=tibia
pkgver=11.32.5246
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

sha256sums=('907421de4de759f424c00bd8c1fa836568ff2fc80b9a0ca792bef1876747cdae'
            '965edf1cf67698f9dcfcbced495e0e96a666207a9a0b91fb769ed386a5f1efe5'
            '5ea261b626e788eedebc677df9ca412e668a7ea9db0b88e362378330c2ff475f')

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
