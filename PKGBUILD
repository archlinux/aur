#Maintainer: Armin Luntzer <armin.luntzer@univie.ac.at>

pkgname=star-system
pkgver=6.00
pkgrel=2
pkgdesc="STAR-System is the new driver and API system provided with all new and future STAR-Dundee interface and router devices."
arch=('x86_64')
url="http://www.star-dundee.com"
license=('custom')
optdepends=('qt5-multimedia')
makedepends=('linux-headers' 'fakeroot')

source=("file://star-system_linux_x86-64_v6.00.tgz"
	"star-system.service"
	"kbuild.patch"
	"version.patch"
	"99-star_spw_usb.rules"
	"99-star_spw_pci.rules"
	"99-star_ultra_pcie.rules")

install=star-system.install

prepare() {

	cd ${srcdir}
	rm -rf ${srcdir}/tmp
	mkdir  ${srcdir}/tmp

	# unpack
	echo -n "Extracting file..."
	tar zxvf star-system.tgz -C ${srcdir}/tmp

	cd ${srcdir}/tmp
	patch -Np0 -i ${srcdir}/kbuild.patch
	patch -Np3 -i ${srcdir}/version.patch
}


build() {
	# pci
	cd ${srcdir}/tmp/driver_src/pci_driver
	cp objects/x86-64/*.o_shipped .
	for file in *.o_shipped; do
		mv -- "$file" "${file%.o_shipped}.o"
	done

	make -f Kbuild EXTRA_CFLAGS=-DSTAR_TRY_NEWER_KERNEL CONFIG_WERROR=n
	cp star_spw_pci.ko ../

	# pcie
	cd ${srcdir}/tmp/driver_src/ultra_pcie_driver
	cp objects/x86-64/*.o_shipped .
	for file in *.o_shipped; do
		mv -- "$file" "${file%.o_shipped}.o"
	done

	make -f Kbuild EXTRA_CFLAGS=-DSTAR_TRY_NEWER_KERNEL CONFIG_WERROR=n
	cp star_ultra_pcie.ko ../

	#usb
	cd ${srcdir}/tmp/driver_src/usb_driver
	cp objects/x86-64/*.o_shipped .
	for file in *.o_shipped; do
		mv -- "$file" "${file%.o_shipped}.o"
	done

	make -f Kbuild EXTRA_CFLAGS=-DSTAR_TRY_NEWER_KERNEL CONFIG_WERROR=n
	cp star_spw_usb.ko ../
}



package() {

	cd ${srcdir}/tmp

	# kernel modules
	mkdir -p ${pkgdir}/usr/lib/modules/$(uname -r)/kernel/drivers/spacewire
	install -m755 driver_src/*.ko ${pkgdir}/usr/lib/modules/$(uname -r)/kernel/drivers/spacewire

	# x64 libraries
	mkdir -p ${pkgdir}/usr/lib
	install -m755 lib/x86-64/*.so ${pkgdir}/usr/lib

	# includes
	mkdir -p ${pkgdir}/usr/include/star
	install -m644 inc/star/* ${pkgdir}/usr/include/star

	# daemon
	mkdir -p ${pkgdir}/usr/bin
	install -m755 lib/x86-64/star_conf_service ${pkgdir}/usr/bin

	# udev rules
	mkdir -p ${pkgdir}/usr/lib/udev/rules.d
	install -m644 ${srcdir}/99-star_spw_usb.rules    ${pkgdir}/usr/lib/udev/rules.d
	install -m644 ${srcdir}/99-star_spw_pci.rules    ${pkgdir}/usr/lib/udev/rules.d
	install -m644 ${srcdir}/99-star_ultra_pcie.rules ${pkgdir}/usr/lib/udev/rules.d

	# GUI binaries
	#mkdir -p ${pkgdir}/usr/bin
	install -m755 $(ls -1 -d lib/x86-64/Qt5/*|grep -v "\.so") ${pkgdir}/usr/bin

	# install service file
	install -Dm644 ${srcdir}/${pkgname}.service ${pkgdir}/etc/systemd/system/${pkgname}.service

	mkdir -p ${pkgdir}/run/lock/subsys
	chgrp uucp ${pkgdir}/run/lock/subsys
	chmod 775  ${pkgdir}/run/lock/subsys

}
sha256sums=('5deb178ac143ad36f478f1ed01375608a23b7e8f1e04d9ef0b39033ade975c83'
            '842d55fd08515bbec1882f80c20fc29a9c28e32aa222718280e37f07794386da'
            'a6f626e79014761d4d86359b7ed08a5f41add4d8d2a04e0c111b83406e97e465'
            '23529acb5a7bc2a6ee9a5370f658dbff1822960daf8257ca940d8c2dbec50f42'
            'ad92ae049b9c6ac3c9a39a23b66b523f970e28aae0348f78dd2362ac5dd15fa7'
            'a8ff051b5ccb1dfbfe4a74c4213a93f8bb81760e6dee4144ab5c300521959947'
            'af73cda3af22bf2e2fa16e3790ca56693c6a18d6ea7d159bc47faace694307f4')
