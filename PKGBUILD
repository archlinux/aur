# Maintainer: Walter Dworak <preparationh67 at gmail dot com>
pkgname=rr264x
pkgver=1.5
pkgrel=1
pkgdesc="Kernel modules for Highpoint RocketRAID 2640X1 SAS Card."
arch=('i686' 'x86_64')
url="http://www.highpoint-tech.com/USA_new/cs-series_rr2600.htm"
license=('custom')
groups=()

depends=('linux>=3.10')
makedepends=('linux-headers')

provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
source=(http://www.highpoint-tech.com/BIOS_Driver/rr26xx/2640X1-2640X4-2642/Linux/RR264x-Linux-Src-v1.5-120817-1641.tar.gz rr264x-v1.5.patch)
noextract=()
md5sums=('f10172e1443f169d7c845602295f38be' 'b0ca801156b41183f2828156ad2446cd')
_extramodules=extramodules-"$(uname -r | cut -d. -f1,2)"-ARCH
_kernver="$(uname -r)"

build() {
    #mkdir -p $pkgdir/lib/modules/${_kernver}/drivers/scsi/rr26xx

    cd $srcdir/
    patch -p0 < ./rr264x-v1.5.patch
    cd $srcdir/rr264x-linux-src-v$pkgver/product/rr2640/linux/
    make || return 1
}

package() {
    # Install the kernel module
    cd $srcdir/rr264x-linux-src-v$pkgver/product/rr2640/linux/
    install -m 644 -D rr26xx.ko "${pkgdir}/usr/lib/modules/${_kernver}/drivers/scsi/rr26xx/rr26xx.ko"
    gzip "${pkgdir}/usr/lib/modules/${_kernver}/drivers/scsi/rr26xx/rr26xx.ko"

    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    cp $srcdir/rr264x-linux-src-v$pkgver/README $pkgdir/usr/share/licenses/$pkgname/
}
 

