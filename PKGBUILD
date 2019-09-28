# Maintainer: Sergio de la Cruz <sergiod dot lc at gmail dot com>

pkgname=brother-hl2280dw
pkgver=2.1.0_1
pkgrel=2
pkgdesc="Brother HL-2280DW CUPS Driver"
arch=('i686' 'x86_64')
url='http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html'
license=('GPL')
depends=('a2ps' 'cups')
source=("http://www.brother.com/pub/bsc/linux/dlf/hl2280dwlpr-${pkgver//_/-}.i386.rpm"
        "http://www.brother.com/pub/bsc/linux/dlf/cupswrapperHL2280DW-2.0.4-2.i386.rpm")
md5sums=('efa44d4acc0e62633e2d742e445b811a'
         'b687b69f530275de86d71cbc46352413')

if [[ "$CARCH" == "x86_64" ]]; then
  depends+=('lib32-glibc')
fi

package() {
  _cupswrapperFile="$srcdir/usr/local/Brother/Printer/HL2280DW/cupswrapper/cupswrapperHL2280DW-2.0.4"

  # Ignore everything after the PPD file
  sed -i -e '/^!ENDOFWFILTER!/ q' "${_cupswrapperFile}"
  sed -i -e 's#/usr#$srcdir/usr#' "${_cupswrapperFile}"

  sed -i -e 's#/usr/local#/usr/share#' "$srcdir/usr/local/Brother/Printer/HL2280DW/lpd/filterHL2280DW"

  mkdir -p "$srcdir/usr/share/cups/model/"

  # Run the install script to extract the PPD file
  . "${_cupswrapperFile}"

  # Remove unnecessary files
  rm "$srcdir/usr/local/Brother/Printer/HL2280DW/inf/setupPrintcap2"
  rm "${_cupswrapperFile}"

  # Change the PPD description to match other listing for Brother printers in CUPS
  sed -i -e 's/Brother HL2280DW for CUPS/Brother HL-2280DW/' "$srcdir/usr/share/cups/model/HL2280DW.ppd"

  # Replace references to $srcdir
  sed -i -e "s#$srcdir/usr#/usr#" "$srcdir/usr/lib/cups/filter/brlpdwrapperHL2280DW"
  sed -i -e "s#/usr/local#/usr/share#" "$srcdir/usr/lib/cups/filter/brlpdwrapperHL2280DW"

  chmod +x "$srcdir/usr/lib/cups/filter/brlpdwrapperHL2280DW"

  # Change the path for pstops
  sed -i -e "s#/usr/sbin/pstops#/usr/lib/cups/filter/pstops#" "$srcdir/usr/local/Brother/Printer/HL2280DW/lpd/psconvert2"
  sed -i -e "s#/usr/bin/pstops#/usr/lib/cups/filter/pstops#" "$srcdir/usr/local/Brother/Printer/HL2280DW/lpd/filterHL2280DW"

  # Change some hardcoded paths in the binaries (source code is available for
  # one but not the others, so I figure I'll just hack the changes for all)
  sed -i -e "s#/usr/local/#/usr/share/#g" "$srcdir/usr/local/Brother/Printer/HL2280DW/cupswrapper/brcupsconfig4"
  sed -i -e "s#/usr/local/#/usr/share/#g" "$srcdir/usr/local/Brother/Printer/HL2280DW/inf/brprintconflsr3"
  sed -i -e "s#/usr/local/#/usr/share/#g" "$srcdir/usr/local/Brother/Printer/HL2280DW/inf/braddprinter"

  # Copy the src tree into the pkg tree
  cp -R "$srcdir/usr/" "$pkgdir/"
  cp -R "$srcdir/var/" "$pkgdir/"

  mv "$pkgdir/usr/local/Brother" "$pkgdir/usr/share/"
  rmdir "$pkgdir/usr/local"

  chmod a+w "$pkgdir/usr/share/Brother/Printer/HL2280DW/inf/brHL2280DWrc"
}

# vim:set ts=2 sw=2 et:
