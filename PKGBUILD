# Submitter: voidptr <aur at voidptr dot net>
# Contributor: Andrew Hacking <ahacking at gmail>
# Maintainer: Tom Wasiluk <tomasz at wasil dot uk>

model="9340cdw"
pkgname="brother-mfc-$model"
pkgver="1.1.4"
pkgrel=1
_cupswrapper_verstr="1.1.4-0"
_lpr_verstr="1.1.2-1"
pkgdesc="LPR and CUPS driver for the Brother MFC-9340CDW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
install="brother-mfc-${model}.install"
depends=('tcsh' 'deb2targz' 'perl' 'a2ps' 'lib32-libcups')

source=("http://download.brother.com/welcome/dlf007027/mfc${model}lpr-${_lpr_verstr}.i386.deb"
        "http://download.brother.com/welcome/dlf007029/mfc${model}cupswrapper-${_cupswrapper_verstr}.i386.deb")
sha256sums=('0591020f391dd904680e2a3beb9664e404cac144d5848f7091c9246b44bc8dfe'
            '7ba2bd88eec76e7f278a220e1a8e32a3f4404280723c299bcdc4613b2bbb9c36')

package() {
    deb2targz *.deb >/dev/null || return 1
    rm -f *.deb || return 1
    cd $srcdir || return 1
    [ -d "mfc${model}" ] || (mkdir mfc${model} || return 1)
    for i in *.tar.gz;do tar xfz $i -C mfc${model};done || return 1
    cd mfc${model} || return 1
    cd opt/brother/Printers/mfc${model} || return 1
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfc${model} || return 1
    perl -i -pe 's#printcap\.local#printcap#g' $srcdir/mfc${model}/opt/brother/Printers/mfc${model}/inf/setupPrintcapij || return 1
    cp -rf $srcdir/mfc${model}/usr/ $pkgdir/ || return 1
    cp -rf $srcdir/mfc${model}/opt/ $pkgdir/ || return 1
}