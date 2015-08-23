# Maintainer: Kim Rasmussen <rasmussen74 .. gmail . com>
# Derived from:  brother-hl2270dw

pkgname=brother-hl2250dn
pkgver=2.0.4_2
pkgrel=4
pkgdesc="Brother HL-2250DN CUPS Driver"
arch=('i686' 'x86_64')
url='http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html'
license=('GPL')
depends=('a2ps' 'cups')
source=("http://www.brother.com/pub/bsc/linux/dlf/hl2250dnlpr-2.1.0-1.i386.rpm"
        "http://www.brother.com/pub/bsc/linux/dlf/cupswrapperHL2250DN-${pkgver//_/-}.i386.rpm"
        "HL2250DN.ppd.patch")
md5sums=('53a55ce29a97262a99af8cc76a0d3cc8'
         '6d01f29dd0d4d1366bb0e701744f9cd5'
         '7c701d586af8dac410cce86678ddfe96')

if [[ "$CARCH" == "x86_64" ]]; then
  depends+=('lib32-glibc')
fi

package() {
  _cupswrapperFile="$srcdir/usr/local/Brother/Printer/HL2250DN/cupswrapper/cupswrapperHL2250DN-2.0.4"

  # Ignore everything after the PPD file
  sed -i -e '/^!ENDOFWFILTER!/ q' "${_cupswrapperFile}"
  sed -i -e 's#/usr#$srcdir/usr#' "${_cupswrapperFile}"

  sed -i -e 's#/usr/local#/usr/share#' "$srcdir/usr/local/Brother/Printer/HL2250DN/lpd/filterHL2250DN"

  mkdir -p "$srcdir/usr/share/cups/model/"
  
  # Run the install script to extract the PPD file
  . "${_cupswrapperFile}"

  # Remove unnecessary files
  rm "$srcdir/usr/local/Brother/Printer/HL2250DN/inf/setupPrintcap2"
  rm "${_cupswrapperFile}"

  # Change the PPD description to match other listing for Brother printers in CUPS
  sed -i -e 's/Brother HL2250DN for CUPS/Brother HL-2250DN/' "$srcdir/usr/share/cups/model/HL2250DN.ppd"

  # Add margin correction (alignmargins output: https://wiki.linuxfoundation.org/en/OpenPrinting/Database/CUPSDocumentation)
  patch "$srcdir/usr/share/cups/model/HL2250DN.ppd" < "$srcdir/../HL2250DN.ppd.patch"

  # Replace references to $srcdir
  sed -i -e "s#$srcdir/usr#/usr#" "$srcdir/usr/lib/cups/filter/brlpdwrapperHL2250DN"
  sed -i -e "s#/usr/local#/usr/share#" "$srcdir/usr/lib/cups/filter/brlpdwrapperHL2250DN"

  chmod +x "$srcdir/usr/lib/cups/filter/brlpdwrapperHL2250DN"

  # Change the path for pstops
  sed -i -e "s#/usr/sbin/pstops#/usr/lib/cups/filter/pstops#" "$srcdir/usr/local/Brother/Printer/HL2250DN/lpd/psconvert2"
  sed -i -e "s#/usr/bin/pstops#/usr/lib/cups/filter/pstops#" "$srcdir/usr/local/Brother/Printer/HL2250DN/lpd/filterHL2250DN"

  # Change some hardcoded paths in the binaries (source code is available for
  # one but not the others, so I figure I'll just hack the changes for all)
  sed -i -e "s#/usr/local/#/usr/share/#g" "$srcdir/usr/local/Brother/Printer/HL2250DN/cupswrapper/brcupsconfig4"
  sed -i -e "s#/usr/local/#/usr/share/#g" "$srcdir/usr/local/Brother/Printer/HL2250DN/inf/brprintconflsr3"
  sed -i -e "s#/usr/local/#/usr/share/#g" "$srcdir/usr/local/Brother/Printer/HL2250DN/inf/braddprinter"

  # Copy the src tree into the pkg tree
  cp -R "$srcdir/usr/" "$pkgdir/"
  cp -R "$srcdir/var/" "$pkgdir/"

  mv "$pkgdir/usr/local/Brother" "$pkgdir/usr/share/"
  rmdir "$pkgdir/usr/local"

  chmod a+w "$pkgdir/usr/share/Brother/Printer/HL2250DN/inf/brHL2250DNrc"
}

# vim:set ts=2 sw=2 et:
