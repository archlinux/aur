# Maintainer: Ricardo Cabral <ricardo.arturo.cabral@gmail.com>

pkgname=tibia
pkgver=11.49.5813
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

sha256sums=('2cec040791c3d3ad948835df77778e74485e16631651538688913dca2e7d3c38'
            '965edf1cf67698f9dcfcbced495e0e96a666207a9a0b91fb769ed386a5f1efe5'
            '9ca4b26e772466ff8f2e88b1caa0d4ae18eb24083fc229703bd49de6dce5b23d'
            '3267f739b17287df7d9410ea47e1ced19e9489dc4a00a1b18c91ae7a1044270c')

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
