# Maintainer: Ainola
# Contributor: Jeff Sharpe
# Contributor: Roman Pearah

pkgname=netextender
pkgver=7.5.758
pkgrel=1
pkgdesc="SonicWALL SSL VPN Client"
arch=('i686' 'x86_64')
url="http://www.sonicwall.com/us/en/products/324.html"
license=('custom')
depends=('java-environment' 'bash')
source=("http://realtime.demo.sonicwall.com/applications.zip")
install="${pkgname}.install"
sha256sums=('39233ba3f2768ceaaebb2539b7b6c2f5f8c21516abdcede5ef6e68d1ea118df0')

package() {
  mv "${srcdir}/applications/NetExtender/Linux/${pkgver}"/* "${srcdir}/"
  [[ "$CARCH" == 'i686' ]]   && bsdtar -xf "${srcdir}/NetExtender.tgz"
  [[ "$CARCH" == 'x86_64' ]] && bsdtar -xf "${srcdir}/NetExtender64.tgz"
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
  install -Dm 644 ca-bundle.crt "$pkgdir/usr/share/netExtender/ca-bundle.crt"

  # netExtenderGui is hard-coded to check in /usr/lib
  install -Dm 644 NetExtender.jar "$pkgdir/usr/lib/NetExtender.jar"
  install -Dm 644 icons/* "$pkgdir/usr/share/netExtender/icons"
  install -Dm 664 NetExtender.desktop "$pkgdir/usr/share/netExtender/NetExtender.desktop"
  install -Dm 664 NetExtender.desktop "$pkgdir/usr/share/applications/sonicwall-netextender.desktop"

  chown -f root:root "$pkgdir/usr/share/applications/sonicwall-netextender.desktop"
}
