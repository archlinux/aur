model="9010cn"
pkgname="brother-mfc-$model"
pkgver="1.1.2"
pkgrel=1
_revision=1
_revision_cups=2
pkgdesc="LPR and CUPS driver for the Brother MFC-9010CN"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
install="brother-mfc-${model}.install"
depends=('deb2targz' 'perl' 'a2ps' 'cups')
depends_x86_64=('lib32-glibc')
source=("http://download.brother.com/welcome/dlf006431/mfc${model}lpr-${pkgver}-${_revision}.i386.deb"
        "http://download.brother.com/welcome/dlf006433/mfc${model}cupswrapper-${pkgver}-${_revision_cups}.i386.deb")
sha256sums=('b197cb67228b5f664465a1d7805d795f9cfd1502a88716864466469dec5fa722'
            '47c17b7b0168e9e3abff4e9d5d513100ada85b49e8aa4b53b02d59b8124dc34e')

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
