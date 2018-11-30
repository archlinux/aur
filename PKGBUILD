# Submitter: voidptr <aur at voidptr dot net>
# Contributor: Andrew Hacking <ahacking at gmail>
# Maintainer: Tom Wasiluk <tomasz at wasil dot uk>
# Co-maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>

_model='9340cdw'
pkgname=brother-mfc-${_model}
pkgver=1.1.2_1
pkgrel=2
_cupswrapper_ver='1.1.4-0'
pkgdesc='LPR and CUPS driver for the Brother MFC-9340CDW'
url='http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html'
arch=(i686 x86_64)
license=('custom:Brother commercial license' GPL2)
install=brother-mfc-${_model}.install
depends=(cups ghostscript a2ps)
depends_x86_64=(lib32-glibc)

source=("http://www.brother.com/pub/bsc/linux/dlf/mfc${_model}lpr-${pkgver//_/-}.i386.rpm"
        "https://download.brother.com/welcome/dlf007028/mfc9340cdwcupswrapper-${_cupswrapper_ver}.i386.rpm"
        'lpr-license.txt')
sha256sums=('f0ef7debe2ce49624c9fed63f5338267195430577afe1e97bdfb14bb35a325b1'
            '4290e37fa83cf2ad31e83fdf1a44e22fd7df4149fbda994bc930f201c1457e05'
            '9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67')

prepare() {
  install -d usr/share/cups/model usr/lib/cups/filter
  wrapper=opt/brother/Printers/mfc${_model}/cupswrapper/cupswrappermfc${_model}
  sed -i '/^ *lpadmin/d;/^sleep/Q' "$wrapper"
  perl -i -spe 's#/(usr|opt)#$srcdir/$1#g;s#/model/Brother#/model#g' -- -srcdir="$srcdir" "$wrapper"
  ./"$wrapper"
  rm "$wrapper"
  perl -i -spe 's/$srcdir//' -- -srcdir="$srcdir" usr/lib/cups/filter/*lpdwrapper*

  rm opt/brother/Printers/mfc${_model}/cupswrapper/brother_mfc9340cdw_printer_en.ppd
  # /etc/printcap is managed by cups
  rm opt/brother/Printers/mfc9340cdw/inf/setupPrintcap*
}

package() {
  cp -R  usr/ opt/ "${pkgdir}/"
  install -Dm644 lpr-license.txt "${pkgdir}/usr/share/licenses/${pkgname}/lpr-license.txt"
}
