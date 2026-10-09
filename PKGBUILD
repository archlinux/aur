# Maintainer: Aaron Bockelie <aaron@bockelie.com>
# namcap reports ELF files outside of a valid path ('opt/'). This is true, however most brother AUR packages are structured this way.
# The Brother printer drivers are proprietary and are distributed as RPM or DEB.
pkgname=brother-hl-l3295cdw
pkgver=3.5.1
_rpmrel=2
pkgrel=2
pkgdesc="LPR and CUPS driver for the Brother HL-L3295CDW"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/downloadlist.aspx?c=us&lang=en&prod=hll3295cdw_us&os=127"
license=('LicenseRef-Brother Industries Ltd EULA')
depends=('cups' 'ghostscript' 'perl')
options=('!debug' '!strip')
install="$pkgname.install"
source=(
  "https://download.brother.com/welcome/dlf105748/hll3295cdwpdrv-$pkgver-$_rpmrel.i386.rpm"
  "cupswrapper-license.txt"
  "lpr-license.txt"
)
sha256sums=(
  'bd49b0a0d0e5d90264b03232c4ec53f845f5d5e0929cc39ee7f7e85f48e616ca'
  '2c6aa6a641332e5c87e971ac2a8beae13b059747bdba331bbd515914770d72d9'
  '9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67'
)

prepare() {
  # install is creating the directories for the symlinks in all cases except for the license files.
  install -d "$srcdir/usr/share/cups/model"
  install -d "$srcdir/usr/lib/cups/filter"
}

package(){
  # Extract the RPM
  cp -R "$srcdir/opt" "$pkgdir/opt"
  # Keep only the binaries for this architecture
  find "$pkgdir/opt/brother/Printers/hll3295cdw/lpd" -mindepth 1 -maxdepth 1 -type d ! -name "$CARCH" -exec rm -r {} +
  # Extract the lpd filter and config files based on the $CARCH variable - i686 or x86_64
  ln -s "/opt/brother/Printers/hll3295cdw/lpd/$CARCH/brhll3295cdwfilter" "$pkgdir/opt/brother/Printers/hll3295cdw/lpd/brhll3295cdwfilter"
  ln -s "/opt/brother/Printers/hll3295cdw/lpd/$CARCH/brprintconf_hll3295cdw" "$pkgdir/opt/brother/Printers/hll3295cdw/lpd/brprintconf_hll3295cdw"
  
  # Create the symlinks in the /usr/bin directory for the executable processors
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/brother/Printers/hll3295cdw/lpd/$CARCH/brhll3295cdwfilter" "$pkgdir/usr/bin/brhll3295cdwfilter"
  ln -s "/opt/brother/Printers/hll3295cdw/lpd/$CARCH/brprintconf_hll3295cdw" "$pkgdir/usr/bin/brprintconf_hll3295cdw"

  # Create the symlinks in the /usr/lib/cups/filter directory for the CUPS filter
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/opt/brother/Printers/hll3295cdw/cupswrapper/brother_lpdwrapper_hll3295cdw" "$pkgdir/usr/lib/cups/filter"

  # Create the symlink in the /usr/share/cups/model directory for the PPD file
  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/opt/brother/Printers/hll3295cdw/cupswrapper/brother_hll3295cdw_printer_en.ppd" "$pkgdir/usr/share/cups/model"

  # Directly Install the license files
  install -Dm644 "$srcdir/opt/brother/Printers/hll3295cdw/LICENSE_ENG.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
  install -Dm644 "$srcdir/opt/brother/Printers/hll3295cdw/LICENSE_JPN.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"
}