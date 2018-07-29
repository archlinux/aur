# Maintainer: Taras Ulakhovich <taras.ulakhovich@gmail.com>
# Based on brother-mfc-9460cdn package from AUR

_model="9465cdn"
pkgname="brother-mfc-$_model"
pkgver="1.1.1"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-9465CDN"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('unknown')
depends=('tcsh' 'deb2targz' 'perl' 'a2ps')
if test "$CARCH" == x86_64; then
   depends+=(lib32-glibc)
fi
install="brother-mfc-${_model}.install"
_revision=5

source=("http://www.brother.com/pub/bsc/linux/dlf/mfc${_model}lpr-${pkgver}-${_revision}.i386.deb"
   "http://www.brother.com/pub/bsc/linux/dlf/mfc${_model}cupswrapper-${pkgver}-${_revision}.i386.deb")
md5sums=('d5bfd57216e53cfaf7c04de42055209e'
        '31480002670c88352c3525a37d678bea')


build() {
    deb2targz *.deb >/dev/null || return 1
    rm -f *.deb || return 1
    cd $srcdir || return 1
    [ -d "mfc${_model}" ] || (mkdir mfc${_model} || return 1)
    for i in *.tar.gz;do tar xfz $i -C mfc${_model};done || return 1
    cd mfc${_model} || return 1
    cd usr/local/Brother/Printer/mfc${_model} || return 1
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfc${_model} || return 1
    perl -i -pe 's#printcap\.local#printcap#g' $srcdir/mfc${_model}/usr/local/Brother/Printer/mfc${_model}/inf/setupPrintcapij || return 1
}

package() {
    cp -rf $srcdir/mfc${_model}/usr/ $pkgdir/ || return 1
}
