# Maintainer: Jeff Sharpe <jeff@impcode.com>
# Adopted package from
# Contributor: Roman Pearah <roman.pearah@gmail.com>


pkgname=netextender
pkgver=7.0.741
pkgrel=4
pkgdesc="SonicWALL SSL VPN Client"
arch=('i686' 'x86_64')
url="http://www.sonicwall.com/us/en/products/324.html"
license=('custom')
depends=('jre7-openjdk' 'net-tools' 'openssl' 'ppp')
source=("https://dl.dropboxusercontent.com/u/23491566/NetExtender.Linux.$pkgver.zip")
install="netextender.install"
md5sums=('3f10fbd2202439effef0e26b9d0b7d09')
sha256sums=('f94ad0e95964f5a61c2bb926f51e85c8f156bb20882a0a7d183282e0d3ef622f')

prepare() {
  cd "$srcdir"

  msg "Using arch $CARCH"
  [[ $CARCH == 'i686' ]] && bsdtar xf NetExtender.Linux.$pkgver.i386.tgz
  [[ $CARCH == 'x86_64' ]] && bsdtar xf NetExtender.Linux.$pkgver.x86_64.tgz
}

package() {
  cd "$srcdir/netExtenderClient"

  msg "Installing..."
  
  mkdir -p "$pkgdir/usr/share/netExtender/icons"

  install -D -m 644 sslvpn "$pkgdir/etc/ppp/peers/sslvpn"
  install -D -m 755 netExtender "$pkgdir/usr/bin/netExtender"
  install -D -m 755 netExtenderGui "$pkgdir/usr/bin/netExtenderGui"
  install -D -m 744 nxMonitor "$pkgdir/usr/bin/nxMonitor"
  install -D -m 4755 uninstallNetExtender "$pkgdir/usr/bin/uninstallNetExtender"

  install -D -m 757 sslvpnroute "$pkgdir/etc/ppp/ip-up.d/sslvpnroute"
  install -D -m 757 sslvpnroute6 "$pkgdir/etc/ppp/ipv6-up.d/sslvpnroute6"
  mkdir -p "$pkgdir/etc/ppp/ip-down.d"
  mkdir -p "$pkgdir/etc/ppp/ipv6-down.d"
  touch "$pkgdir/etc/ppp/ip-down.d/sslvpnroutecleanup"
  touch "$pkgdir/etc/ppp/ipv6-down.d/sslvpnroute6cleanup"
  chmod 757 "$pkgdir/etc/ppp/ip-down.d/sslvpnroutecleanup"
  chmod 757 "$pkgdir/etc/ppp/ipv6-down.d/sslvpnroute6cleanup"
  ln -s sslvpnroute "$pkgdir/etc/ppp/ip-up.d/sslvpnroute.sh"
  ln -s sslvpnroute6 "$pkgdir/etc/ppp/ipv6-up.d/sslvpnroute6.sh"
  ln -s sslvpnroutecleanup "$pkgdir/etc/ppp/ip-down.d/sslvpnroutecleanup.sh"
  ln -s sslvpnroutecleanup6 "$pkgdir/etc/ppp/ipv6-down.d/sslvpnroute6cleanup.sh"

  install -D -m 007 sslvpn.pid "$pkgdir/etc/ppp/sslvpn.pid"
  install -D -m 007 sslvpn.pid2 "$pkgdir/etc/ppp/sslvpn.pid2"
  install -D -m 644 netExtender.1 "$pkgdir/usr/share/man/man1/netExtender.1"
  install -D -m 755 libNetExtender.so "$pkgdir/usr/lib/libNetExtender.so"
  install -D -m 644 ca-bundle.crt "$pkgdir/usr/share/netExtender/ca-bundle.crt"

  install -D -m 644 NetExtender.jar "$pkgdir/usr/lib/NetExtender.jar"
  install -D -m 644 icons/* "$pkgdir/usr/share/netExtender/icons"
  install -D -m 664 NetExtender.desktop "$pkgdir/usr/share/netExtender/NetExtender.desktop"
  install -D -m 664 NetExtender.desktop "$pkgdir/usr/share/applications/sonicwall-netextender.desktop"

  chown -f root "$pkgdir/usr/share/applications/sonicwall-netextender.desktop"
  chgrp -f root "$pkgdir/usr/share/applications/sonicwall-netextender.desktop"
  chmod -f 644 "$pkgdir/usr/share/applications/sonicwall-netextender.desktop"
}
