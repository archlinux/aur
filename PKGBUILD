#Maintainer: Walter Dworak <preparatioh67 at gmail dot com>
# Contributor: Alessandro Sagratini <ale_sagra at hotmail dot com>
_pkgbase=rr62x
pkgname=rr62x-dkms
pkgver=1.2
pkgrel=1
pkgdesc="Kernel modules for Highpoint RocketRAID 62x SATA/6Gbps Card. (DKMS Version)"
arch=('i686' 'x86_64')
url="http://www.highpoint-tech.com/USA_new/series_rr600-download.htm"
license=('custom')
groups=()

depends=('linux>=4.0')
makedepends=('linux-headers')

conflicts=('rr62x' 'rr62x-lts')
install=$pkgname.install
source=(http://www.highpoint-tech.com/BIOS_Driver/rr62x/linux/rr62x-linux-src-v1.2-120601-1355.tar.gz linux_4.patch dkms.conf)
md5sums=('b308bcba65d065cddf05d9b7dea8f3d6' 'd4fbdc757b8e061410396f0c829958f9' '5a5b4137c86a3da4005bcfbe98b49660')
_extramodules=extramodules-"$(uname -r | cut -d. -f1,2)"-ARCH
_kernver="$(uname -r)"

prepare() {
	cd $srcdir/
	patch -p0 < ./linux_4.patch
}

package() {
	cd $srcdir/$_pkgbase-linux-src-v$pkgver/
	#mv $srcdir/$_pkgbase-linux-src-v$pkgver/product/$_pkgbase/linux/Makefile $srcdir/$_pkgbase-linux-src-v$pkgver/
	#mv $srcdir/$_pkgbase-linux-src-v$pkgver/product/$_pkgbase/linux/config.c $srcdir/$_pkgbase-linux-src-v$pkgver/
	cd product/$_pkgbase/linux
	make
	install -dm755 "$pkgdir/usr/src/$_pkgbase-$pkgver"
	cd $srcdir/$_pkgbase-linux-src-v$pkgver/
	cp -a ./* $pkgdir/usr/src/$_pkgbase-$pkgver/
	chmod -R 755 "$pkgdir/usr/src/$_pkgbase-$pkgver"
	install -Dm644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"
	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
	    -e "s/@PKGVER@/${pkgver}/" \
	    -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
	
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp $srcdir/$_pkgbase-linux-src-v$pkgver/README $pkgdir/usr/share/licenses/$pkgname/
}
