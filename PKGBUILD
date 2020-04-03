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

DLAGENTS=("https::/usr/bin/curl --compressed -fLC - --retry 0 --retry-delay 0 -e %u -o %o %u"
          "${DLAGENTS[@]}")

source=("${pkgname}.tar.gz::https://static.tibia.com/download/tibia.x64.tar.gz"
        "${pkgname}-agreement.php::https://www.tibia.com/support/agreement.php"
        "01_openssl102.patch"
        "02_freetype.patch")

sha256sums=('SKIP'
            'SKIP'
            'f3a7c01c0664155a82f00a3d84d6d4a01f7786e872f3a12ae89886542bc43482'
            '55d87bd8f32728cd47757a195102e2af2d10a1501d9370af86606b2c75211515')

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
