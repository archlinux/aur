# Maintainer: Nick Cao <nickcao@nichi.co>
pkgname=dptf
pkgver=8.4.10401
pkgrel=4
pkgdesc='Intel (R) Dynamic Platform and Thermal Framework (Intel (R) DPTF)'
arch=('x86_64')
url='https://github.com/intel/dptf'
license=('custom')
depends=('readline')
makedepends=('cmake')
source=('https://github.com/intel/dptf/archive/8.4.10401.tar.gz'
	'DPTF.patch'
	'ESIF_UF.patch'
	)
md5sums=('707632f2943e838f379d20a5076fb722'
         '21d5ace7fd8bc7d16baa77695904a9d0'
         '8d9cf347bc11bca7d0380ff35a5f5ebc')
prepare(){
	mv $srcdir/dptf-8.4.10401 $srcdir/dptf
	patch $srcdir/dptf/DPTF/Linux/CMakeLists.txt $srcdir/DPTF.patch
	patch $srcdir/dptf/ESIF/Products/ESIF_UF/Linux/Makefile $srcdir/ESIF_UF.patch
}

build() {
	cd $srcdir/dptf/DPTF/Linux/build
	cmake ..
	make
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
