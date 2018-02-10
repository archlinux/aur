# Maintainer: POINTS <jschroed@gmail.com>

pkgname="brother-mfc-j285dw"
pkgver="3.0.0"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-J285DW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups')
install="$pkgname.install"
source=("http://www.brother.com/pub/bsc/linux/dlf/mfcj285dwlpr-$pkgver-$pkgrel.i386.rpm"
        "http://www.brother.com/pub/bsc/linux/dlf/mfcj285dwcupswrapper-$pkgver-$pkgrel.i386.rpm"
        'cupswrapper-license.txt'
        'lpr-license.txt')
md5sums=('49768678cf4f75d51d5cfb7d246fd404'
         '1336eed5548a46da97dc5f067ed65149'
         '97ad0cffd216059e9d1d3121899d8646'
         '5e87a3dc0f3e3438c088eda0f3565f0d')

prepare() {
  # do not install in '/usr/local'
  if [ -d $srcdir/usr/local/Brother ]; then
    install -d $srcdir/usr/share
    mv $srcdir/usr/local/Brother/ $srcdir/usr/share/brother
    rm -rf $srcdir/usr/local
      sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' ./`
    fi

  # setup cups-directories
  install -d $srcdir/usr/share/cups/model
  install -d $srcdir/usr/lib/cups/filter

  # go to the cupswrapper directory and find the source file from which to generate a ppd- and wrapper-file
  cd `find . -type d -name 'cupswrapper'`
  if [ -f cupswrapper* ]; then
    _wrapper_source=`ls cupswrapper*`
    sed -i '/^\/etc\/init.d\/cups/d' $_wrapper_source
    sed -i '/^sleep/d' $_wrapper_source
    sed -i '/^lpadmin/d' $_wrapper_source
    sed -i 's|/usr|$srcdir/usr|g' $_wrapper_source
    sed -i 's|/opt|$srcdir/opt|g' $_wrapper_source
    sed -i 's|/model/Brother|/model|g' $_wrapper_source
    sed -i 's|lpinfo|echo|g' $_wrapper_source
    export srcdir=$srcdir
    ./$_wrapper_source
    sed -i 's|$srcdir||' $srcdir/usr/lib/cups/filter/*lpdwrapper*
    sed -i "s|$srcdir||" $srcdir/usr/lib/cups/filter/*lpdwrapper*
    rm $_wrapper_source
  fi

  # /etc/printcap is managed by cups
  rm `find $srcdir -type f -name 'setupPrintcap*'`
}

package() {
  cp -R $srcdir/usr $pkgdir
  if [ -d $srcdir/opt ]; then cp -R $srcdir/opt $pkgdir; fi
  install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
  install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}
