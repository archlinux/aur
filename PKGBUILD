# Maintainer: ave <ave.zone>
# Based on <https://aur.archlinux.org/packages/brother-mfc-l2820dw>
pkgname=brother-mfc-l2800dw
pkgver=4.1.0
pkgrel=1
pkgdesc='LPR and CUPS driver for the Brother MFC-L2800DW'
# nl because 38c3 geolocation :(
url=https://www.brother.nl/ondersteuning/mfc-l2800dw/downloads
arch=(i686 x86_64)
license=('custom:brother commercial license')
depends=(cups)
depends_x86_64=(lib32-glibc)
install=$pkgname.install
source=(http://download.brother.com/welcome/dlf106049/mfcl2800dwpdrv-$pkgver-$pkgrel.i386.rpm)
sha1sums=(d72d121ebc2f0769d229284fdb29b829ee937741)

package() {
  local -r model=MFCL2800DW
  local -r basedir=/usr/share/brother/Printers/$model

  # using `/usr/share` instead of `/opt`
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
  sed -i 's|/opt|/usr|' "$pkgdir/$basedir/cupswrapper/lpdwrapper"
  sed -i 's|/opt|/usr|' "$pkgdir/$basedir/lpd/lpdfilter"

  # CUPS manages `/etc/printcap`
  find "$pkgdir" -type f -name 'setupPrintcap*' -delete

  # symbolic link for `lpdwrapper` so it correctly figures out the
  # printer model from the path
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "$basedir/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_$model"

  # symlink for the PPD
  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "$basedir/cupswrapper/brother-$model-cups-en.ppd" "$pkgdir/usr/share/cups/model/"

  # a couple architecture-specific symbolic links
  ln -s "$basedir/lpd/$CARCH/brprintconflsr3" "$pkgdir/$basedir/lpd/"
  ln -s "$basedir/lpd/$CARCH/rawtobr3" "$pkgdir/$basedir/lpd/"

  # symlink for `inf` because it tries to execute it there
  rmdir "$pkgdir/$basedir/lpd/inf"
  ln -s "$basedir/inf" "$pkgdir/$basedir/lpd/"
}

