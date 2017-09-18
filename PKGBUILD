# Maintainer: Chet Gray
# Contributor: George Shammas
# Contributor: Ainola
# Contributor: Jeff Sharpe
# Contributor: Roman Pearah

pkgname=netextender
pkgver=8.6.801
pkgrel=1
pkgdesc="SonicWALL SSL VPN Client"
arch=('i686' 'x86_64')
url="http://www.sonicwall.com/us/en/products/324.html"
license=('custom')
depends=('java-environment' 'bash' 'ppp' 'net-tools')
source_i686=("https://sslvpn.demo.sonicwall.com/NetExtender.tgz")
source_x86_64=("https://sslvpn.demo.sonicwall.com/NetExtender.x86_64.tgz")
sha256sums_i686=('4fc4fb7ae9fd6539965e17e65b8db786c9b3496a5a5d910b80b84613fb6150be')
sha256sums_x86_64=('7c6532bcc946655246c179e54a983b4215a3c7bc2dcdc727b4ba77a84051b77c')
install="${pkgname}.install"
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {
  mkdir -p "$pkgdir/usr/share/netExtender/icons"
  cd "$srcdir/netExtenderClient"

  install -Dm 644 sslvpn "$pkgdir/etc/ppp/peers/sslvpn"
  install -Dm 755 netExtender "$pkgdir/usr/bin/netExtender"
  install -Dm 755 netExtenderGui "$pkgdir/usr/bin/netExtenderGui"
  install -Dm 744 nxMonitor "$pkgdir/usr/bin/nxMonitor"

  mkdir -p "$pkgdir/etc/ppp/ip-down.d"
  mkdir -p "$pkgdir/etc/ppp/ipv6-down.d"
  touch "$pkgdir/etc/ppp/ip-down.d/sslvpnroutecleanup"
  touch "$pkgdir/etc/ppp/ipv6-down.d/sslvpnroute6cleanup"
  chmod 757 "$pkgdir/etc/ppp/ip-down.d/sslvpnroutecleanup"
  chmod 757 "$pkgdir/etc/ppp/ipv6-down.d/sslvpnroute6cleanup"

  install -Dm 644 netExtender.1 "$pkgdir/usr/share/man/man1/netExtender.1"
  install -Dm 755 libNetExtender.so "$pkgdir/usr/lib/libNetExtender.so"
  install -Dm 755 libNetExtenderEpc.so "$pkgdir/usr/lib/libNetExtenderEpc.so"
  install -Dm 644 ca-bundle.crt "$pkgdir/usr/share/netExtender/ca-bundle.crt"

  # netExtenderGui is hard-coded to check in /usr/lib
  install -Dm 644 NetExtender.jar "$pkgdir/usr/lib/NetExtender.jar"
  install -Dm 644 icons/* "$pkgdir/usr/share/netExtender/icons"
  install -Dm 664 NetExtender.desktop "$pkgdir/usr/share/netExtender/NetExtender.desktop"
  install -Dm 664 NetExtender.desktop "$pkgdir/usr/share/applications/sonicwall-netextender.desktop"

  chown -f root:root "$pkgdir/usr/share/applications/sonicwall-netextender.desktop"
}
