# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=netinstall
pkgname=(netinstall netinstall-gui)
pkgver=7.8
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
sha256sums=('b3d1adbfff9eb82d5b229a98182774885e05f36b19bf76acdc9b1c00a3d534a3'
            'f6e44bac46f7b68f7ea25d41caadeb550ebde438a593fa26230e51e61b648662'
            '285e32e9ba8bad9791cf3d5d3653b6e21bd771adcc32ea2036fe32dc9dafcfe0'
            'd45ecf4585047769ee64957b7066910d8992eb6da4a60b4773328460e912794a'
            'b5efb376a6705c376465bff6f52dc0713c15fbd5cd861fdc39969cbb22c233b4')

build() {
  wrestool -x -t 14 netinstall.exe > netinstall.ico
  gcc ${CFLAGS} ${LDFLAGS} -o netinstall-gui netinstall-gui.c -lcap
}

package_netinstall() {
  pkgdesc='Mikrotik Netinstall for RouterOS - CLI with network namespace'
  optdepends=('sudo: invoke as non-root')

  install -D -m0755 netinstall.sh ${pkgdir}/usr/bin/netinstall
  install -D -m0755 netinstall-cli ${pkgdir}/usr/lib/netinstall/netinstall-cli
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
