model="l8850cdw"
pkgname="brother-mfc-$model"
pkgver="1.1.2"
pkgrel=1
_revision=1
pkgdesc="LPR and CUPS driver for the Brother MFC-L8850CDW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license='unknown'
install="brother-mfc-${model}.install"
depends=('tcsh' 'deb2targz' 'perl' 'a2ps' 'lib32-libcups')
source=("http://download.brother.com/welcome/dlf101092/mfc${model}lpr-${pkgver}-${_revision}.i386.deb"
        "http://download.brother.com/welcome/dlf101093/mfc${model}cupswrapper-${pkgver}-${_revision}.i386.deb")
sha256sums=('7e681eb44a81e018706319f2f99ef1372ff75488c83573b94cfd1bcc1522ae0c'
            '9c8969ca59410804dbaf80e7bc437fbed5576a9c8fa68c061c2d48cc130afb04')


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
