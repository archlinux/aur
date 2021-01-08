# Maintainer: cyberdork33 <cyberdork33@gmail.com>
# based on https://aur.archlinux.org/packages/brother-mfc-l2710dw/
pkgname='brother-mfc-l2717dw'
pkgver='4.0.0'
pkgrel=1
pkgdesc='Driver for the Brother MFC-L2717DW'
url='https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfcl2717dw_us'
arch=('i686' 'x86_64')
license=('EULA')
depends=('cups')
depends_x86_64=('lib32-glibc')
install="$pkgname.install"
source=("https://download.brother.com/welcome/dlf104660/mfcl2717dwpdrv-$pkgver-$pkgrel.i386.rpm")
sha256sums=('64312120786ca514e5925383e3c83957b9ea434918fe5a057f7c71a11579a9d4')

package() {
  _model="MFCL2717DW"

  # using /usr/share instead of /opt
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/$_model/cupswrapper/lpdwrapper"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/$_model/lpd/lpdfilter"

  # /etc/printcap is managed by cups
  find "$pkgdir" -type f -name 'setupPrintcap*' -delete

  # symlink for lpdwrapper so it correctly figures out the printer model from the path
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/usr/share/brother/Printers/$_model/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_$_model"

  # symlink for the PPD
  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/usr/share/brother/Printers/$_model/cupswrapper/brother-$_model-cups-en.ppd" "$pkgdir/usr/share/cups/model/"

  # a couple architecture-specific symlinks
  ln -s "/usr/share/brother/Printers/$_model/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/$_model/lpd/"
  ln -s "/usr/share/brother/Printers/$_model/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/$_model/lpd/"

  # symlink for inf because it tries to execute it there
  ln -s "/usr/share/brother/Printers/$_model/inf" "$pkgdir/usr/share/brother/Printers/$_model/lpd/"
}

