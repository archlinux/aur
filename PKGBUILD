# Maintainer: executter <executter at hotmail dot com>

pkgname=ocsinventory-agent3-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Hardware and software inventory agent for OCS Inventory server 3.x"
arch=('x86_64')
url="https://github.com/OCSInventory-NG/OCSInventory-Agent-Rework"
license=('GPL-3.0-or-later' 'GPL-3.0-only')
depends=('bash' 'ca-certificates' 'coreutils' 'dmidecode' 'glibc'
         'inetutils' 'iproute2' 'systemd' 'tar' 'util-linux' 'which')
optdepends=('cups: printer inventory'
            'libdisplay-info: monitor inventory'
            'libvirt: libvirt virtual machine inventory'
            'pciutils: controller, sound and video card inventory'
            'python: process, cron and uptime inventory (Extended template)'
            'smartmontools: disk model, firmware and serial numbers'
            'sudo: per-user VM, firewall and TeamViewer inventory'
            'teamviewer: TeamViewer ID inventory (Extended template)'
            'upower: battery inventory'
            'usbutils: USB device inventory'
            'virtualbox: VirtualBox virtual machine inventory')
provides=('ocsinventory-agent3')
conflicts=('ocsinventory-agent3')
options=('!strip' '!debug')
install=$pkgname.install
backup=('etc/ocsinventory-agent/config.json')
source=("$url/releases/download/$pkgver/OCSInventory-Agent-Setup-Linux-Deb-$pkgver.tar.xz"
        'config.json'
        'linux-arch-template.json'
        'linux-arch-extended-template.json')
sha256sums=('05b00d9b1c599c1390eab80195de0a88bf7151c9dff626d507ea5764545dd5d5'
            '3d1a7939a86f46a01efc14de561371ca63ad5228256585c37139b0032f603027'
            '1b961e5cf26152feb1fa0d35acb7c7a8111e50500766827705324410c21a9c1c'
            '29524d0e4de357de917978131154066cbbe624ef39c22d012b5fb9717aa4e404')

prepare() {
  sed -i '/^PIDFile=/d' OCSInventory-Agent-Linux-Deb-Setup/ocsinventory-agent.service
}

package() {
  install -Dm600 config.json "$pkgdir/etc/ocsinventory-agent/config.json"
  install -Dm644 -t "$pkgdir/usr/share/ocsinventory-agent3" \
    linux-arch-template.json linux-arch-extended-template.json

  cd OCSInventory-Agent-Linux-Deb-Setup
  install -Dm755 ocsinventory-cli "$pkgdir/usr/bin/ocsinventory-cli"
  install -Dm644 ocsinventory-agent.service \
    "$pkgdir/usr/lib/systemd/system/ocsinventory-agent3.service"
}
