# Maintainer: Ricardo Cabral <ricardo.arturo.cabral@gmail.com>

pkgname=tibia
pkgver=11.49.6030
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

sha256sums=('a786a8c922222db031a9e8ab65a350b2f8d0d2402c4d2c5e0f1f05f33321becc'
            '965edf1cf67698f9dcfcbced495e0e96a666207a9a0b91fb769ed386a5f1efe5'
            '6484f05cc54363d1d4e30293c56476eb9fd079b1e26dcd9b0ba2c05b26f6f399'
            '976fc8d84b5d3dff06644cc9273be404aaa76261051037d268b2bb5266870fc4')

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
