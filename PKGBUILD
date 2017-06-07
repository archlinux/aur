# Maintainer: Jonas Schulz <jonas.schulz.12+hl3152cdw@gmail.com>
pkgname='brother-hl3152cdw'
pkgver=1.1.4
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="LPR and CUPS driver for the Brother HL-3152CDW"
url='http://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=hl3152cdw_us_as'
license=('GPL version 2 for CUPS driver, custom:brother commercial license for LPR driver.')
depends=('cups')
depends_x86_64=('lib32-glibc')
install='brother-hl3152cdw.install'
source=(
  'brother-hl3152cdw.patch'
  'lpr-license.txt'
  'http://download.brother.com/welcome/dlf101634/hl3152cdwlpr-1.1.3-0.i386.rpm'
  'http://download.brother.com/welcome/dlf101635/hl3152cdwcupswrapper-1.1.4-0.i386.rpm'
)
sha256sums=(
  '9183b43014318d356862356ca0b4fd86282ba6a5041457663d8076c0dd3f6ee6'
  '3f23d4289888ef7ab2df0364f166cdb5da1849623b0b0c78665e12b73bc363d2'
  '13986ca042f424dd8b37eb09bdba37f6f9ef59b5fdb4deb56f23d87c885da11a'
  '99629e92d774e54f6739d8c01e014574942e012509be03f7bd833076712ed206'
)

prepare() {
  cd "$srcdir/opt/" || return 1
  patch -p1 < ../brother-hl3152cdw.patch

  cd "$srcdir" || return 1
  "$srcdir/opt/brother/Printers/hl3152cdw/cupswrapper/cupswrapperhl3152cdw"
}

package() {
  # Copy everything over.
  # Unfortunately, we can't place files according to Arch packaging guidelines,
  # as several programs in the driver use "/opt/brother/Printers/hl3152cdw/..."
  # hard-coded paths.
  # Short of binary patching the drivers (which seems flaky), there's not much
  # we can do.
  cp -a "$srcdir/opt" "$srcdir/usr" "$pkgdir"

  # Strip out the script we just ran and the PPD
  rm "$pkgdir/opt/brother/Printers/hl3152cdw/cupswrapper/cupswrapperhl3152cdw"
  mv "$pkgdir/opt/brother/Printers/hl3152cdw/cupswrapper/brother_hl3152cdw_printer_en.ppd" ppd_file

  # Install the PPD, the filter, and the license.
  install -m 644 -D ppd_file "$pkgdir/usr/share/cups/model/brother_hl3152cdw_printer_en.ppd"
  install -m 755 -D wrapper "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_hl3152cdw"
  install -Dm644 lpr-license.txt "$pkgdir/usr/share/licenses/brother/lpr-licence.txt"
}
