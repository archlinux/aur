# Maintainer: Nick Cao <nickcao@nichi.co>
pkgname='dptf'
pkgver='8.4.10401'
pkgrel=3
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
	install -Dm644 $srcdir/dptf/DPTF/Linux/build/x64/release/Dptf.so $pkgdir/usr/share/dptf/ufx64/Dptf.so
	install -Dm644 $srcdir/dptf/DPTF/Linux/build/x64/release/DptfPolicyActive.so $pkgdir/usr/share/dptf/ufx64/DptfPolicyActive.so
	install -Dm644 $srcdir/dptf/DPTF/Linux/build/x64/release/DptfPolicyCritical.so $pkgdir/usr/share/dptf/ufx64/DptfPolicyCritical.so
	install -Dm644 $srcdir/dptf/DPTF/Linux/build/x64/release/DptfPolicyPassive.so $pkgdir/usr/share/dptf/ufx64/DptfPolicyPassive.so
	install -Dm644 $srcdir/dptf/ESIF/Products/ESIF_CMP/Linux/esif_cmp.so $pkgdir/usr/share/dptf/ufx64/esif_cmp.so
	install -Dm644 $srcdir/dptf/ESIF/Products/ESIF_WS/Linux/esif_ws.so $pkgdir/usr/share/dptf/ufx64/esif_ws.so
	install -Dm644 $srcdir/dptf/ESIF/Packages/DSP/dsp.dv $pkgdir/etc/dptf/dsp.dv
	install -Dm744 $srcdir/dptf/ESIF/Products/ESIF_UF/Linux/esif_ufd $pkgdir/usr/bin/esif_ufd
	install -Dm644 $srcdir/dptf/ESIF/Packages/Installers/linux/dptf.service $pkgdir/usr/lib/systemd/system/dptf.service
	install -Dm644 $srcdir/dptf/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
