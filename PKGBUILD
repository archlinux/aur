# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Submitter:  Danilo <aur@dbrgn.ch>

model="9330cdw"
pkgname="brother-mfc-$model"
pkgver="1.1.2"
pkgrel=5
_revision=1
pkgdesc="LPR and CUPS driver for the Brother MFC-9330CDW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
install="brother-mfc-${model}.install"
depends=('deb2targz' 'perl' 'brscan4' 'a2ps' 'lib32-libcups')
lpr_ver="1.1.2"
lpr_rev=1
cw_ver="1.1.4"
cw_rev=0
source=("http://download.brother.com/welcome/dlf100400/mfc${model}lpr-${lpr_ver}-${lpr_rev}.i386.deb"
        "http://download.brother.com/welcome/dlf100402/mfc${model}cupswrapper-${cw_ver}-${cw_rev}.i386.deb")
sha256sums=('d6af18bd4e33a2e01f6647cc1eb6d7f1b519bd9f32c525c0343e6883d66a0e04'
            '08cf568c6924a146b541077642bf07b22fd8aa2b5cca522b4f627430ed2eb2ec')

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
