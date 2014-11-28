# Maintainer: Jonathan Doman <jonathan dot doman at gmail dot com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>

pkgname=brother-hl2270dw
pkgver=2.0.4_2
pkgrel=5
pkgdesc="Brother HL-2270DW CUPS Driver"
arch=('i686' 'x86_64')
url='http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html'
license=('GPL')
depends=('a2ps' 'cups')
source=("http://www.brother.com/pub/bsc/linux/dlf/hl2270dwlpr-2.1.0-1.i386.rpm"
        "http://www.brother.com/pub/bsc/linux/dlf/cupswrapperHL2270DW-${pkgver//_/-}.i386.rpm"
        "HL2270DW.ppd.patch")
md5sums=('69c1987c0636a64fb48f3c6826a3ae28'
         '5a7cc60cafaf60d722d9bce3f2751164'
         'de9cee3fed4afb1ee7f5516b5bac9f25')

if [[ "$CARCH" == "x86_64" ]]; then
  depends+=('lib32-glibc')
fi

package() {
  _cupswrapperFile="$srcdir/usr/local/Brother/Printer/HL2270DW/cupswrapper/cupswrapperHL2270DW-2.0.4"

  # Ignore everything after the PPD file
  sed -i -e '/^!ENDOFWFILTER!/ q' "${_cupswrapperFile}"
  sed -i -e 's#/usr#$srcdir/usr#' "${_cupswrapperFile}"

  sed -i -e 's#/usr/local#/usr/share#' "$srcdir/usr/local/Brother/Printer/HL2270DW/lpd/filterHL2270DW"

  mkdir -p "$srcdir/usr/share/cups/model/"
  
  # Run the install script to extract the PPD file
  . "${_cupswrapperFile}"

  # Remove unnecessary files
  rm "$srcdir/usr/local/Brother/Printer/HL2270DW/inf/setupPrintcap2"
  rm "${_cupswrapperFile}"

  # Change the PPD description to match other listing for Brother printers in CUPS
  sed -i -e 's/Brother HL2270DW for CUPS/Brother HL-2270DW/' "$srcdir/usr/share/cups/model/HL2270DW.ppd"

  # Add margin correction (alignmargins output: https://wiki.linuxfoundation.org/en/OpenPrinting/Database/CUPSDocumentation)
  patch "$srcdir/usr/share/cups/model/HL2270DW.ppd" < "$srcdir/HL2270DW.ppd.patch"

  # Replace references to $srcdir
  sed -i -e "s#$srcdir/usr#/usr#" "$srcdir/usr/lib/cups/filter/brlpdwrapperHL2270DW"
  sed -i -e "s#/usr/local#/usr/share#" "$srcdir/usr/lib/cups/filter/brlpdwrapperHL2270DW"

  chmod +x "$srcdir/usr/lib/cups/filter/brlpdwrapperHL2270DW"

  # Change the path for pstops
  sed -i -e "s#/usr/sbin/pstops#/usr/lib/cups/filter/pstops#" "$srcdir/usr/local/Brother/Printer/HL2270DW/lpd/psconvert2"
  sed -i -e "s#/usr/bin/pstops#/usr/lib/cups/filter/pstops#" "$srcdir/usr/local/Brother/Printer/HL2270DW/lpd/filterHL2270DW"

  # Change some hardcoded paths in the binaries (source code is available for
  # one but not the others, so I figure I'll just hack the changes for all)
  sed -i -e "s#/usr/local/#/usr/share/#g" "$srcdir/usr/local/Brother/Printer/HL2270DW/cupswrapper/brcupsconfig4"
  sed -i -e "s#/usr/local/#/usr/share/#g" "$srcdir/usr/local/Brother/Printer/HL2270DW/inf/brprintconflsr3"
  sed -i -e "s#/usr/local/#/usr/share/#g" "$srcdir/usr/local/Brother/Printer/HL2270DW/inf/braddprinter"

  # Copy the src tree into the pkg tree
  cp -R "$srcdir/usr/" "$pkgdir/"
  cp -R "$srcdir/var/" "$pkgdir/"

  mv "$pkgdir/usr/local/Brother" "$pkgdir/usr/share/"
  rmdir "$pkgdir/usr/local"

  chmod a+w "$pkgdir/usr/share/Brother/Printer/HL2270DW/inf/brHL2270DWrc"
}

# vim:set ts=2 sw=2 et:
