# Maintainer: breezy <breezydnk@outlook.com>
pkgname="brother-dcp7180dn"
pkgver="3.2.0"
_pkgver="$pkgver-1"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother DCP7180DN"
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/downloadlist.aspx?c=cn_ot&lang=en&prod=dcp7180dn_cn&os=127"
license=('custom:brother commercial license')
_modelname="DCP7180DN"
depends=('cups')
optdepends=('brscan4: scanner support.')
install="$pkgname.install"
source=(
  "https://download.brother.com/welcome/dlf101782/dcp7180dncupswrapper-$_pkgver.i386.rpm"
  "https://download.brother.com/welcome/dlf101781/dcp7180dnlpr-$_pkgver.i386.rpm"
  'cupswrapper-license.txt'
  'lpr-license.txt'
)

sha256sums=(
  '43bbcd814511ddded9c5a8ddbd4761354d4032b935ae01ce483be298cf24315b'
  'e2c0d1dfbf93df1727361170ccc70d9930aea6e065e1e1c8caa42660f01e10ad'
  '2c6aa6a641332e5c87e971ac2a8beae13b059747bdba331bbd515914770d72d9'
  '9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67'
)

if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi

prepare() {
  # do not install in '/usr/local'
  if [ -d "$srcdir/usr/local/Brother" ]; then
    install -d "$srcdir/usr/share"
    mv "$srcdir/usr/local/Brother/" "$srcdir/usr/share/brother"
    rm -rf "$srcdir/usr/local"
      sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' ./`
    fi
  # setup cups-directories
  install -d "$srcdir/usr/share/cups/model"
  #link PPD file to cups/model
  ln -s /opt/brother/Printers/${_modelname}/cupswrapper/brother-${_modelname}-cups-en.ppd "$srcdir/usr/share/cups/model"

  install -d "$srcdir/usr/lib/cups/filter"
  #link LPD wrapper to cups/filter
  ln -s /opt/brother/Printers/${_modelname}/cupswrapper/brother_lpdwrapper_${_modelname} "$srcdir/usr/lib/cups/filter"
  
  #/etc/printcap is managed by cups
  rm `find $srcdir -type f -name 'setupPrintcap*'`
}

package() {
  cp -R "$srcdir/usr" "$pkgdir"
  cp -R "$srcdir/opt" "$pkgdir"
  install -m 644 -D cupswrapper-license.txt "$pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt"
  install -m 644 -D lpr-license.txt "$pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt"
  chown daemon:lp $pkgdir/opt/brother/Printers/${_modelname}/inf/br${_modelname}rc
}