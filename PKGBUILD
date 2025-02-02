# Maintainer: pfrenssen <pieter@frenssen.be>
# Based on <https://aur.archlinux.org/packages/brother-mfc-l2800dw>
pkgname=brother-mfc-l5710dw
pkgver=4.0.3
pkgrel=1
pkgdesc='LPR and CUPS driver for the Brother MFC-L5710DW'
url=https://support.brother.com/g/b/downloadlist.aspx?c=us_ot&lang=en&prod=mfcl5710dw_us_eu_as&os=128
arch=(i686 x86_64)
license=('custom:brother commercial license')
depends=(cups)
depends_x86_64=(lib32-glibc)
optdepends=('brscan5')
install=$pkgname.install
source=(https://download.brother.com/welcome/dlf105855/mfcl5710dwpdrv-$pkgver-$pkgrel.i386.rpm)

sha1sums=(9af8edd5d2f8d2e6d9e8486c1bc7928bf9016cc1)

package() {
  local -r model=MFCL5710DW
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

