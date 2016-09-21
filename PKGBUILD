# Maintainer: Karol Babioch <karol@babioch.de>
# Inspired by package brother-dcp130c

pkgname='brother-ql1060n'
pkgver=1.0.1r0
pkgrel=1
pkgdesc='LPR and CUPS driver for Brother QL-1060N label printer'
url='http://solutions.brother.com/linux/en_us/'
arch=('i686' 'x86_64')
license=('custom')
depends='cups'
if [ "$CARCH" = 'x86_64' ]; then
  depends+=('lib32-glibc')
fi
install="$pkgname.install"
source=("http://download.brother.com/welcome/dlfp002231/ql1060nlpr-${pkgver/r/-}.i386.rpm"
        "http://download.brother.com/welcome/dlfp002233/ql1060ncupswrapper-${pkgver/r/-}.i386.rpm"
        'LICENSE')
sha256sums=('f2c2f919ec15b6159e13bfec60bb2d515f8c77a812e349a0ed1ec68ac29f5a25'
            'bf7a1d86234d643547fc9052df55524a5e4ddbd4bf07799988c18666e7d2d3eb'
            'cdd1955a9996bc246ba54e84f0a5ccbfdf6623962b668188762389aa79ef9811')

prepare()
{
  #  do not install in '/usr/local'
  if [ -d $srcdir/usr/local/Brother ]; then
    install -d $srcdir/usr/share
    mv $srcdir/usr/local/Brother/ $srcdir/usr/share/brother
    rm -rf $srcdir/usr/local
    sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' ./`
  fi

  # setup cups directories
  install -d "$srcdir/usr/share/cups/model"
  install -d "$srcdir/usr/lib/cups/filter"

  #  go to the cupswrapper directory and find the source file from wich to generate a ppd- and wrapper-file
  cd `find . -type d -name 'cupswrapper'`
  if [ -f cupswrapper* ]; then
    _wrapper_source=`ls cupswrapper*`
    sed -i '/^\/etc\/init.d\/cups/d' $_wrapper_source
    sed -i '/^sleep/d' $_wrapper_source
    sed -i '/^echo lpadmin/d' $_wrapper_source
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

  #  /etc/printcap is managed by cups
  rm `find $srcdir -type f -name 'setupPrintcap*'`
}

package() {
  cd "$srcdir"

  cp -R usr $pkgdir
  if [ -d opt ]; then cp -R opt $pkgdir; fi

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

