# Maintainer: Ricardo Cabral <ricardo.arturo.cabral@gmail.com>

pkgname=tibia
pkgver=11.47.5674
pkgrel=1
pkgdesc="fast-paced free massively multiplayer online role-playing game"
arch=('x86_64')
url="http://www.tibia.com"
license=('custom')
depends=('glu' 'libgl' 'libice' 'libxext' 'openssl-1.0' 'pcre' 'qt5-base' 'qt5-declarative')
makedepends=('gendesk' 'python-html2text')

source=("${pkgname}-${pkgver}.tar.gz::http://static.tibia.com/download/tibia.x64.tar.gz"
        "${pkgname}-agreement.php::http://www.tibia.com/support/agreement.php"
        "01_openssl102.patch"
        "02_freetype.patch")

sha256sums=('be1b1e775143d57109f1a98f5006a0569512af9a7e2d6c4e10c0903de47f489b'
            '965edf1cf67698f9dcfcbced495e0e96a666207a9a0b91fb769ed386a5f1efe5'
            '96f4a640769990f30460f5ad7f73a7bd2f7222f77a33c2bc2e2f2f9810e48740'
            '112704e3666c5cc679cc807e093487da3ad8b51014ab69d6f4a4da0216e83895')

prepare() {
  gendesk -f -n
  html2text "${pkgname}-agreement.php" > LICENSE

  # Tibia relies on openssl 1.0.x
  patch -Np0 -i "${srcdir}/01_openssl102.patch"
  # Tibia relies on specific freetype version
  patch -Np0 -i "${srcdir}/02_freetype.patch"
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
  cd "${pkgdir}/usr/bin/"
  ln -s "../../opt/Tibia/start-tibia.sh" tibia
}
