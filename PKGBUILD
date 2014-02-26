# Maintainer: Swift Geek <swifgeek ɐŧ google bøt cøm>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>

# TODO: move libs to lib32 ?
# User lib32-gtk2 properly

pkgname=netfabb-basic
pkgver=5.1.0
pkgrel=1
pkgdesc="view and repair STL files"
arch=('i686' 'x86_64')
url="http://www.netfabb.com/download.php"
license=('custom:freeware')
depends=('gtk2' 'desktop-file-utils' 'hicolor-icon-theme')
install='netfabb-basic.install'

md5sums=('10b53ba2e5a9f40dd61051d9abf14d8c') # 32-bit
nARCH=32
if [ "$CARCH" == x86_64 ] ; then
   md5sums=('e8037bd5db76806e72a239418509e5bc') # 64-bit
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

source=("netfabb-basic_${pkgver}_linux${nARCH}.tar.gz::http://www.netfabb.com/download.php?pikey=$pikey")


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
