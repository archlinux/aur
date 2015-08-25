#Maintainer: Walter Dworak <preparationh67 at gmail dot com>
_pkgbase=rr264x
pkgname=rr264x-dkms
pkgver=1.5
pkgrel=1
pkgdesc="Kernel modules for Highpoint RocketRAID 2640X1 SAS Card. (DKMS version)"
url="http://www.highpoint-tech.com/USA_new/cs-series_rr2600.htm"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dkms')
provides=("rr264x=${pkgver}")
conflicts=('rr264x' 'rr264x-lts')
install=${pkgname}.install
options=(!strip)
source=(http://www.highpoint-tech.com/BIOS_Driver/rr26xx/2640X1-2640X4-2642/Linux/RR264x-Linux-Src-v1.5-120817-1641.tar.gz rr264x-v1.5.patch dkms.conf)

md5sums=('f10172e1443f169d7c845602295f38be'
      	 'c84ae6a0afb8f4bd0110df976df77577'
	 'f7d8847dcfdca530aef7b76182b2435a')

prepare() {
    cd $srcdir/
    patch -p0 < ./rr264x-v1.5.patch

}

package() {
    cd $srcdir/$_pkgbase-linux-src-v$pkgver/
    mv $srcdir/$_pkgbase-linux-src-v$pkgver/product/rr2640/linux/Makefile $srcdir/$_pkgbase-linux-src-v$pkgver/
    mv $srcdir/$_pkgbase-linux-src-v$pkgver/product/rr2640/linux/config.c $srcdir/$_pkgbase-linux-src-v$pkgver/
    make
    install -dm755 "$pkgdir/usr/src/$_pkgbase-$pkgver"
    cp -a ./* $pkgdir/usr/src/$_pkgbase-$pkgver/
    chmod -R 755 "$pkgdir/usr/src/$_pkgbase-$pkgver"
    install -Dm644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
	-e "s/@PKGVER@/${pkgver}/" \
	-i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
    
}
