#Maintainer: Armin Luntzer <armin.luntzer@univie.ac.at>

pkgname=star-system
pkgver=5.04
pkgrel=2
pkgdesc="STAR-System is the new driver and API system provided with all new and future STAR-Dundee interface and router devices."
arch=('x86_64')
url="http://www.star-dundee.com"
license=('custom')
optdepends=('qt5-multimedia')
makedepends=('linux-headers' 'fakeroot')

source=("file://star-system_linux_x86-64_v5.04.tgz"
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

	make -f Kbuild EXTRA_CFLAGS=-DSTAR_TRY_NEWER_KERNEL CONFIG_WERROR=n
	cp star_spw_pci.ko ../

	# pcie
	#
	cd ${srcdir}/tmp/driver_src/ultra_pcie_driver
	cp objects/x86-64/*.o_shipped .

	make -f Kbuild EXTRA_CFLAGS=-DSTAR_TRY_NEWER_KERNEL CONFIG_WERROR=n
	cp star_ultra_pcie.ko ../


	#usb
	cd ${srcdir}/tmp/driver_src/usb_driver
	cp objects/x86-64/*.o_shipped .

	make -f Kbuild EXTRA_CFLAGS=-DSTAR_TRY_NEWER_KERNEL CONFIG_WERROR=n
	cp star_spw_usb.ko ../

	# build test programs

	cd ${srcdir}/tmp/examples/star_system_test
	CFLAGS='-L../../lib/x86-64 -Wl,-rpath-link=../../lib/x86-64' make

	cd ${srcdir}/tmp/examples/performance_tester
	CFLAGS='-L../../lib/x86-64 -Wl,-rpath-link=../../lib/x86-64' make

	cd ${srcdir}/tmp/examples/time-code_test
	CFLAGS='-L../../lib/x86-64 -Wl,-rpath-link=../../lib/x86-64' make

	cd ${srcdir}/tmp/examples/rmap
	CFLAGS='-L../../lib/x86-64 -Wl,-rpath-link=../../lib/x86-64' make

	cd ${srcdir}/tmp/examples/config/brickMk2_configuration
	CFLAGS='-L../../../lib/x86-64 -Wl,-rpath-link=../../../lib/x86-64' make

	cd ${srcdir}/tmp/examples/config/pciMk2_configuration
	CFLAGS='-L../../../lib/x86-64 -Wl,-rpath-link=../../../lib/x86-64' make

	cd ${srcdir}/tmp/examples/config/routerMk2S_configuration
	CFLAGS='-L../../../lib/x86-64 -Wl,-rpath-link=../../../lib/x86-64' make

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


	cd ${srcdir}/tmp/
	# test binaries
	mkdir -p ${pkgdir}/usr/bin
	install -m755 examples/*/bin/* examples/config/*/bin/* ${pkgdir}/usr/bin

	# GUI binaries
	#mkdir -p ${pkgdir}/usr/bin
	install -m755 $(ls -1 -d lib/x86-64/Qt5/*|grep -v "\.so") ${pkgdir}/usr/bin

	# install service file
	install -Dm644 ${srcdir}/${pkgname}.service ${pkgdir}/etc/systemd/system/${pkgname}.service

	mkdir -p ${pkgdir}/run/lock/subsys
	chgrp uucp ${pkgdir}/run/lock/subsys
	chmod 775  ${pkgdir}/run/lock/subsys

}
