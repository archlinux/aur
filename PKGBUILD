pkgname="brother-mfc-9140cdn"
pkgver="1.1.4"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-9140CDN"
url="https://support.brother.com/g/b/downloadlist.aspx?c=gb&lang=en&prod=mfc9140cdn_eu_as_cn&os=128"
arch=('i686' 'x86_64')
license=('unknown')
install="brother-mfc-9140cdn.install"
if [ "$CARCH" == 'i686' ]; then
   depends=('deb2targz' 'perl')
elif [ "$CARCH" == 'x86_64' ]; then
   depends=('deb2targz' 'perl' 'lib32-libcups')
fi
source=("http://download.brother.com/welcome/dlf100405/mfc9140cdnlpr-1.1.2-1.i386.deb"
         "http://download.brother.com/welcome/dlf100407/mfc9140cdncupswrapper-1.1.4-0.i386.deb")
sha256sums=('90eae54a7201c369ddc6c3999af24c9c8de7b2c72061ba0773e8809da5451df3'
            '8699b4049ea24ccd1b8d4bed778c886942900088e5280d1bd441e5875f5559a1')

package() {
    deb2targz *.deb >/dev/null || return 1
    rm -f *.deb || return 1
    cd $srcdir || return 1
    [ -d "mfc9140cdn" ] || (mkdir mfc9140cdn || return 1)
    for i in *.tar.gz;do tar xfz $i -C mfc9140cdn;done || return 1
    cd mfc9140cdn || return 1
    cd opt/brother/Printers/mfc9140cdn || return 1
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfc9140cdn || return 1
    perl -i -pe 's#printcap\.local#printcap#g' $srcdir/mfc9140cdn/opt/brother/Printers/mfc9140cdn/inf/setupPrintcapij || return 1
    cp -rf $srcdir/mfc9140cdn/usr/ $pkgdir/ || return 1
    cp -rf $srcdir/mfc9140cdn/opt/ $pkgdir/ || return 1
}
