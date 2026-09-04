# Maintainer: Sato Ki <satoki at em dot advant dot click>
# Contributor: techge
# Contributor: physkets
# Contributor: Andrew Crouthamel
# Contributor: Liviu Cristian Mirea-Ghiban
# Contributor: Lars Øyvind Hagland
# Contributor: Vishnu V K
# Contributor: George Shammas
# Contributor: Ainola
# Contributor: Jeff Sharpe
# Contributor: Roman Pearah

pkgname=netextender
pkgver=10.3.6_39
pkgrel=1
pkgdesc="SonicWALL SSL VPN Client"
arch=('aarch64' 'x86_64')
url="https://www.sonicwall.com/en-us/products/remote-access/vpn-client"
license=('LicenseRef-SonicWall-General-Product-Agreement')
depends=('bash'
         'net-tools'
         'webkit2gtk-4.1'
         'resolvconf'
         'iproute2'
         'hicolor-icon-theme')
optdepends=('xdg-utils: open the browser for SAML/external authentication'
            'bind: nslookup in the Diagnostics tab'
            'traceroute: traceroute in the Diagnostics tab'
            'iperf3: throughput test in the Diagnostics tab'
            'nftables: firewall rules for WireGuard tunnel-all mode'
            'iptables: firewall rules for WireGuard tunnel-all mode, if nft is absent')
source_aarch64=(
  "https://software.sonicwall.com/NetExtender/NetExtender-linux-arm64-${pkgver/_/-}.tar.gz"
  "https://www.sonicwall.com/legal/general-product-agreement"
  "com.sonicwall.NetExtender.desktop.patch"
  "NEService.service.patch"
  "neservice.patch"
  "netextender.install"
)
source_x86_64=(
  "https://software.sonicwall.com/NetExtender/NetExtender-linux-amd64-${pkgver/_/-}.tar.gz"
  "https://www.sonicwall.com/legal/general-product-agreement"
  "com.sonicwall.NetExtender.desktop.patch"
  "NEService.service.patch"
  "neservice.patch"
  "netextender.install"
)
sha256sums_aarch64=(
  "4e9d35d4b28cc175260689661f0ed25b8068bfda27563a2f0ce04c16d38ef5d9"
  "SKIP"
  "1c591a89e1b13112b51fe1bb9f0c0b4969530a3b7fd4949df1650365c39350d1"
  "35722921dfc9eae9ba21dd250128cdfd2d55e70d028d228ed9c66f94bf7c4273"
  "7c64cd38edb35aaf601fc01b9982fffc42542917832f9155c8ccf6605331ce9d"
  "90fce12da46ab2983a527aca7369524882bba1cfff9684ca172bc459cdf1363c"
)
sha256sums_x86_64=(
  "c2cb58cc39402ec5e08a18b57a73ff10ca313017ace06ea7bf04d9388c1b8357"
  "SKIP"
  "1c591a89e1b13112b51fe1bb9f0c0b4969530a3b7fd4949df1650365c39350d1"
  "35722921dfc9eae9ba21dd250128cdfd2d55e70d028d228ed9c66f94bf7c4273"
  "7c64cd38edb35aaf601fc01b9982fffc42542917832f9155c8ccf6605331ce9d"
  "90fce12da46ab2983a527aca7369524882bba1cfff9684ca172bc459cdf1363c"
)

install="${pkgname}.install"
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {

  install -Dm 644 general-product-agreement "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "netextender"

  netextenderdir="${pkgdir}/opt/netextender"

  install -Dm 755 wg "${netextenderdir}/wg"
  install -Dm 755 wg-quick "${netextenderdir}/wg-quick"
  install -Dm 755 wireguard-go "${netextenderdir}/wireguard-go"
  install -Dm 755 NEService "${netextenderdir}/NEService"
  install -Dm 755 NetExtender_webkit2_41 "${netextenderdir}/NetExtender"
  #install -Dm 755 autoUpgrader_webkit2_41 "${netextenderdir}/autoUpgrader"
  install -Dm 755 nxcli "${netextenderdir}/nxcli"
  #install -Dm 755 upgrade.sh "${netextenderdir}/upgrade.sh"
  patch "${srcdir}/netextender/NEService.service" < "${srcdir}/NEService.service.patch"
  patch "${srcdir}/netextender/neservice" < "${srcdir}/neservice.patch"
  install -Dm 644 NEService.service "${netextenderdir}/NEService.service"
  install -Dm 644 neservice "${netextenderdir}/neservice"

  mkdir -p "${netextenderdir}/locales"
  install -Dm 644 locales/* "${netextenderdir}/locales"

  patch "${srcdir}/netextender/com.sonicwall.NetExtender.desktop" < "${srcdir}/com.sonicwall.NetExtender.desktop.patch"
  install -Dm 644 com.sonicwall.NetExtender.desktop "${netextenderdir}/com.sonicwall.NetExtender.desktop"
  # The GTK window sets its Wayland app_id from argv[0], i.e. "NetExtender".
  # KWin only finds a window's icon through a desktop file named after the
  # app_id, so the entry must be installed as NetExtender.desktop.
  install -Dm 644 com.sonicwall.NetExtender.desktop "${pkgdir}/usr/share/applications/NetExtender.desktop"
  install -Dm 644 nx-icon.png "${netextenderdir}/nx-icon.png"
  install -Dm 644 nx-icon.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/netextender.png"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s /opt/netextender/nxcli "${pkgdir}/usr/bin/netExtender"
  ln -s /opt/netextender/nxcli "${pkgdir}/usr/bin/nxcli"

  # Unconditional: probing the build host's PID 1 makes the package depend on
  # where it was built, and yields no unit at all inside a clean chroot.
  # /etc/systemd/system belongs to the sysadmin, packages ship units in /usr/lib.
  # OpenRC users can install /opt/netextender/neservice into /etc/init.d.
  install -Dm 644 NEService.service "${pkgdir}/usr/lib/systemd/system/NEService.service"

  install -dm 755 "${netextenderdir}" \
                  "${netextenderdir}/locales"
}
