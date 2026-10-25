# Maintainer: Aaron Bockelie <aaron@bockelie.com>
# namcap reports ELF files outside of a valid path ('opt/'). The driver resolves the printer model from its
# own path under /opt/brother/Printers/, so the tree stays in /opt.
# The Brother printer drivers are proprietary and are distributed as RPM or DEB.
pkgname=brother-hl-l2370dw
pkgver=4.0.0
_rpmrel=2
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother HL-L2370DW"
arch=("i686" "x86_64" "armv7h")
url="https://support.brother.com/g/b/downloadlist.aspx?c=us&lang=en&prod=hll2370dw_us&os=127"
license=('LicenseRef-Brother Industries Ltd EULA' 'GPL-2.0-or-later')
depends=('cups' 'ghostscript' 'perl')
options=('!debug' '!strip')
install="$pkgname.install"
source=("https://download.brother.com/welcome/dlf103582/hll2370dwpdrv-$pkgver-$_rpmrel.i386.rpm")
sha256sums=('7c630d05b6da4b4afdc91655f755575c2d46ba09f53ab40815bd3e275ff2a61a')

package() {
  local _model=HLL2370DW
  local _base="/opt/brother/Printers/$_model"
  local _arch="$CARCH"
  [[ $_arch == armv7h ]] && _arch=armv7l

  cp -R "$srcdir/opt" "$pkgdir/opt"
  # Keep only the binaries for this architecture
  find "$pkgdir$_base/lpd" -mindepth 1 -maxdepth 1 -type d ! -name "$_arch" -exec rm -r {} +

  # The RPM postinstall links the binaries for the running architecture into lpd/
  ln -s "$_base/lpd/$_arch/rawtobr3" "$pkgdir$_base/lpd/rawtobr3"
  ln -s "$_base/lpd/$_arch/brprintconflsr3" "$pkgdir$_base/lpd/brprintconflsr3"

  # Settings tool wrapper the RPM postinstall writes to /usr/bin
  install -d "$pkgdir/usr/bin"
  printf '#!/bin/sh\nexec %s/lpd/brprintconflsr3 -P %s "$@"\n' "$_base" "$_model" > "$pkgdir/usr/bin/brprintconflsr3_$_model"
  chmod 755 "$pkgdir/usr/bin/brprintconflsr3_$_model"

  install -d "$pkgdir/etc/opt/brother/Printers/$_model/inf"
  ln -s "$_base/inf/br${_model}rc" "$pkgdir/etc/opt/brother/Printers/$_model/inf/br${_model}rc"

  # CUPS filter; lpdwrapper derives the model name from the symlink target
  install -d "$pkgdir/usr/lib/cups/filter"
  ln -s "$_base/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_$_model"

  install -d "$pkgdir/usr/share/cups/model"
  ln -s "$_base/cupswrapper/brother-$_model-cups-en.ppd" "$pkgdir/usr/share/cups/model/brother-$_model-cups-en.ppd"

  install -Dm644 "$srcdir$_base/LICENSE_ENG.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
  install -Dm644 "$srcdir$_base/LICENSE_JPN.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"
  install -Dm644 "$srcdir$_base/cupswrapper/Copying" "$pkgdir/usr/share/licenses/$pkgname/cupswrapper-GPL.txt"
}
