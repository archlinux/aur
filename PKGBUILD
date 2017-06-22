# Maintainer: Jonathan "nekonyuu" Raffre <nk@nyuu.eu>
# Maintainer: dk0r <dk0r.public@gmail.com>

_model="9270cdn"
pkgname="brother-dcp-$_model"
pkgver="1.1.1"
pkgrel=4
_lprver="1.1.1-5"
_wrpver="1.1.1-5"
pkgdesc="LPR and CUPS driver for the Brother DCP-9270CDN"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
install="brother-dcp-${_model}.install"
if [[ "$CARCH" == "x86_64" ]] ; then
    depends=('tcsh' 'deb2targz' 'perl' 'a2ps' 'lib32-glibc')
elif [[ "$CARCH" == "i686" ]] ; then
    depends=('tcsh' 'deb2targz' 'perl' 'a2ps')
fi

source=("http://download.brother.com/welcome/dlf005575/dcp${_model}lpr-${_lprver}.i386.deb"
        "http://download.brother.com/welcome/dlf005577/dcp${_model}cupswrapper-${_wrpver}.i386.deb")
sha256sums=('c385aafc8a7fcb89afbdc8b1af50284b30059beec0128d096a6099399a011f64'
            'af538e452fdc2a91210d1a49469e08f65741192ca0d00ff8c004244b3630f149')
package() {
    deb2targz *.deb >/dev/null
    rm -f *.deb
    cd $srcdir
    mkdir dcp${_model}
    for i in *.tar.gz ; do
        tar xfz $i -C dcp${_model}
    done
    cd dcp${_model}/usr/local/Brother/Printer/dcp${_model}
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrapperdcp${_model}
    perl -i -pe 's#printcap\.local#printcap#g' $srcdir/dcp${_model}/usr/local/Brother/Printer/dcp${_model}/inf/setupPrintcapij
    cp -rf $srcdir/dcp${_model}/usr/ $pkgdir/
}
