# Maintainer: Matt Kline <matt@bitbashing.io>
pkgname='brother-hl3180cdw'
pkgver=1.1.4
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother HL-3180CDW"
arch=('any')
url='http://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=hl3180cdw_us_as'
license=('GPL version 2 for CUPS driver, custom:brother commercial license for LPR driver.')
depends=('cups')
arch=('i686' 'x86_64')
depends_x86_64=('lib32-glibc')
install='brother-hl3180cdw.install'
source=(
  'brother-hl3180cdw.patch'
  'lpr-license.txt'
  'http://download.brother.com/welcome/dlf102680/hl3180cdwlpr-1.1.3-0.i386.rpm'
  'http://download.brother.com/welcome/dlf102681/hl3180cdwcupswrapper-1.1.4-0.i386.rpm'
)
md5sums=('14bd3e7abdc7783b6c7ad2ced3707b8c'
         '80407224bc8f4b5656de6271144f9e19'
         '1b34a004a808e7149419e04e8a31d5c3'
         'faf5cd7771c5ef0939d0e37fd16506d6')

prepare() {
  cd "$srcdir/opt/" || return 1
  patch -p1 < ../brother-hl3180cdw.patch
  # Replace /opt/brother/Printers/ with /usr/share/brother
  cd "$srcdir/opt/brother/Printers/hl3180cdw" || return 1
  sed -i 's%opt/brother/\(Printers\|${device_model}\)%usr/share/brother%g' \
    cupswrapper/cupswrapperhl3180cdw inf/setupPrintcapij lpd/filterhl3180cdw

  cd "$srcdir" || return 1
  "$srcdir/opt/brother/Printers/hl3180cdw/cupswrapper/cupswrapperhl3180cdw"
}

package() {
  # Copy over drivers and cups wrapper files
  mkdir -p "$pkgdir/usr/share"
  cp -r "$srcdir/opt/brother/Printers" "$pkgdir/usr/share/brother"
  # Strip out the script we just ran and the PPD
  rm "$pkgdir/usr/share/brother/hl3180cdw/cupswrapper/cupswrapperhl3180cdw"
  mv "$pkgdir/usr/share/brother/hl3180cdw/cupswrapper/brother_hl3180cdw_printer_en.ppd" ppd_file
  # Install the PPD, the filter, and the license.
  install -m 644 -D ppd_file "$pkgdir/usr/share/cups/model/brother_hl3180cdw_printer_en.ppd"
  install -m 755 -D wrapper "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_hl3180cdw"
  install -Dm644 lpr-license.txt "$pkgdir/usr/share/licenses/brother/lpr-licence.txt"
}
