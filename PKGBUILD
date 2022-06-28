# Maintainer: Philipp Uhl <philipp.uhl@rwth-aachen.de>
# based on https://aur.archlinux.org/packages/brother-mfc-l2750dw/
pkgname='brother-mfc-l5700-dn'
pkgver='3.5.1'
pkgrel=1
pkgdesc='LPR and CUPS driver for the Brother MFC-L5700DN'
url='http://solutions.brother.com/linux/en_us/'
arch=('i686' 'x86_64')
license=('custom:Brother commercial license')
depends=('cups')
depends_x86_64=('lib32-glibc')
install="$pkgname.install"
source=(
    "https://download.brother.com/welcome/dlf102599/mfcl5700dnlpr-$pkgver-$pkgrel.i386.rpm"
    "https://download.brother.com/welcome/dlf102600/mfcl5700dncupswrapper-$pkgver-$pkgrel.i386.rpm"
)

package() {
  _model="MFCL5700DN"

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
sha256sums=('0a71cc1d4f8e96e03044ebfb34106912af36740f32e159ada82d9de4807252fa')
sha256sums=('0a71cc1d4f8e96e03044ebfb34106912af36740f32e159ada82d9de4807252fa'
            '3c5a02d44e99e2b93009bc6b692f8f3f060d097f7b69a330a1c6ef81fc07425c')
