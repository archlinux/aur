# Maintainer: Swift Geek <swifgeek ɐŧ google bøt cøm>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>

# TODO: move libs to lib32 ?
# User lib32-gtk2 properly

DLAGENTS=('http::/usr/bin/curl -d agree="We+luv+You" -fL -o %o %u')

pkgname=netfabb-basic
pkgver=5.2.1
pkgrel=1
pkgdesc="view and repair STL files"
arch=('i686' 'x86_64')
url="http://www.netfabb.com/downloadcenter.php?basic=1"
license=('custom:freeware')
depends=('gtk2' 'desktop-file-utils' 'hicolor-icon-theme')
install='netfabb-basic.install'

md5sums=('50b43a88530b5bd4736a88048d121801') # 32-bit
nARCH=32
if [ "$CARCH" == x86_64 ] ; then
   md5sums=('b2f288c19b23b1fbb1b5856ec7bc9f44') # 64-bit
   depends[0]="lib32-gtk2"
   nARCH=64
fi

if [ -z "$pikey" ]; then
  msg "Fetching pikey"
  pikey=$(curl --data "operatinsystems=linux" --data "zusatz=-$pkgver-9" --data "disti=targz" --data "download${nARCH}=Download%20for%20PC%20${nARCH}-Bit"  "http://www.netfabb.com/downloadcenter.php?basic=1" | grep pikey)
  pikey="${pikey#*pikey=}"
  export pikey="${pikey%%\">*}"
  [ -z "$pikey" ] && error "Fetching pikey has failed" && exit 1
  msg2 "pikey: $pikey"
fi

source=("netfabb-basic_${pkgver}_linux${nARCH}.tar.gz::http://www.netfabb.com/download.php?pikey=${pikey}")


prepare() {
  cd "$srcdir/$pkgname"
  sed -i -E "/(echo)/!s#/usr#$pkgdir/usr#" install.sh
  sed -i "/echo/ s#>/usr/bin/netfabb-basic#>$pkgdir/usr/bin/netfabb-basic#" install.sh
  sed -i '/uninstall/d' install.sh
}

package () {
  cd "$srcdir/$pkgname"
  ./install.sh
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  cp "$pkgdir/usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/"
}
