# Maintainer: Matt Kline <matt at bitbashing dot io>
pkgname='brother-hl3180cdw'
pkgver=1.1.4
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="LPR and CUPS driver for the Brother HL-3180CDW"
url='http://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=hl3180cdw_us_as'
license=('GPL version 2 for CUPS driver, custom:brother commercial license for LPR driver.')
depends=('cups')
depends_x86_64=('lib32-glibc')
install='brother-hl3180cdw.install'
source=(
  'brother-hl3180cdw.patch'
  'lpr-license.txt'
  'http://download.brother.com/welcome/dlf102680/hl3180cdwlpr-1.1.3-0.i386.rpm'
  'http://download.brother.com/welcome/dlf102681/hl3180cdwcupswrapper-1.1.4-0.i386.rpm'
)
sha256sums=(
  'b7b516c28647290a25d4f448096fcb3f7c07c193f7781634fc19a17f8998c92b'
  '3f23d4289888ef7ab2df0364f166cdb5da1849623b0b0c78665e12b73bc363d2'
  '088a42165cb8f094d3264b2637e5aea6c6d4b56e96a3bc1b16f161052163d0fd'
  'a8c108b9b8df43d0bb3daea114a515bd2216f06da544b39c38005b8a4e565cc5'
)

prepare() {
  cd "$srcdir/opt/" || return 1
  patch -p1 < ../brother-hl3180cdw.patch

  cd "$srcdir" || return 1
  "$srcdir/opt/brother/Printers/hl3180cdw/cupswrapper/cupswrapperhl3180cdw"
}

package() {
  # Copy everything over.
  # Unfortunately, we can't place files according to Arch packaging guidelines,
  # as several programs in the driver use "/opt/brother/Printers/hl3180cdw/..."
  # hard-coded paths.
  # Short of binary patching the drivers (which seems flaky), there's not much
  # we can do.
  cp -a "$srcdir/opt" "$srcdir/usr" "$pkgdir"

  # Strip out the script we just ran and the PPD
  rm "$pkgdir/opt/brother/Printers/hl3180cdw/cupswrapper/cupswrapperhl3180cdw"
  mv "$pkgdir/opt/brother/Printers/hl3180cdw/cupswrapper/brother_hl3180cdw_printer_en.ppd" ppd_file

  # Install the PPD, the filter, and the license.
  install -m 644 -D ppd_file "$pkgdir/usr/share/cups/model/brother_hl3180cdw_printer_en.ppd"
  install -m 755 -D wrapper "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_hl3180cdw"
  install -Dm644 lpr-license.txt "$pkgdir/usr/share/licenses/brother/lpr-licence.txt"
}
