# Maintainer: Andrew Shark <ashark linuxcomp.ru>

pkgname=supermicro-update-manager
pkgver=2.3.0
pkgrel=1
pkgdesc="manage the firmware and configuration for Supermicro motherboards"
arch=(x86_64)
url="https://www.supermicro.com/en/solutions/management-software/supermicro-update-manager"
license=('custom: EULA')
backup=(etc/sumrc)
source=(local://sum_"$pkgver"_Linux_x86_64_20190808.tar.gz)
sha256sums=("5040a3712dee2567ae081d6f02d667c47ef7da1013963aea7a12b6217e6cec2b")

package() {
	cd sum_"$pkgver"_Linux_x86_64
	
	install -D sumrc.sample "$pkgdir/etc/sumrc"
	sed -i '1{s|.*|# To use this config invoke supermicro-update-manager with --rc_path=/etc/sumrc.|}' "$pkgdir/etc/sumrc"
	sed -i '2{s|.*|# Alternatively, copy this file as .sumrc to your home directory or use needed parameters directly via command line.|}' "$pkgdir/etc/sumrc"
	
	# sum_bios.ko only needed if InBand SMI E7h support is not implemented in BIOS. I have not seen such systems, but if you have, please contact me and I will edit pkgbuild.
	# ExternalData folder contains SMCIPID.txt, tui.fnt, VENID.txt. I do not know when they are used, so did not packaged them.
	
	install -D SUM_UserGuide.pdf "$pkgdir/usr/share/doc/supermicro-update-manager/SUM_UserGuide.pdf"
	install -Dm755 sum "$pkgdir/usr/bin/supermicro-update-manager" # rename executable file to not conflict with gnu sum.
}
