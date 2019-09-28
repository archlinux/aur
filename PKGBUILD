# Maintainer: Patrick Stewart <patstew@gmail.com>
# Adapted from brother-hl8350cdw by giulio
pkgname="brother-hl-l8260cdw"
pkgver="1.4.0"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother HL-L8260CDW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups' 'perl')
install='brother-hl-l8260cdw.install'
source=(
  "https://download.brother.com/welcome/dlf103219/hll8260cdwcupswrapper-1.4.0-0.i386.rpm"
  "https://download.brother.com/welcome/dlf103210/hll8260cdwlpr-1.3.0-0.i386.rpm"
  'cupswrapper-license.txt'
  'lpr-license.txt'
)
md5sums=('eb31172be5c180a11e4d3804e5742c10'
         'e54df89a71579da8c874aa0e1480cb5b'
         '97ad0cffd216059e9d1d3121899d8646'
         '5e87a3dc0f3e3438c088eda0f3565f0d')
if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi

package() {
  printer_model=hll8260cdw
  ppd_file=/opt/brother/Printers/${printer_model}/cupswrapper/brother_${printer_model}_printer_en.ppd
  lpd_file=/opt/brother/Printers/${printer_model}/cupswrapper/brother_lpdwrapper_${printer_model}

  cp -R $srcdir/usr $pkgdir
  cp -R $srcdir/opt $pkgdir
  
  install -d $pkgdir/usr/share/ppd
  ln -s ${ppd_file} $pkgdir/usr/share/ppd/brother_${printer_model}_printer_en.ppd
  install -d $pkgdir/usr/share/cups/model
  ln -s ${ppd_file} $pkgdir/usr/share/cups/model/brother_${printer_model}_printer_en.ppd
  install -d $pkgdir/usr/lib/cups/filter
  ln -s ${lpd_file} $pkgdir/usr/lib/cups/filter/brother_lpdwrapper_${printer_model}

  install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
  install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}
