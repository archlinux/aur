# Maintainer: executter <executter at hotmail dot com>

pkgname=ocsinventory-agent3
pkgver=3.0.0
pkgrel=1
pkgdesc="Hardware and software inventory agent for OCS Inventory server 3.x"
arch=('x86_64')
url="https://github.com/OCSInventory-NG/OCSInventory-Agent-Rework"
license=('GPL-3.0-or-later' 'GPL-3.0-only')
depends=('bash' 'ca-certificates' 'coreutils' 'dmidecode' 'glibc'
         'inetutils' 'iproute2' 'systemd' 'tar' 'util-linux' 'which')
makedepends=('dart')
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
options=('!strip' '!debug')
install=$pkgname.install
backup=('etc/ocsinventory-agent/config.json')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'fix-agent-version.patch'
        'fix-os-release.patch'
        'fix-ip-address.patch'
        'config.json'
        'linux-arch-template.json'
        'linux-arch-extended-template.json')
sha256sums=('704d641fc523902f88c05aa665e68d614cf5a3a26ce1f69e5fd3610fc4725365'
            '212f04b36efccf976251226ce1fc09f333ce7dafe3b50634b5199f81bdf1a9d3'
            'd474fb83581dd17d282ea03558c9e3d9fc826e2d426e93e93ffd3179a4ad1b31'
            'b504d7ce0480966bb044d28703ec1df9ef3ac5e52afbd03c21a1cc248cba0923'
            '3d1a7939a86f46a01efc14de561371ca63ad5228256585c37139b0032f603027'
            '1b961e5cf26152feb1fa0d35acb7c7a8111e50500766827705324410c21a9c1c'
            '29524d0e4de357de917978131154066cbbe624ef39c22d012b5fb9717aa4e404')

prepare() {
  cd OCSInventory-Agent-Rework-$pkgver

  # Merged after 3.0.0: https://github.com/OCSInventory-NG/OCSInventory-Agent-Rework/pull/168
  patch -Np1 -i ../fix-agent-version.patch
  # https://github.com/OCSInventory-NG/OCSInventory-Agent-Rework/pull/173
  patch -Np1 -i ../fix-os-release.patch
  # https://github.com/OCSInventory-NG/OCSInventory-Agent-Rework/pull/172
  patch -Np1 -i ../fix-ip-address.patch

  sed -i '/^PIDFile=/d' setup/linux/ocsinventory-agent.service

  export PUB_CACHE="$srcdir/pub-cache"
  dart --suppress-analytics pub get
}

build() {
  cd OCSInventory-Agent-Rework-$pkgver

  export PUB_CACHE="$srcdir/pub-cache"
  dart --suppress-analytics compile exe -DAPP_VERSION=$pkgver \
    -o ocsinventory-cli lib/app/app.dart
}

package() {
  install -Dm600 config.json "$pkgdir/etc/ocsinventory-agent/config.json"
  install -Dm644 -t "$pkgdir/usr/share/ocsinventory-agent3" \
    linux-arch-template.json linux-arch-extended-template.json

  cd OCSInventory-Agent-Rework-$pkgver
  install -Dm755 ocsinventory-cli "$pkgdir/usr/bin/ocsinventory-cli"
  install -Dm644 setup/linux/ocsinventory-agent.service \
    "$pkgdir/usr/lib/systemd/system/ocsinventory-agent3.service"
}
