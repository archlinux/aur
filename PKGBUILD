# Maintainer: Ricardo Cabral <ricardo.arturo.cabral@gmail.com>

pkgname=tibia
pkgver=latest
pkgrel=1
pkgdesc="fast-paced free massively multiplayer online role-playing game"
arch=('x86_64')
url="http://www.tibia.com"
license=('custom')
depends=('glu' 'libgl' 'libice' 'libxext')
makedepends=('gendesk' 'python-html2text')

DLAGENTS=("https::/usr/bin/curl --compressed -fLC - --retry 0 --retry-delay 0 -e %u -o %o %u"
          "${DLAGENTS[@]}")

source=("${pkgname}.tar.gz::https://static.tibia.com/download/tibia.x64.tar.gz"
        "${pkgname}-agreement.php::https://www.tibia.com/support/agreement.php")

sha256sums=('SKIP'
            'SKIP')

prepare() {
  gendesk -f -n
  html2text "${pkgname}-agreement.php" > LICENSE
}

package() {
  mkdir -p "${pkgdir}/opt/"
  cp -drv --no-preserve=ownership Tibia/ "${pkgdir}/opt/"
  chmod -R 775 "${pkgdir}/opt/Tibia"
  chgrp -R games "${pkgdir}/opt/Tibia"

  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 Tibia/tibia.ico -t "${pkgdir}/usr/share/pixmaps/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin/"
  ln -s "../../opt/Tibia/Tibia" tibia
}
