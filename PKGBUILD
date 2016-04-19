# Maintainer: Swift Geek <swifgeek ɐŧ google bøt cøm>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>

# TODO: move libs to lib32 ?
# User lib32-gtk2 properly

DLAGENTS=('http::/usr/bin/curl -d agree="We+luv+You" -fL -o %o %u')

pkgname=netfabb-basic
pkgver=7.4.0
pkgrel=1
pkgdesc="view and repair STL files"
arch=('i686' 'x86_64')
url="http://www.netfabb.com/downloadcenter.php?basic=1"
license=('custom:freeware')
depends=('gtk2' 'desktop-file-utils' 'hicolor-icon-theme')
install='netfabb-basic.install'

md5sums=('8901e9ed2f93d64a298aa328d762b3d1') # 32-bit
nARCH=32
if [ "$CARCH" == x86_64 ] ; then
   md5sums=('19eeb80c953e9eb0e22a635678a1a18e') # 64-bit
   depends[0]="lib32-gtk2"
   nARCH=64
fi
if [ -z "$pikey" ] && [ ! -e "netfabb-basic_${pkgver}_linux${nARCH}.tar.gz" ] ; then
  msg "Fetching pikey"
  pikey=$(curl --data "operatinsystems=linux" --data "zusatz=-$pkgver-9" --data "disti=targz" --data "download${nARCH}=Download%20for%20PC%20${nARCH}-Bit"  "http://www.netfabb.com/downloadcenter.php?basic=1" | grep pikey)
  pikey="${pikey#*pikey=}"
  export pikey="${pikey%%\">*}"
  [ -z "$pikey" ] && error "Fetching pikey has failed" && exit 1
  msg2 "pikey: $pikey"
fi
source=("netfabb-basic_${pkgver}_linux${nARCH}.tar.gz::http://www.netfabb.com/download.php?pikey=${pikey}")

# Static content
source+=("icons.tar.gz" "netfabb-basic.desktop")
md5sums+=('a6d3336b9dc60f30f94c9415d578dd7a' '2ab8714cd64e4aaa49457b5bb553f420')


package () {
  cd "$srcdir"
#  install -d "$pkgdir/usr/share/licenses/$pkgname"
#  cp "$pkgdir/usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/"
  install -d "$pkgdir/usr/bin/"
  install -m 755 ./netfabb_free "$pkgdir/usr/bin/netfabb-basic"
  install -d "$pkgdir/usr/lib/"
  install -m 755 ./*.so.* "$pkgdir/usr/lib/"
  install -d "$pkgdir/usr/share/applications"
  install -m 644 ./*.desktop "$pkgdir/usr/share/applications/"

  # Install icons
  cp -R ${srcdir}/icons ${pkgdir}/usr/share/
}
