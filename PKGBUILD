# Maintainer: Gunnar Bretthauer <taijian@posteo.de>

pkgname=dynamic-dns-netcup-api
pkgver=3.0.1
pkgrel=1
pkgdesc="A simple dynamic DNS client written in PHP for use with the netcup DNS API."
arch=('any')
license=('MIT')
url="https://github.com/stecklars/${pkgname}"
depends=('php')
makedepends=()
optdepends=()
backup=(etc/${pkgname}/config.php)
source=("https://github.com/stecklars/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        ${pkgname}.service
        ${pkgname}.timer)
sha256sums=('e18b09c88a9f40efaf2b8c2189b95e81bd0e49e59eedfaa5f39a3b8549dfe145'
            'db2311a6ec2247a9e3c3d1a24641d3440d5bcc3e37618306e1038c0514885eab'
            '2b5d495fcb9c30171ec5244bd2182681ff931a7a8ccef317eb0d7a93ae34d99a')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  # replace path to config file in functions.php
  sed -i "/include_once/s/__DIR__ . '/'\/etc\/dynamic-dns-netcup-api/" functions.php
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  
  # install the php scripts
  install -Dm755 ./update.php "${pkgdir}/usr/share/${pkgname}/update.php"
  install -Dm644 ./functions.php "${pkgdir}/usr/share/${pkgname}/functions.php"
 
  # install systemd files
  install -Dm644 $srcdir/${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 $srcdir/${pkgname}.timer "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
  
  # copy the readmes
  install -Dm644 ./README.md "${pkgdir}/usr/share/doc/${pkgname}/readme.txt"
  install -Dm644 ./config.dist.php "${pkgdir}/usr/share/doc/${pkgname}/config.php.example"
  
  # copy example config to /etc/${pkgname}
  install -Dm640 ./config.dist.php "${pkgdir}/etc/${pkgname}/config.php"
}

