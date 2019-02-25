# Maintainer: Rools
# Based on brother-mfc-j6510dw package from AUR

_model="j650dw"
pkgname="brother-mfc-$_model"
pkgver="3.0"
pkgrel=3
pkgdesc="LPR and CUPS driver for the Brother MFC-J650DW"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('unknown')
depends=('a2ps' 'cups')
makedepends=('deb2targz' 'perl')
if test "$CARCH" == x86_64; then
   depends+=(lib32-glibc)
fi
install="brother-mfc-${_model}.install"
_revision=1
source=("http://www.brother.com/pub/bsc/linux/dlf/mfc${_model}lpr-${pkgver}.0-${_revision}.i386.deb"
   "http://www.brother.com/pub/bsc/linux/dlf/mfc${_model}cupswrapper-${pkgver}.0-${_revision}.i386.deb")

md5sums=('02ed3f39cc5727e935c12b58e7c12276'
         '3273138b49ad2218576126cffc43028d')

build() {
    deb2targz *.deb >/dev/null || return 1
    rm -f *.deb || return 1
    cd $srcdir || return 1
    [ -d "mfc${_model}" ] || (mkdir mfc${_model} || return 1)
    for i in *.tar.gz;do tar xfz $i -C mfc${_model};done || return 1
    cd mfc${_model} || return 1
    cd opt/brother/Printers/mfc${_model} || return 1
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfc${_model} || return 1
    perl -i -pe 's#printcap\.local#printcap#g' $srcdir/mfc${_model}/opt/brother/Printers/mfc${_model}/inf/setupPrintcapij || return 1
}

package() {
    cp -rf $srcdir/mfc${_model}/usr/ $pkgdir/ || return 1
    cp -rf $srcdir/mfc${_model}/opt/ $pkgdir/ || return 1
}
