# Maintainer: Adam Harvey <adam@adamharvey.name>
# Contributor: Samuel Bernard <samuel.bernard@gmail.com>
# Based on Samuel Bernard's brother-mfc-9320cw AUR package.
model="9130cw"
pkgname="brother-mfc-$model"
pkgver="1.1.2"
pkgrel=1
_revision=1
_revision_cups=1
pkgdesc="LPR and CUPS driver for the Brother MFC-9130CW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
install="brother-mfc-${model}.install"
depends=('tcsh' 'deb2targz' 'perl' 'a2ps')
source=("http://www.brother.com/pub/bsc/linux/dlf/mfc${model}lpr-${pkgver}-${_revision}.i386.deb"
        "http://www.brother.com/pub/bsc/linux/dlf/mfc${model}cupswrapper-${pkgver}-${_revision_cups}.i386.deb")
sha256sums=('6ea12c777fd19735767757e977591d8c51353ccda7b8e4af130cc48aee85736d'
            '693211aff498e6cd308279899d439fa44657be0e6f5879f4ebc5530637d477ca')

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
