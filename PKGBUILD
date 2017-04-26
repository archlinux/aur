# Maintainer: dk0r <dk0r.public@gmail.com>

_model="9022cdw"
pkgname="brother-dcp-$_model"
pkgver="1.1.3"
pkgrel=3
_lprver="1.1.3-0"
_wrpver="1.1.4-0"
pkgdesc="LPR and CUPS driver for the Brother DCP-9022CDW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
install="brother-dcp-${_model}.install"
if [[ "$CARCH" == "x86_64" ]] ; then
    depends=('tcsh' 'deb2targz' 'perl' 'a2ps' 'lib32-glibc')
elif [[ "$CARCH" == "i686" ]] ; then
    depends=('tcsh' 'deb2targz' 'perl' 'a2ps')
fi
source=("http://download.brother.com/welcome/dlf101612/dcp${_model}lpr-${_lprver}.i386.deb"
        "http://download.brother.com/welcome/dlf101613/dcp${_model}cupswrapper-${_wrpver}.i386.deb")
sha256sums=('8db48cda7e8f38f6a9fe0279f67e6d286a300f41e7982d1be275113542ec5027'
            '5b44c91152236079ebfd15f5b0e1e8f515d114a395cf77459387ba9358c8a7fa')
package() {
    deb2targz *.deb >/dev/null
    rm -f *.deb
    cd $srcdir
    mkdir dcp${_model}
    for i in *.tar.gz ; do
        tar xfz $i -C dcp${_model}
    done
    cd dcp${_model}/opt/brother/Printers/dcp${_model}
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrapperdcp${_model}
    perl -i -pe 's#printcap\.local#printcap#g' $srcdir/dcp${_model}/opt/brother/Printers/dcp${_model}/inf/setupPrintcapij
    cp -rf $srcdir/dcp${_model}/usr/ $pkgdir/
    cp -rf $srcdir/dcp${_model}/opt/ $pkgdir/
}
