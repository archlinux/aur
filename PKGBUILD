# Maintainer: Karol Babioch <karol@babioch.de>
# Inspired by package brother-dcp130c

pkgname='brother-ql650td'
pkgver=1.0.1r0
pkgrel=1
pkgdesc='LPR and CUPS driver for Brother QL-650TD label printer'
url='http://solutions.brother.com/linux/en_us/'
arch=('i686' 'x86_64')
license=('custom')
depends='cups'
if [ "$CARCH" = 'x86_64' ]; then
  depends+=('lib32-glibc')
fi
provides=('brother-ql650td-cupswrapper' 'brother-ql650td-lpr')
conflicts=('brother-ql650td-cupswrapper' 'brother-ql650td-lpr')
install="$pkgname.install"
source=("http://download.brother.com/welcome/dlfp002185/ql650tdlpr-${pkgver/r/-}.i386.rpm"
        "http://download.brother.com/welcome/dlfp002187/ql650tdcupswrapper-${pkgver/r/-}.i386.rpm"
        'LICENSE')
sha256sums=('371301a0c297bb0879f387ab709f60304376d2a94ae9989c05f3ee86b8a0971d'
            '0aa08b6214de134ed6828fef8ea6ae1975077947a577f62904d3e618d3f4c7b0'
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

