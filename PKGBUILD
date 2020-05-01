# Mali driver for mainline linux on Midgard platforms
# Maintainer: Ruben Van Boxem <vanboxem.ruben@gmail.com>

buildarch=8

pkgname=mali-midgard-dkms
pkgver=r28p0
pkgrel=1
pkgdesc="Mali Midgard Kernel Module for mainline linux"
arch=('aarch64')
url="https://github.com/LibreELEC/mali-midgard"
license=('GPLv2')
install="$pkgname".install
depends=('linux' 'linux-headers' 'dkms')
makedepends=('git')
provides=('dkms-mali')
conflicts=('dkms-mali')
options=(!strip)
_gitname=mali-midgard
source=("git+https://github.com/LibreELEC/$_gitname.git"
        "0001-add-mm_trace_rss_stat-stub.patch"
        "dkms.conf")
md5sums=('SKIP'
         'ac76eb20c5cc565241abf1ccd61086d7'
         '491eacc5c88783991f8089f0ca73d647')

prepare() {
	cd $srcdir/$_gitname

	patch -p1 -i ../0001-add-mm_trace_rss_stat-stub.patch

	find . -name Kbuild -exec sed -i 's/mali_kbase.o/mali_midgard.o/g; s/mali_kbase-/mali_midgard-/g' {} \;
}

package() {
	cp dkms.conf "$srcdir/$_gitname/driver/product/kernel/drivers/gpu/arm/midgard"
	cd "$srcdir/$_gitname/driver//product/kernel/drivers/gpu/arm/midgard"
	mkdir -p "$pkgdir/usr/src/mali-midgard-$pkgver"
	cp -r . "$pkgdir/usr/src/mali-midgard-$pkgver"
}
