# $Id$
# Maintainer : Tyler Holinka <TylerHolinka+arch at gmail dot com>

pkgname=dell-unified-printer-driver
pkgdesc="Drivers for Dell Printers Model #'s: s1130n 1130 1133 1135n 1815 2145cn 2335dn 2355dn 5330 B1160 B1160w B1165nfw B1260dn B1265dfw B1265dnf B2365dnf"
url="http://www.dell.com/support/home/us/en/19/drivers/driversdetails?driverId=C10W1"
license=('unknown')
pkgver=1.03
pkgrel=1
arch=('x86_64')
depends=('cups')
conflicts=('samsung-unified-driver-printer')
# this is the newest version found after a quick search
source=("$pkgname-$pkgver.tar.gz::https://downloads.dell.com/FOLDER01511597M/1/B1265dnf_Linux_v${pkgver}_Driver.tar.gz")
sha256sums=('a1aa742cd266f60ae756c5678cdc27ee5be788d3ec088694f2bd03efffc17e36')

prepare() {
    cd "cdroot"
}

package() {
    cd "cdroot"

    # thank you driggs39 from here https://www.dell.com/community/Printers/b1165nfw-Linux-installer-modifies-important-files-damages-system/m-p/4414245#M80350
    
    # conflicts with samsung-unified-driver-printer
    install -Dm755 Linux/"$arch"/rastertospl "$pkgdir"/usr/lib/cups/filter/rastertospl
    install -Dm755 Linux/"$arch"/libscmssc.so "$pkgdir"/usr/lib/libscmssc.so
    
    models=(1130n.ppd 1130.ppd 1133.ppd 1135n.ppd 1815.ppd 2145cn.ppd 2335dn.ppd 2355dn.ppd 5330.ppd B1160.ppd B1160w.ppd B1165nfw.ppd B1260dn.ppd B1265dfw.ppd B1265dnf.ppd B2365dnf.ppd)

    for i in ${models[@]}; do
        install -Dm644 Linux/noarch/at_opt/share/ppd/"$i" "$pkgdir"/usr/share/cups/model/"$i"
    done
}
