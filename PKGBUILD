# Maintainer: Nick Cao <nickcao@nichi.co>
pkgname='dptf'
pkgver='8.4.10401'
pkgrel=1
pkgdesc='Intel (R) Dynamic Platform and Thermal Framework (Intel (R) DPTF)'
arch=('x86_64')
url='https://github.com/intel/dptf'
license=('custom')
depends=('readline')
makedepends=('cmake')
source=('https://github.com/intel/dptf/archive/8.4.10401.tar.gz')
md5sums=('SKIP')
prepare(){
	mv $srcdir/dptf-8.4.10401 $srcdir/dptf
	patch $srcdir/dptf/DPTF/Linux/CMakeLists.txt ../DPTF.patch
	patch $srcdir/dptf/ESIF/Products/ESIF_UF/Linux/Makefile ../ESIF_UF.patch
}

build() {
	cd $srcdir/dptf/DPTF/Linux/build
	cmake ..
	make -j`nproc`
	cd $srcdir/dptf/ESIF/Products/ESIF_UF/Linux
	make
	cd $srcdir/dptf/ESIF/Products/ESIF_CMP/Linux
	make
	cd $srcdir/dptf/ESIF/Products/ESIF_WS/Linux
	make
}
package() {
	mkdir -p $pkgdir/usr/share/dptf/ufx64
	install -Dm644 $srcdir/dptf/DPTF/Linux/build/x64/release/Dptf*.so $pkgdir/usr/share/dptf/ufx64
	mkdir -p $pkgdir/etc/dptf
	install -Dm644 $srcdir/dptf/ESIF/Packages/DSP/dsp.dv $pkgdir/etc/dptf
	mkdir -p $pkgdir/usr/bin
	install -Dm644 $srcdir/dptf/ESIF/Products/ESIF_UF/Linux/esif_ufd $pkgdir/usr/bin
	install -Dm644 $srcdir/dptf/ESIF/Products/ESIF_CMP/Linux/esif_cmp.so $pkgdir/usr/share/dptf/ufx64
	install -Dm644 $srcdir/dptf/ESIF/Products/ESIF_WS/Linux/esif_ws.so $pkgdir/usr/share/dptf/ufx64
	mkdir -p $pkgdir/lib/systemd/system
	install -Dm644 $srcdir/dptf/ESIF/Packages/Installers/linux/dptf.service $pkgdir/lib/systemd/system
}
