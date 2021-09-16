# Maintainer: Raman Budny <budnyjj@gmail.com>

pkgname=brother-dcp-b7500d
pkgver=1.0.0
pkgrel=1
pkgdesc="LPR and CUPS driver for Brother DCP-B7500D printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=in&lang=en&prod=dcpb7500d_as_cn"
license=("EULA")
groups=("base-devel")
optdepends=("brscan4: scanning support via sane"
            "brscan-skey: scankey support if connected via usb")

if [[ "$CARCH" == "x86_64" ]] ; then
    depends=('cups' 'lib32-glibc')
elif [[ "$CARCH" == "i686" ]] ; then
    depends=('a2ps' 'cups')
fi

source=("https://download.brother.com/welcome/dlf103650/dcpb7500dpdrv-4.0.0-1.i386.rpm")
md5sums=("86f952616ef5826ee9942445136c4615")
    
package() {
  # This package is based off of the brother-mfc-l2710dw package due to the identical packaging. All credit should go to enginefeeder101 for the script.
 _model="DCPB7500D"

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
