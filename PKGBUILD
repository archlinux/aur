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
pkgver=10.3.0_21
pkgrel=1
pkgdesc="SonicWALL SSL VPN Client"
arch=('aarch64' 'x86_64')
url="https://www.sonicwall.com/en-us/products/remote-access/vpn-client"
license=('custom')
depends=('bash' 'ppp' 'net-tools' 'webkit2gtk-4.1')
source_aarch64=("https://software.sonicwall.com/NetExtender/NetExtender-linux-arm64-${pkgver//_/-}.tar.gz"
                "https://www.sonicwall.com/legal/general-product-agreement"
                "com.sonicwall.NetExtender.desktop.patch"
                "NEService.service.patch"
                "neservice.patch")
source_x86_64=("https://software.sonicwall.com/NetExtender/NetExtender-linux-amd64-${pkgver//_/-}.tar.gz"
               "https://www.sonicwall.com/legal/general-product-agreement"
               "com.sonicwall.NetExtender.desktop.patch"
               "NEService.service.patch"
               "neservice.patch")
sha256sums_aarch64=('ab8b0ac977c3c396b8715f7056c9f628b6367818c5a035b1d5b34b51da1d3a8d'
                    'SKIP'
                    '88a386970951db386eef17db0fd0e69a158082f9ce158f7d8443724240d2acaa'
                    '2508a93a89554078b9d1d1287b28d515013725cea8c34d52ed9b1e67c04b231d'
                    '3fbebc2942918484ddcbcfae02e6161069e43e8fcc0446770fa2edaa51094fb8')
sha256sums_x86_64=('a6717f29140c01c3e74e3d0d8beb0a2a4c3e1fbd961dfda2615916b163429dd7'
                   'SKIP'
                   '88a386970951db386eef17db0fd0e69a158082f9ce158f7d8443724240d2acaa'
                   '2508a93a89554078b9d1d1287b28d515013725cea8c34d52ed9b1e67c04b231d'
                   '3fbebc2942918484ddcbcfae02e6161069e43e8fcc0446770fa2edaa51094fb8')

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
  install -Dm 644 NEService.service "${netextenderdir}/NEService.service"
  install -Dm 644 neservice "${netextenderdir}/neservice"

  mkdir -p "${netextenderdir}/locales"
  install -Dm 644 locales/* "${netextenderdir}/locales"

  patch "${srcdir}/netextender/com.sonicwall.NetExtender.desktop" < "${srcdir}/com.sonicwall.NetExtender.desktop.patch"
  install -Dm 644 com.sonicwall.NetExtender.desktop "${netextenderdir}/com.sonicwall.NetExtender.desktop"
  install -Dm 644 com.sonicwall.NetExtender.desktop "${pkgdir}/usr/share/applications/com.sonicwall.NetExtender.desktop"
  install -Dm 644 nx-icon.png "${netextenderdir}/nx-icon.png"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s /opt/netextender/nxcli "${pkgdir}/usr/bin/netExtender"
  ln -s /opt/netextender/nxcli "${pkgdir}/usr/bin/nxcli"

  if ! [ -x "$(command -v resolvconf)" ] && [ -x "$(command -v resolvectl)" ]; then
    resolvectl=$(command -v resolvectl)
    ln -s ${resolvectl} "${pkgdir}/usr/bin/resolvconf"
  fi

  case "$(ps -p 1 -o comm=)" in
    systemd)
      patch "${srcdir}/netextender/NEService.service" < "${srcdir}/NEService.service.patch"
      install -Dm 644 NEService.service "${pkgdir}/etc/systemd/system/NEService.service"
      ;;
    init|openrc-init)
      patch "${srcdir}/netextender/neservice" < "${srcdir}/neservice.patch"
      install -Dm 644 neservice "${pkgdir}/etc/init.d/neservice"
      ;;
  esac

  install -dm 755 "${netextenderdir}" \
                  "${netextenderdir}/locales"
}
