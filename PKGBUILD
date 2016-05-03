# Maintainer: dk0r <dk0r.public@gmail.com>

_model="9022cdw"
pkgname="brother-dcp-$_model"
pkgver="1.1.3"
pkgrel=1
_revision=0
pkgdesc="LPR and CUPS driver for the Brother DCP-9022CDW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
install="brother-dcp-${_model}.install"
depends=('tcsh' 'deb2targz' 'perl' 'a2ps')
source=("http://download.brother.com/welcome/dlf101612/dcp${_model}lpr-${pkgver}-${_revision}.i386.deb"
	"http://download.brother.com/welcome/dlf101613/dcp9022cdwcupswrapper-1.1.3-0.i386.deb")
sha256sums=('8db48cda7e8f38f6a9fe0279f67e6d286a300f41e7982d1be275113542ec5027'
            '469a31e8b2327e927a92a57635e079e504a87e864b0e51b1223fd4c184184ba6')
package() {
    deb2targz *.deb >/dev/null || return 1
    rm -f *.deb || return 1
    cd $srcdir || return 1
    [ -d "dcp${_model}" ] || (mkdir dcp${_model} || return 1)
    for i in *.tar.gz;do tar xfz $i -C dcp${_model};done || return 1
    cd dcp${_model} || return 1
    cd opt/brother/Printers/dcp${_model} || return 1
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrapperdcp${_model} || return 1
    perl -i -pe 's#printcap\.local#printcap#g' $srcdir/dcp${_model}/opt/brother/Printers/dcp${_model}/inf/setupPrintcapij || return 1
    cp -rf $srcdir/dcp${_model}/usr/ $pkgdir/ || return 1
    cp -rf $srcdir/dcp${_model}/opt/ $pkgdir/ || return 1
}
