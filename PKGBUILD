model="8950dw"
pkgname="brother-mfc-$model"
pkgver="3.0.0"
pkgrel=1
_revision=1
_revision_cups=1
pkgdesc="LPR and CUPS driver for the Brother MFC-8950DW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
install="brother-mfc-${model}.install"
depends=('deb2targz' 'perl' 'a2ps' 'cups')
depends_x86_64=('lib32-glibc')
source=("http://download.brother.com/welcome/dlf006423/mfc${model}lpr-${pkgver}-${_revision}.i386.deb"
        "http://download.brother.com/welcome/dlf006425/mfc${model}cupswrapper-${pkgver}-${_revision_cups}.i386.deb")
sha256sums=('42b8e0971539424d22f7a4de6d56d629fb71070998a0fe1055e384218b29790f'
            '2de2b6f2777a63cd2cd0015c1ea1e0b1c27a64f2e0698df68a05ec7f5e3fc70c')

prepare() {
    deb2targz *.deb >/dev/null || return 1
    rm -f *.deb || return 1
    cd $srcdir || return 1
    [ -d "mfc${model}" ] || (mkdir mfc${model} || return 1)
    for i in *.tar.gz;do tar xfz $i -C mfc${model};done || return 1
}

package() {
    cd $srcdir || return 1
    cd mfc${model} || return 1
    cd opt/brother/Printers/MFC${model^^} || return 1
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/brother_lpdwrapper_MFC${model^^} || return 1
    perl -i -pe 's#printcap\.local#printcap#g' $srcdir/mfc${model}/opt/brother/Printers/MFC${model^^}/inf/setupPrintcap || return 1
    cp -rf $srcdir/mfc${model}/usr/ $pkgdir/ || return 1
    cp -rf $srcdir/mfc${model}/opt/ $pkgdir/ || return 1

    # symlinks 
    install -m 755 -d $pkgdir/usr/lib/cups/filter
    ln -s /opt/brother/Printers/MFC8950DW/cupswrapper/brother_lpdwrapper_MFC8950DW $pkgdir/usr/lib/cups/filter
    install -m 755 -d $pkgdir/usr/lib32/cups/filter
    ln -s /opt/brother/Printers/MFC8950DW/cupswrapper/brother_lpdwrapper_MFC8950DW $pkgdir/usr/lib32/cups/filter
    install -m 755 -d $pkgdir/usr/libexec/cups/filter
    ln -s /opt/brother/Printers/MFC8950DW/cupswrapper/brother_lpdwrapper_MFC8950DW $pkgdir/usr/libexec/cups/filter
    install -m 755 -d $pkgdir/usr/share/cups/model
    ln -s /opt/brother/Printers/MFC8950DW/cupswrapper/brother-MFC-8950DW-cups-en.ppd $pkgdir/usr/share/cups/model
    install -m 755 -d $pkgdir/usr/share/ppd/brother
    ln -s /opt/brother/Printers/MFC8950DW/cupswrapper/brother-MFC-8950DW-cups-en.ppd $pkgdir/usr/share/ppd/brother
}
