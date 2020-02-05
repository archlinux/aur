# Submitter: voidptr <aur at voidptr dot net>
# Contributor: Andrew Hacking <ahacking at gmail>
# Maintainer: Tom Wasiluk <tomasz at wasil dot uk>
# Co-maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>

_model='9342cdw'
pkgname=brother-mfc-${_model}
pkgver=1.1.3_0
pkgrel=0
_cupswrapper_ver='1.1.4-0'
#https://download.brother.com/welcome/dlf101624/mfc9342cdwlpr-1.1.3-0.i386.deb
pkgdesc='LPR and CUPS driver for the Brother MFC-9342CDW'
url='http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html'
arch=(i686 x86_64)
license=('custom:Brother commercial license' GPL2)
install=brother-mfc-${_model}.install
depends=(cups ghostscript a2ps)
depends_x86_64=(lib32-glibc)

source=("https://download.brother.com/welcome/dlf101626/mfc${_model}lpr-${pkgver//_/-}.i386.rpm"
        "https://download.brother.com/welcome/dlf101627/mfc${_model}cupswrapper-${_cupswrapper_ver}.i386.rpm"
        'lpr-license.txt')
sha256sums=('66e0896c58bb073ccae6cffbbb0ef3cd21b9fdc20145e991f10b7809c003bde0'
            '67d8ba9fbb22c21b093951872f81fc3697023953f6c9f9e1ab9dcdd757df5239'
            '9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67')

prepare() {
  install -d usr/share/cups/model usr/lib/cups/filter
  wrapper=opt/brother/Printers/mfc${_model}/cupswrapper/cupswrappermfc${_model}
  sed -i '/^ *lpadmin/d;/^sleep/Q' "$wrapper"
  perl -i -spe 's#/(usr|opt)#$srcdir/$1#g;s#/model/Brother#/model#g' -- -srcdir="$srcdir" "$wrapper"
  ./"$wrapper"
  rm "$wrapper"
  perl -i -spe 's/$srcdir//' -- -srcdir="$srcdir" usr/lib/cups/filter/*lpdwrapper*

  rm opt/brother/Printers/mfc${_model}/cupswrapper/brother_mfc${_model}_printer_en.ppd
  # /etc/printcap is managed by cups
  rm opt/brother/Printers/mfc${_model}/inf/setupPrintcap*
}

package() {
  cp -R  usr/ opt/ "${pkgdir}/"
  install -Dm644 lpr-license.txt "${pkgdir}/usr/share/licenses/${pkgname}/lpr-license.txt"
}
