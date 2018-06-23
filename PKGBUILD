# Maintainer: Manuel Kauschinger <jah-bru at bruzzzla dot de>
# Credits to Matt Kline for his initial package for Brother HL3180CDW
pkgname='brother-hl3172cdw'
pkgver=1.1.4
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="LPR and CUPS driver for the Brother HL-3172CDW"
url='http://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=hl3172cdw_us_as'
license=('GPL version 2 for CUPS driver, custom:brother commercial license for LPR driver.')
depends=('cups')
depends_x86_64=('lib32-glibc')
install='brother-hl3180cdw.install'
source=(
  'brother-hl3172cdw.patch'
  'lpr-license.txt'
  'http://download.brother.com/welcome/dlf101638/hl3172cdwlpr-1.1.3-0.i386.rpm'
  'http://download.brother.com/welcome/dlf101639/hl3172cdwcupswrapper-1.1.4-0.i386.rpm'
)
sha256sums=(
  '7fd25997d53271e66b6d4b46bd0539e62257de311b3946f9e791edc3cb44381d'
  '3f23d4289888ef7ab2df0364f166cdb5da1849623b0b0c78665e12b73bc363d2'
  'cec1afe21faefabfa787a3097264a2c8eb319fec8a292decae3f15bd62bc7566'
  'f6809299d4331d1d6e8b709139cbd38e881384cd9c05a9f5c5b80493da83ed98'
)

prepare() {
  cd "$srcdir/opt/" || return 1
  patch -p1 < ../brother-hl3172cdw.patch

  cd "$srcdir" || return 1
  "$srcdir/opt/brother/Printers/hl3172cdw/cupswrapper/cupswrapperhl3172cdw"
}

package() {
  # Copy everything over.
  # Unfortunately, we can't place files according to Arch packaging guidelines,
  # as several programs in the driver use "/opt/brother/Printers/hl3172cdw/..."
  # hard-coded paths.
  # Short of binary patching the drivers (which seems flaky), there's not much
  # we can do.
  cp -a "$srcdir/opt" "$srcdir/usr" "$pkgdir"

  # Strip out the script we just ran and the PPD
  rm "$pkgdir/opt/brother/Printers/hl3172cdw/cupswrapper/cupswrapperhl3172cdw"
  mv "$pkgdir/opt/brother/Printers/hl3172cdw/cupswrapper/brother_hl3172cdw_printer_en.ppd" ppd_file

  # Install the PPD, the filter, and the license.
  install -m 644 -D ppd_file "$pkgdir/usr/share/cups/model/brother_hl3172cdw_printer_en.ppd"
  install -m 755 -D wrapper "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_hl3172cdw"
  install -Dm644 lpr-license.txt "$pkgdir/usr/share/licenses/brother/lpr-licence.txt"
}

