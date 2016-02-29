model="l8650cdw"
pkgname="brother-mfc-$model"
pkgver="1.1.2"
pkgrel=1
_revision=1
pkgdesc="LPR and CUPS driver for the Brother MFC-L8850CDW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
install="brother-mfc-${model}.install"
depends=('tcsh' 'deb2targz' 'perl' 'a2ps' 'lib32-libcups')
source=("http://download.brother.com/welcome/dlf101088/mfc${model}lpr-${pkgver}-${_revision}.i386.deb"
        "http://download.brother.com/welcome/dlf101089/mfc${model}cupswrapper-${pkgver}-${_revision}.i386.deb")
sha256sums=('3c9367b144c067f1c9e51b974f8c1e23a1294aa6fd572d4aa229af15ca066e10'
            '2437531477231ec1c9833725e69882d82c2cfb42d7e17e535619d767733e7515')


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
