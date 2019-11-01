# Maintainer: Christina Vitting <(firstname)(lastname) @ gmail.com>

pkgname="brother-mfc-j497dw"
pkgver="1.0.5"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-J497DW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups'
         'ghostscript'
         'gsfonts')
depends_x86_64=('lib32-glibc')
optdepends=('brscan4' 'brscan-skey')
install="$pkgname.install"
source=("http://www.brother.com/pub/bsc/linux/packages/mfcj497dwpdrv-1.0.5-0.i386.rpm")
md5sums=('5a3f823f2c7cb6d1718c2277fa949b40')

prepare() {
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
}
