# Maintainer: Dovydas Ciomenas <icouldbreathe@icloud.com>

pkgname=brother-dcpt300
pkgver=3.0.2
pkgrel=1
pkgdesc="Brother DCP-T300 printer driver (CUPS + LPR)"
url="https://support.brother.com/g/b/faqtop.aspx?c=us_ot&lang=en&prod=dcpt300_all"
license=('LicenseRef-Brother')
arch=('i686' 'x86_64')

depends=('cups' 'ghostscript' 'perl' 'bash' 'a2ps')
depends_x86_64=('lib32-glibc' 'lib32-gcc-libs')

optdepends=(
  'sane: scanning support'
  'brscan4: making dcpt300 available to sane'
  'brscan-skey: scankey support if connected via usb'
)

install="brother-dcpt300.install"

_driver="dcpt300"
_debver="${pkgver}-0.i386"
_cups_deb="${_driver}cupswrapper-${_debver}.deb"
_lpr_deb="${_driver}lpr-${_debver}.deb"

source=(
  "https://download.brother.com/welcome/dlf101961/${_cups_deb}"
  "https://download.brother.com/welcome/dlf101960/${_lpr_deb}"
)
sha256sums=(
  'e356f4a0446e1a1362221b88903bb29061c4d051ac426c2c2bc2e896ca203960'
  'fb46231309028c037d852318677c19fa3ff91b2369014be68691be9102f65750'
)
noextract=("${_cups_deb}" "${_lpr_deb}")

package() {
  # Create directories
  install -d "$pkgdir/usr/share/cups/model/Brother" \
             "$pkgdir/usr/lib/cups/filter" \
             "$pkgdir/usr/bin"

  # Extract DEBs
  for _deb in "${_cups_deb}" "${_lpr_deb}"; do
    local _data_tar=$(ar t "$srcdir/${_deb}" | grep data.tar)
    ar p "$srcdir/${_deb}" "$_data_tar" | bsdtar -xf - -C "$pkgdir"
  done

  # Fix permissions
  if [ -d "$pkgdir/opt" ]; then
    chmod -R 755 "$pkgdir/opt"
  fi

  # Install PPD
  if [ -f "$pkgdir/opt/brother/Printers/${_driver}/cupswrapper/brother_${_driver}_printer_en.ppd" ]; then
    ln -s "/opt/brother/Printers/${_driver}/cupswrapper/brother_${_driver}_printer_en.ppd" \
          "$pkgdir/usr/share/cups/model/Brother/brother_${_driver}_printer_en.ppd"
  fi

  # Install helper binary symlink
  if [ -f "$pkgdir/opt/brother/Printers/${_driver}/cupswrapper/brcupsconfpt1" ]; then
      ln -s "/opt/brother/Printers/${_driver}/cupswrapper/brcupsconfpt1" "$pkgdir/usr/bin/brcupsconfpt1"
  fi

  # Create LPD wrapper
  install -Dm755 /dev/stdin "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_${_driver}" <<EOF
#!/bin/sh
#
# Brother Print filter wrapper
#
PRINTER="${_driver}"
PRINTER_NAME="DCP-T300"
RC_FILE="/opt/brother/Printers/\$PRINTER/inf/br\${PRINTER}rc"
LPD_FILTER="/opt/brother/Printers/\$PRINTER/lpd/filter\${PRINTER}"
CONF_TOOL="/opt/brother/Printers/\$PRINTER/cupswrapper/brcupsconfpt1"
PPD_FILE="/usr/share/cups/model/Brother/brother_\${PRINTER}_printer_en.ppd"

# Temporary config file
TEMP_RC="\$(mktemp /tmp/br\${PRINTER}rc_XXXXXX)"
cp "\$RC_FILE" "\$TEMP_RC"
chmod 600 "\$TEMP_RC"
export BRPRINTERRCFILE="\$TEMP_RC"

# Parse CUPS options
# This sed command maps CUPS options to Brother's internal format
CUPSOPTION=\$(echo "\$5 Copies=\$4" | sed -e 's/BrMirror=OFF/MirrorPrint=OFF/' \\
                                        -e 's/BrMirror=ON/MirrorPrint=ON/' \\
                                        -e 's/BrChain/Chain/' \\
                                        -e 's/BrBrightness/Brightness/' \\
                                        -e 's/BrContrast/Contrast/' \\
                                        -e 's/BrHalfCut/HalfCut/' \\
                                        -e 's/BrAutoTapeCut/AutoCut/' \\
                                        -e 's/BrHalftonePattern/Halftone/' \\
                                        -e 's/Binary/Binary/' \\
                                        -e 's/Dither/Dither/' \\
                                        -e 's/ErrorDiffusion/ErrorDiffusion/' \\
                                        -e 's/BrSheets/Sheets/' \\
                                        -e 's/multiple-document-handling/Collate/' \\
                                        -e 's/separate-documents-collated-copies/ON/' \\
                                        -e 's/separate-documents-uncollated-copies/OFF/')

# Update the temporary config file with job options
if [ -x "\$CONF_TOOL" ]; then
    "\$CONF_TOOL" "\$PRINTER_NAME" "\$PPD_FILE" 0 "\$CUPSOPTION" "\$PRINTER" "\$TEMP_RC" >/dev/null 2>&1
fi

# Run the actual filter
if [ -x "\$LPD_FILTER" ]; then
    cat | "\$LPD_FILTER"
fi

# Cleanup
rm -f "\$TEMP_RC"
EOF
}
