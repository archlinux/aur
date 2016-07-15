# Maintainer: dk0r <parchd@archlinux.info>

model="9020cdw"
pkgname="brother-dcp-$model"
pkgver="1.1.4"
pkgrel=1
_revision=0
pkgdesc="LPR and CUPS driver for the Brother DCP-9020CDW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('mixed')
install="brother-dcp-${model}.install"
depends=('tcsh' 'deb2targz' 'perl' 'a2ps' 'lib32-glibc')
source=("http://www.brother.com/pub/bsc/linux/dlf/dcp9020cdwlpr-1.1.2-1.i386.deb"
    "http://download.brother.com/welcome/dlf100443/dcp${model}cupswrapper-${pkgver}-${_revision}.i386.deb")
md5sums=('d7fb28e4d73d56b1181833787968d0fb'
    '8283e3ca2d8e8873f852ed2321483fdc')
package() {
    deb2targz *.deb >/dev/null || return 1
    rm -f *.deb || return 1
    cd $srcdir || return 1
    [ -d "dcp${model}" ] || (mkdir dcp${model} || return 1)
    for i in *.tar.gz;do tar xfz $i -C dcp${model};done || return 1
    cd dcp${model} || return 1
    cd opt/brother/Printers/dcp${model} || return 1
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrapperdcp${model} || return 1
    perl -i -pe 's#printcap\.local#printcap#g' $srcdir/dcp${model}/opt/brother/Printers/dcp${model}/inf/setupPrintcapij || return 1
    cp -rf $srcdir/dcp${model}/usr/ $pkgdir/ || return 1
    cp -rf $srcdir/dcp${model}/opt/ $pkgdir/ || return 1
}
