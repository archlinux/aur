# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=netinstall
pkgname=(netinstall netinstall-gui)
pkgver=7.2.1
pkgrel=1
pkgdesc='Mikrotik Netinstall for RouterOS'
arch=('i686' 'x86_64')
url='https://www.mikrotik.com/'
license=('custom')
makedepends=('icoutils' 'libcap')
source=("https://download.mikrotik.com/routeros/${pkgver}/netinstall-${pkgver}.zip"
        "https://download.mikrotik.com/routeros/${pkgver}/netinstall-${pkgver}.tar.gz"
        'netinstall.desktop'
        'netinstall.sh'
        'netinstall-gui.c')
sha256sums=('d00a9519609fc6dc241ddc98cf389c0e8fcaab22c9d0a1557b8fc080632ed1bb'
            '8299402a2183886a13ebf4a94196b722ee77205e3eb27dfe7e78d2a756b61c3c'
            '285e32e9ba8bad9791cf3d5d3653b6e21bd771adcc32ea2036fe32dc9dafcfe0'
            'f074f8c93e33a2278fd7209747a3e2c6d725935b5670b5e992ab1e4ece6e808e'
            'b5efb376a6705c376465bff6f52dc0713c15fbd5cd861fdc39969cbb22c233b4')

build() {
  wrestool -x -t 14 netinstall.exe > netinstall.ico
  gcc ${CFLAGS} ${LDFLAGS} -o netinstall-gui netinstall-gui.c -lcap
}

package_netinstall() {
  pkgdesc='Mikrotik Netinstall for RouterOS - CLI with network namespace'
  optdepends=('sudo: invoke as non-root')

  install -D -m0755 netinstall.sh ${pkgdir}/usr/bin/netinstall
  install -D -m0755 netinstall ${pkgdir}/usr/lib/netinstall/netinstall
}

package_netinstall-gui() {
  pkgdesc='Mikrotik Netinstall for RouterOS - GUI via wine'
  depends=('wine' 'libcap')
  install=netinstall-gui.install

  install -D -m0755 netinstall-gui ${pkgdir}/usr/bin/netinstall-gui
  install -D -m0755 netinstall.exe ${pkgdir}/usr/lib/netinstall/netinstall.exe
  install -D -m0644 netinstall.desktop ${pkgdir}/usr/share/applications/netinstall.desktop
  install -D -m0644 netinstall.ico ${pkgdir}/usr/share/pixmaps/netinstall.ico
  install -D -m0644 LICENSE.txt ${pkgdir}/usr/share/licenses/netinstall/LICENSE.txt
}
