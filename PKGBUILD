# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=netinstall
pkgname=(netinstall netinstall-gui)
pkgver=7.14.1
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
sha256sums=('a37c7f03c81b5152e11716588c12cee44623793e720ecda097c6bfa6ee134614'
            'f0aed6cd444a54b882d7eaa9a640167778357591cc8c9bba30b28f39fc46c62e'
            '285e32e9ba8bad9791cf3d5d3653b6e21bd771adcc32ea2036fe32dc9dafcfe0'
            'dbc5134eb21509b3cfd660c09e090960a08b2661a4789d94c1bc4f5db1a6f886'
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
