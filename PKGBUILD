# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>
model="l8900cdw"
pkgname="brother-mfc-${model}"
pkgver="1.2.0"
pkgrel=0
_revision=0
pkgdesc="LPR and CUPS driver for the Brother MFC-L8900CDW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
install="brother-mfc-${model}.install"
depends=('tcsh' 'deb2targz' 'perl' 'a2ps' 'lib32-libcups')
source=("http://download.brother.com/welcome/dlf103242/mfc${model}lpr-${pkgver}-${_revision}.i386.deb"
        "http://download.brother.com/welcome/dlf103251/mfc${model}cupswrapper-${pkgver}-${_revision}.i386.deb")
sha256sums=('27acea938b3224b67bc049c8c3fbfcdff6e1c1eb60e3ff22479c36346844310c'
            'f97be40c1c435d4be3b4db5efa082084ffe270771fbfcc7e78f280090e8403e2')


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
