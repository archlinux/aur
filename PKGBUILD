# Maintainer: Ricardo Cabral <ricardo.arturo.cabral@gmail.com>

pkgname=tibia
pkgver=latest
pkgrel=1
pkgdesc="fast-paced free massively multiplayer online role-playing game"
arch=('x86_64')
url="http://www.tibia.com"
license=('custom')
depends=('glu' 'libgl' 'libice' 'libxext' 'openssl-1.0' 'pcre' 'qt5-base' 'qt5-declarative')
makedepends=('gendesk' 'python-html2text')

source=("${pkgname}.tar.gz::http://static.tibia.com/download/tibia.x64.tar.gz"
        "${pkgname}-agreement.php::http://www.tibia.com/support/agreement.php"
        "01_openssl102.patch"
        "02_freetype.patch")

sha256sums=('SKIP'
            '1200d3d5a77c8408a79a92c2fb4bdb5fa123b928aa036a32d2951e2459f0f7d9'
            'e9e6cdd4e2954ae0838dc427a92871bb9cacdacb0523598c60287a05f8568d1f'
            '3cdf107369e4366aa5fc6d1b90ba0b41bd3d19abeb418fb85a693d74c3ece736')

prepare() {
  gendesk -f -n
  html2text "${pkgname}-agreement.php" > LICENSE

  cd Tibia
  # Tibia relies on openssl 1.0.x
  patch -Np0 -i "${srcdir}/01_openssl102.patch"
  # Tibia relies on specific freetype version
  patch -Np0 -i "${srcdir}/02_freetype.patch"
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
  ln -s "../../opt/Tibia/start-tibia-launcher.sh" tibia
}
