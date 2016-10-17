# Maintainer: Ricardo Cabral <ricardo.arturo.cabral@gmail.com>

pkgname=tibia
pkgver=11.00.3953
pkgrel=1
pkgdesc="A fast-paced free massively multiplayer online role-playing game."
arch=('x86_64')
url="http://www.tibia.com"
license=('custom')
depends=('glu' 'libgl' 'libice' 'libxext' 'pcre' 'qt5-base' 'qt5-declarative')
makedepends=('gendesk' 'python-html2text')

source=("${pkgname}-${pkgver}.tar.gz::http://static.tibia.com/download/tibia.x64.tar.gz"
        'http://www.tibia.com/support/agreement.php'
        "tibia-starter.patch")

sha256sums=('b43efc8e7246b7094a84146cbd2796442fa7aa56f5e0b63c604b788ca7c66ba9'
            'fb192d96b893d012c0ecbf216885846c2826bdb72ae7824879959d3b01564f34'
            '31e8254ad506ea3fc8662c840107f3f60997ad0b109f0daa4c395ccdf81652da')

prepare() {
  gendesk -f -n
  html2text agreement.php > LICENSE

  # Adjust start-tibia.sh
  patch -Np1 -i "tibia-starter.patch"
}

package() {
  mkdir -p "${pkgdir}/opt/Tibia"
  cp -drv --no-preserve=ownership ${pkgname}-${pkgver}/* "${pkgdir}/opt/Tibia"
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 ${pkgname}-${pkgver}/tibia.ico -t "${pkgdir}/usr/share/pixmaps/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/bin"
  install -Dm755 ${pkgname}-${pkgver}/start-tibia.sh "${pkgdir}/usr/bin/tibia"
}

