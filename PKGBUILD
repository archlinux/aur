# Maintainer: robertfoster
# Contributor: Engine Feeder <enginefeeder101@gmail.com>

pkgname='brother-mfc-l2710dw'
pkgver='4.0.0'
pkgrel=3
_srcrel=1
_model='MFCL2710DW'
pkgdesc='LPR and CUPS driver for the Brother MFC-L2710DW'
url='https://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=mfcl2710dw_us_eu_as'
arch=('i686' 'x86_64' 'armv7h')
license=('LicenseRef-Brother-EULA')
# lpdwrapper and lpdfilter are perl and shell out to `gs`; the ppd declares a
# cupsFilter for application/vnd.cups-postscript, which needs cups-filters
depends=('cups' 'cups-filters' 'ghostscript' 'perl')
# print-only package; the scanner (usb id 04f9:0434) is driven by brscan4,
# which enables it in models4/ext_20.ini -- brscan5 ships the same model
# commented out, so it is deliberately not referenced here
optdepends=('brscan4: scanner support'
            'brscan-skey: support for the scan key on the printer')
# prebuilt vendor binaries
options=('!strip')
install="$pkgname.install"
source=("https://download.brother.com/welcome/dlf103525/mfcl2710dwpdrv-$pkgver-$_srcrel.i386.rpm")
sha256sums=('8794c62d8481e8b2954e2b48815278731fea6510684b639608f66314438ada62')

package() {
  # the i386 rpm carries one binary directory per architecture
  local _binarch
  case "$CARCH" in
    armv7h) _binarch='armv7l' ;;
    *) _binarch="$CARCH" ;;
  esac

  # using /usr/share instead of /opt
  local _dir="usr/share/brother/Printers/$_model"
  install -d "$pkgdir/usr/share/brother/Printers"
  cp -a "$srcdir/opt/brother/Printers/$_model" "$pkgdir/$_dir"

  # both filters derive the printer name from their own path with an
  # s|^\/opt\/.*\/Printers\/|| regex
  sed -i 's|\\/opt\\/|\\/usr\\/|' \
    "$pkgdir/$_dir/cupswrapper/lpdwrapper" \
    "$pkgdir/$_dir/lpd/lpdfilter"

  # /etc/printcap is managed by cups
  rm "$pkgdir/$_dir/inf/setupPrintcap"

  # ship only the binaries for the architecture we are building for
  find "$pkgdir/$_dir/lpd" -mindepth 1 -maxdepth 1 -type d ! -name "$_binarch" \
    -exec rm -r {} +

  # lpdfilter and lpdwrapper look for these directly under lpd/
  ln -s "$_binarch/brprintconflsr3" "$pkgdir/$_dir/lpd/"
  ln -s "$_binarch/rawtobr3" "$pkgdir/$_dir/lpd/"
  # brprintconflsr3 resolves inf/ relative to its own directory
  ln -s '../inf' "$pkgdir/$_dir/lpd/inf"

  # the ppd names this filter; realpath() of it yields the model directory
  install -d "$pkgdir/usr/lib/cups/filter"
  ln -s "/$_dir/cupswrapper/lpdwrapper" \
    "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_$_model"

  install -d "$pkgdir/usr/share/cups/model"
  ln -s "/$_dir/cupswrapper/brother-$_model-cups-en.ppd" \
    "$pkgdir/usr/share/cups/model/"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$srcdir/opt/brother/Printers/$_model/LICENSE_ENG.txt" \
    "$srcdir/opt/brother/Printers/$_model/cupswrapper/Copying"
}
