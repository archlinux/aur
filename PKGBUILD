model="9140cdn"
pkgname="brother-mfc-$model"
pkgver="1.1.2"
pkgrel=3
_revision=1
pkgdesc="LPR and CUPS driver for the Brother MFC-9140CDN"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
install="brother-mfc-${model}.install"
if [ "$CARCH" == 'i686' ]; then
   depends=('deb2targz' 'perl')
elif [ "$CARCH" == 'x86_64' ]; then
   depends=('deb2targz' 'perl' 'lib32-libcups')
fi
source=("http://download.brother.com/welcome/dlf100405/mfc${model}lpr-${pkgver}-${_revision}.i386.deb"
         "http://download.brother.com/welcome/dlf100407/mfc${model}cupswrapper-${pkgver}-${_revision}.i386.deb")
sha256sums=('90eae54a7201c369ddc6c3999af24c9c8de7b2c72061ba0773e8809da5451df3'
            '6eccd08ce0fb57f59def431114913c35c738c7497053dbf649efd1d041c3d919')

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
