# Maintainer: Dino Morelli <dino@ui3.info>
# Based on brother-mfc-j6510dw package from AUR

_model="j625dw"
pkgname="brother-mfc-$_model"
pkgver="3.0"
pkgrel=4
pkgdesc="LPR and CUPS driver for the Brother MFC-J625DW"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('unknown')
depends=('bash')
if test "$CARCH" == x86_64; then
   depends+=(lib32-glibc)
fi
makedepends=('perl')
install="brother-mfc-${_model}.install"
_revision=1
source=("http://www.brother.com/pub/bsc/linux/dlf/mfc${_model}lpr-${pkgver}.1-${_revision}.i386.deb"
   "http://www.brother.com/pub/bsc/linux/dlf/mfc${_model}cupswrapper-${pkgver}.0-${_revision}.i386.deb")

md5sums=('73b9a05efb33f895e5ffe2f3c4c01fdc'
         'a4a35a5ad3cfd3bb016941afff79425e')

build() {
    cd $srcdir || return 1
    [ -d "mfc${_model}" ] || (mkdir mfc${_model} || return 1)
    ar p mfc${_model}lpr-${pkgver}.1-${_revision}.i386.deb data.tar.gz | tar zx -C mfc${_model}|| return 1
    ar p mfc${_model}cupswrapper-${pkgver}.0-${_revision}.i386.deb data.tar.gz | tar zx -C mfc${_model} || return 1
    cd mfc${_model} || return 1
    cd opt/brother/Printers/mfc${_model} || return 1
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfc${_model} || return 1
    perl -i -pe 's#printcap\.local#printcap#g' $srcdir/mfc${_model}/opt/brother/Printers/mfc${_model}/inf/setupPrintcapij || return 1
    rm -f *.deb || return 1
}

package() {
    cp -rf $srcdir/mfc${_model}/usr/ $pkgdir/ || return 1
    cp -rf $srcdir/mfc${_model}/opt/ $pkgdir/ || return 1
}
