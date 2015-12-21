# Maintainer: Dino Morelli <dino@ui3.info>
# Based on brother-mfc-j6510dw package from AUR

_model="j615w"
pkgname="brother-mfc-$_model"
pkgver="1.1.3"
pkgrel=2
pkgdesc="LPR and CUPS driver for the Brother MFC-${_model}"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
# See also: http://support.brother.com/g/b/producttop.aspx?c=de&lang=de&prod=mfcj615w_all
license=('unknown')
depends=('tcsh' 'deb2targz' 'perl' 'a2ps')
if test "$CARCH" == x86_64; then
   depends+=(lib32-glibc)
fi
install="brother-mfc-${_model}.install"
_revision=1
source=("http://download.brother.com/welcome/dlf006602/mfcj615wlpr-${pkgver}-${_revision}.i386.deb"
	"http://download.brother.com/welcome/dlf006604/mfcj615wcupswrapper-${pkgver}-${_revision}.i386.deb")
sha256sums=("a3e00208c88a09bb82eb91fcb213bdd6f0c4f2d2249fe312deba0d6045f3fcc8"
	 "16c3b91e7ec06faefa05e7fabfca8923050e6be438c2a57bed17979e43f812cb")

build() {
    deb2targz *.deb >/dev/null || return 1
    rm -f *.deb || return 1
    cd $srcdir || return 1
    [ -d "mfc${_model}" ] || (mkdir mfc${_model} || return 1)
    for i in *.tar.gz;do tar xfz $i -C mfc${_model};done || return 1
    cd mfc${_model} || return 1
    cd opt/brother/Printers/mfc${_model} || return 1
    # Not sure what this does, copied from other Brother printer driver PKGBUILDs
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfc${_model} || return 1
    perl -i -pe 's#printcap\.local#printcap#g' $srcdir/mfc${_model}/opt/brother/Printers/mfc${_model}/inf/setupPrintcapij || return 1
}

package() {
    cp -rf $srcdir/mfc${_model}/usr/ $pkgdir/ || return 1
    cp -rf $srcdir/mfc${_model}/opt/ $pkgdir/ || return 1
}
