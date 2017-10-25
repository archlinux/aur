# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>

_model="j820dn"
pkgname="brother-mfc-$_model"
pkgver="3.0.0"
_revision=1
pkgrel=2
pkgdesc="LPR and CUPS driver for the Brother MFC-J820DN"
url="http://support.brother.co.jp/j/b/downloadlist.aspx?c=jp&lang=ja&prod=mfcj820dn&os=128"
arch=('i686' 'x86_64')
license=('unknown')
install="brother-mfc-${_model}.install"
depends=('a2ps' 'lib32-gcc-libs')
makedepends=('perl' 'deb2targz')

source=("http://download.brother.com/welcome/dlf100831/mfc${_model}lpr-${pkgver}-${_revision}.i386.deb"
        "http://download.brother.com/welcome/dlf100830/mfc${_model}cupswrapper-${pkgver}-${_revision}.i386.deb")

md5sums=('adc132ccdd135a7b3729d9af9db9e3b5'
         'ab0731da6b3d8a170e81f6c55db9f5a3')

package() {
    deb2targz *.deb >/dev/null || return 1
    rm -f *.deb || return 1
    cd $srcdir || return 1
    [ -d "mfc${_model}" ] || (mkdir mfc${_model} || return 1)
    for i in *.tar.gz;do tar xfz $i -C mfc${_model};done || return 1
    cd mfc${_model} || return 1
    cd opt/brother/Printers/mfc${_model} || return 1
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfc${_model} || return 1
    perl -i -pe 's#printcap\.local#printcap#g' $srcdir/mfc${_model}/opt/brother/Printers/mfc${_model}/inf/setupPrintcapij || return 1
    cp -rf $srcdir/mfc${_model}/usr/ $pkgdir/ || return 1
    cp -rf $srcdir/mfc${_model}/opt/ $pkgdir/ || return 1
}
