# Maintainer: Vi0L0 <vi0l093@gmail.com>
# Great Contributor: Shen Miren <dickeny@gmail.com> (build_module/hook idea and code)
# Great Contributor: Eduardo "kensai" Romero (previous catalyst and catalyst-utils maintainer)
# Contributor: Manuel Gaul <inkaine@hotmail.com> (previous lib32-catalyst-utils maintainer)
# Contributor: osmano807
# Contributor: csslayer
# Contributor: cyberpatrol
# Contributor: aidanlinz
# Contributor: Rip-Rip
# Contributor: OvsInc
# Contributor: Enverex & kidoz
# Contributor: nob
# Contributor: lordheavy
# Contributor: fnf
# Contributor: lano1106 (patch to fix support of intel's iommu and to remove dependency of kernel's CONFIG_AGP option)
# Contributor: lano1106 (patch to remove dependency of kernel's CONFIG_AGP option)
# Contributor: zoqaeski (authatieventsd' patch for lightdm)
# Contributor: lano1106 (patch to improve jacob's patch)
# Contributor: zoopp
# Contributor: solar (authatieventsd' patch s/-1/255)
# Contributor: kolasa (part of 4.3 kernel patches)
# Contributor: gentoo (part of 4.3 kernel patches)
# Contributor: Philip Muller @ Manjaro (4.4 kernel patch)
# Contributor: aslmaswd (acpi main script)
# Contributor: npfeiler (libcl/opencl-icd-loader cleaning)
# Contributor: sling00 (4.10 kernel patch)
# Contributor: npfeiler (4.11, 4.12, 4.13, 4.14, 4.15.5, 4.17 and 4.20 kernel patch)

_old_control=n #for pre-GCN users who has problems with default config, pick =y to use control file and opencl runtime from catalyst 15.9

pkgname=catalyst-test
pkgver=15.12
pkgrel=28
# _betano=1.0
_amdver=15.302
pkgdesc="AMD/ATI Catalyst drivers for linux AKA Crimson. catalyst-dkms + catalyst-utils + lib32-catalyst-utils + experimental powerXpress suppport. PRE-GCN Radeons are optionally supported"
arch=('i686' 'x86_64')
url="http://www.amd.com"
license=('custom')
options=('staticlibs' 'libtool' '!strip')
depends=('dkms' 'linux>=3.0' 'linux<4.21' 'linux-headers' 'xorg-server>=1.7.0' 'xorg-server<1.18.0' 'libxrandr' 'libsm' 'fontconfig' 'libxcursor' 'libxi' 'gcc-libs' 'gcc>4.0.0' 'make' 'patch' 'libxinerama' 'mesa-noglvnd')
optdepends=('qt4: to run ATi Catalyst Control Center (amdcccle)'
	'libxxf86vm: to run ATi Catalyst Control Center (amdcccle)'
	'opencl-headers: headers necessary for OpenCL development'
	'acpid: acpi event support  / atieventsd'
	'procps-ng: brings pgrep used in acpi event support'
	'opencl-icd-loader: OpenCL ICD Bindings')
conflicts=('libgl' 'catalyst' 'catalyst-daemon' 'catalyst-generator' 'catalyst-hook' 'catalyst-utils' 'catalyst-dkms' 'opencl-catalyst' 'mesa-libgl' 'mesa-libgl-git' 'libgles' 'libegl' 'opencl-amd' 'libglvnd' 'catalyst-control')
provides=('libgl' "libatical=${pkgver}" "catalyst=${pkgver}" "catalyst-utils=${pkgver}" "catalyst-dkms=${pkgver}" "catalyst-hook=${pkgver}" "catalyst-libgl=${pkgver}" "opencl-catalyst=${pkgver}" 'dri' 'libtxc_dxtn' 'mesa-libgl' 'mesa-libgl-git' 'opencl-driver' 'libgles' 'libegl')

if [ "${CARCH}" = "x86_64" ]; then
	warning "x86_64 system detected"
	warning "[multilib] repository must be uncommented in /etc/pacman.conf to add lib32-catalyst-utils into the package"
	if [[ $(cat /etc/pacman.conf | grep -c "#\[multilib]") == 0 ]]; then
		warning "OK, lib32-catalyst-utils will be added to the package"
		depends+=('lib32-libxext' 'lib32-libdrm' 'lib32-libxinerama' 'lib32-mesa-noglvnd')
		conflicts+=('lib32-libgl' 'lib32-catalyst-utils' 'lib32-opencl-catalyst' 'lib32-mesa-libgl' 'lib32-mesa-libgl-git' 'lib32-libgles' 'lib32-libegl' 'lib32-opencl-amd' 'lib32-libglvnd')
		provides+=('lib32-libgl' "lib32-catalyst-utils=${pkgver}" "lib32-catalyst-libgl=${pkgver}" "lib32-opencl-catalyst=${pkgver}" 'lib32-dri' 'lib32-libtxc_dxtn' 'lib32-mesa-libgl' 'lib32-mesa-libgl-git' 'lib32-opencl-driver' 'lib32-libgles' 'lib32-libegl')
		optdepends+=('lib32-opencl-icd-loader: OpenCL ICD Bindings (32-bit)')
	else
		warning "lib32-catalyst-utils will NOT be added to the package"
	fi
fi

install=${pkgname}.install

url_ref="https://support.amd.com/en-us/kb-articles/Pages/latest-linux-beta-driver.aspx"
DLAGENTS="https::/usr/bin/curl --referer ${url_ref} -o %o %u"

source=(
	#    http://www2.ati.com/drivers/beta/amd-catalyst-${pkgver}-beta-v${_betano}-linux-x86.x86_64.run.zip
	#     http://www2.ati.com/drivers/linux/amd-catalyst-${pkgver}-linux-x86.x86_64.zip
	#     http://www2.ati.com/drivers/linux/amd-catalyst-${pkgver/./-}-linux-x86-x86-64.zip
	#     http://www2.ati.com/drivers/linux/amd-catalyst-omega-14.12-linux-run-installers.zip
	#     http://www2.ati.com/drivers/linux/amd-driver-installer-${_amdver}-x86.x86_64.zip
	https://www2.ati.com/drivers/linux/radeon-crimson-15.12-15.302-151217a-297685e.zip
	lib32-catalyst.sh
	catalyst.sh
	atieventsd.sh
	atieventsd.service
	ati-powermode.sh
	catalyst.conf
	arch-fglrx-authatieventsd_new.patch
	makefile_compat.patch
	switchlibGL
	switchlibglx
	pxp_switch_catalyst
	temp_links_catalyst
	temp-links-catalyst.service
	lano1106_fglrx_intel_iommu.patch
	lano1106_kcl_agp_13_4.patch
	fglrx_gpl_symbol.patch
	4.3-kolasa-seq_printf.patch
	4.3-gentoo-mtrr.patch
	crimson_i686_xg.patch
	4.4-manjaro-xstate.patch
	grsec_arch.patch
	4.6-arch-get_user_pages-page_cache_release.patch
	dkms.conf
	makesh-dont-check-gcc-version.patch
	4.7-arch-cpu_has_pge-v2.patch
	4.9_over_4.6-arch-get_user_pages_remote.patch
	catalyst-15.9_control_file.tar.gz
	4.10-arch-sling00-virtual_address-acpi_get_table_with_size.patch
	4.11-npfeiler-signal_vmf.patch
	4.12-npfeiler-PUD_OFFSET.patch
	4.12-arch-remove_clts.patch
	4.12-npfeiler-movsl_mask.patch
	4.13-npfeiler-wait_queue_t.patch
	4.14-npfeiler-task_struct-mm_segment_t.patch
	4.14.21_4.15.5-npfeiler-flush_tlb_one_kernel.patch
	4.17-npfeiler-pci_get_domain_bus_and_slot.patch
	4.20-npfeiler-libfglrx_ip.patch)

md5sums=('39808c8a9bcc9041f1305e3531b60622'
         'af7fb8ee4fc96fd54c5b483e33dc71c4'
         'bdafe749e046bfddee2d1c5e90eabd83'
         '9d9ea496eadf7e883d56723d65e96edf'
         'b79e144932616221f6d01c4b05dc9306'
         '9e2a7ded987b7d2b2cfffc7281ebd8a5'
         '3e19c2285c76f4cb92108435a1e9c302'
         'b3ceefeb97c609037845f65d0956c4f0'
         '3e1b82bd69774ea808da69c983d6a43b'
         'cb89e8621b47dc476dcc52df6c12a8c5'
         '3226230592fa3c91ff22389114fc5dc7'
         '0d3d706bc3e4608515f04fa77eb281d1'
         '0e6d963436dd23dbb45ae0f4fc9b661c'
         '2c22bb4d4f828cb8b024f670c1ae7e45'
         '5184b94a2a40216a67996999481dd9ee'
         'c5156eddf81c8a1719b160d05a2e8d67'
         'ef97fc080ce7e5a275fe0c372bc2a418'
         '0e0666e95d1d590a7a83192805679485'
         '98828e3eeaec2b3795e584883cc1b746'
         '6cdbaf5f71d867d225721a0369413616'
         'd9bea135ae3e1b3ca87c5bbe6dcf8e72'
         '8941e91fc58cb44ce21ab9bda135754e'
         '11b7c2e0dc4794801005d66b0e7608a3'
         '23d569abfdd7de433d76e003e4b3ccf9'
         '10829e3b992b3e80a6e78c8e27748703'
         '37eef5103a11d8136979463e7bc31091'
         '194cb44e9e2ab0e65b6267aca66d0400'
         'e98e50bebe96b08ca680aed6ca505356'
         '05f6364db877d9c4bdf1592deda905b7'
         '8e53ba65a0aad42eb2ff771c1ace6609'
         'f090e47160403e4ba65d1e0de69973c9'
         '782769206ed12ded10c347be3e476729'
         'cb25bc7fbb7d5cb1c07d2f3fa5fda826'
         '0a725f40bc980d578cbed3e57a05b765'
         '5ba3bf9f58aa63c1849b056cf23022c9'
         '10af58c21e4e972115dda6dbd8279594'
         '7ed6e1cf3a9719e6a9874e6a18f29bfb'
         '3ca961ceefbc4ddc0eb21452cba79c6c')

if [ "${_old_control}" = "y" ]; then
	source+=(https://www2.ati.com/drivers/linux/amd-catalyst-15.9-linux-installer-15.201.1151-x86.x86_64.zip)
	md5sums+=('d2de2df6946b452c266a3c892e6e46ff')
fi

prepare() {
	## Unpack archive
	/bin/sh ./fglrx-${_amdver}/amd-driver-installer-${_amdver}-x86.x86_64.run --extract archive_files
	if [ "${_old_control}" = "y" ]; then
		/bin/sh ./AMD-Catalyst-15.9-Linux-installer-15.201.1151-x86.x86_64.run --extract archive_files_2
	fi
	# mkdir common
	# mv etc lib usr common
	# mkdir archive_files
	# mv arch common xpic xpic_64a archive_files

	## Patch
	cd ${srcdir}/archive_files
	patch -Np1 -i ../makefile_compat.patch
	patch -Np1 -i ../lano1106_fglrx_intel_iommu.patch
	patch -Np1 -i ../lano1106_kcl_agp_13_4.patch
	patch -Np1 -i ../fglrx_gpl_symbol.patch
	patch -Np1 -i ../4.3-kolasa-seq_printf.patch
	patch -Np1 -i ../4.3-gentoo-mtrr.patch
	test "${CARCH}" = "i686" && patch -Np1 -i ../crimson_i686_xg.patch
	patch -Np1 -i ../4.4-manjaro-xstate.patch
	patch -Np1 -i ../grsec_arch.patch
	patch -Np1 -i ../4.6-arch-get_user_pages-page_cache_release.patch
	patch -Np1 -i ../makesh-dont-check-gcc-version.patch
	patch -Np1 -i ../4.7-arch-cpu_has_pge-v2.patch
	patch -Np1 -i ../4.9_over_4.6-arch-get_user_pages_remote.patch
	patch -Np1 -i ../4.10-arch-sling00-virtual_address-acpi_get_table_with_size.patch
	patch -Np1 -i ../4.11-npfeiler-signal_vmf.patch
	patch -Np1 -i ../4.12-npfeiler-PUD_OFFSET.patch
	patch -Np1 -i ../4.12-arch-remove_clts.patch
	patch -Np1 -i ../4.12-npfeiler-movsl_mask.patch
	patch -Np1 -i ../4.13-npfeiler-wait_queue_t.patch
	patch -Np1 -i ../4.14-npfeiler-task_struct-mm_segment_t.patch
	patch -Np1 -i ../4.14.21_4.15.5-npfeiler-flush_tlb_one_kernel.patch
	patch -Np1 -i ../4.17-npfeiler-pci_get_domain_bus_and_slot.patch
	patch -Np1 -i ../4.20-npfeiler-libfglrx_ip.patch

	cd ${srcdir}/archive_files/common
	patch -Np2 -i ${srcdir}/arch-fglrx-authatieventsd_new.patch
}

package() {
	##catalyst-utils section
	## Install userspace tools and libraries
	# Create directories
	install -m755 -d ${pkgdir}/etc/ati
	install -m755 -d ${pkgdir}/etc/rc.d
	install -m755 -d ${pkgdir}/etc/profile.d
	install -m755 -d ${pkgdir}/etc/acpi/events
	install -m755 -d ${pkgdir}/etc/security/console.apps
	install -m755 -d ${pkgdir}/etc/OpenCL/vendors

	install -m755 -d ${pkgdir}/usr/lib/xorg/modules/drivers
	install -m755 -d ${pkgdir}/usr/lib/xorg/modules/extensions
	install -m755 -d ${pkgdir}/usr/lib/xorg/modules/extensions/fglrx
	install -m755 -d ${pkgdir}/usr/lib/xorg/modules/linux
	install -m755 -d ${pkgdir}/usr/lib/dri
	install -m755 -d ${pkgdir}/usr/lib/fglrx
	install -m755 -d ${pkgdir}/usr/lib/systemd/system
	#       install -m755 -d ${pkgdir}/usr/lib/hsa		#removed in 14.1

	install -m755 -d ${pkgdir}/usr/bin

	install -m755 -d ${pkgdir}/usr/include/GL

	install -m755 -d ${pkgdir}/usr/share/applications
	install -m755 -d ${pkgdir}/usr/share/ati/amdcccle
	install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}
	install -m755 -d ${pkgdir}/usr/share/man/man8
	install -m755 -d ${pkgdir}/usr/share/pixmaps

	# X.org driver
	if [ "${CARCH}" = "i686" ]; then
		cd ${srcdir}/archive_files/xpic/usr/X11R6/lib/modules
	elif [ "${CARCH}" = "x86_64" ]; then
		cd ${srcdir}/archive_files/xpic_64a/usr/X11R6/lib64/modules
	fi

	install -m755 *.so ${pkgdir}/usr/lib/xorg/modules
	install -m755 drivers/*.so ${pkgdir}/usr/lib/xorg/modules/drivers
	install -m755 linux/*.so ${pkgdir}/usr/lib/xorg/modules/linux
	install -m755 extensions/fglrx/fglrx-libglx.so ${pkgdir}/usr/lib/xorg/modules/extensions/fglrx/fglrx-libglx.so
	ln -s /usr/lib/xorg/modules/extensions/fglrx/fglrx-libglx.so ${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so

	# Controlcenter / libraries
	if [ "${CARCH}" = "i686" ]; then
		cd ${srcdir}/archive_files/arch/x86/usr
		_lib=lib
		_amdarch=x86
	elif [ "${CARCH}" = "x86_64" ]; then
		cd ${srcdir}/archive_files/arch/x86_64/usr
		_lib=lib64
		_amdarch=x86_64
	fi

	install -m755 X11R6/bin/* ${pkgdir}/usr/bin
	install -m755 sbin/* ${pkgdir}/usr/bin
	install -m755 X11R6/${_lib}/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/fglrx
	install -m755 X11R6/${_lib}/libAMDXvBA.so.1.0 ${pkgdir}/usr/lib
	ln -s libAMDXvBA.so.1.0 ${pkgdir}/usr/lib/libAMDXvBA.so.1
	ln -s libAMDXvBA.so.1.0 ${pkgdir}/usr/lib/libAMDXvBA.so
	install -m755 X11R6/${_lib}/libatiadlxx.so ${pkgdir}/usr/lib
	install -m755 X11R6/${_lib}/libfglrx_dm.so.1.0 ${pkgdir}/usr/lib
	install -m755 X11R6/${_lib}/libXvBAW.so.1.0 ${pkgdir}/usr/lib
	ln -s libXvBAW.so.1.0 ${pkgdir}/usr/lib/libXvBAW.so.1
	ln -s libXvBAW.so.1.0 ${pkgdir}/usr/lib/libXvBAW.so
	ln -s /usr/lib/libXvBAW.so.1.0 ${pkgdir}/usr/lib/dri/fglrx_drv_video.so #omega 14.12
	install -m644 X11R6/${_lib}/*.a ${pkgdir}/usr/lib
	install -m644 X11R6/${_lib}/*.cap ${pkgdir}/usr/lib
	install -m755 X11R6/${_lib}/modules/dri/*.so ${pkgdir}/usr/lib/dri
	ln -s /usr/lib/dri ${pkgdir}/usr/lib/xorg/modules/dri
	install -m755 ${_lib}/*.so* ${pkgdir}/usr/lib

	if [ "${_old_control}" = "y" ]; then
		## use opencl runtime from 15.9
		install -m755 ${srcdir}/archive_files_2/arch/${_amdarch}/usr/${_lib}/libamdocl* ${pkgdir}/usr/lib
	fi
	rm ${pkgdir}/usr/lib/libOpenCL.so.1 #opencl-icd-loader provides this
	#       install -m755 ${_lib}/hsa/* ${pkgdir}/usr/lib/hsa		#removed in 14.1

	## QT libs (only 2 files) - un-comment 2 lines below if you don't want to install qt package
	#      install -m755 -d ${pkgdir}/usr/share/ati/${_lib}
	#      install -m755 share/ati/${_lib}/*.so* ${pkgdir}/usr/share/ati/${_lib}

	ln -s libfglrx_dm.so.1.0 ${pkgdir}/usr/lib/libfglrx_dm.so.1
	ln -s libfglrx_dm.so.1 ${pkgdir}/usr/lib/libfglrx_dm.so
	ln -s libatiuki.so.1.0 ${pkgdir}/usr/lib/libatiuki.so.1
	ln -s libatiuki.so.1 ${pkgdir}/usr/lib/libatiuki.so

	ln -s fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/fglrx/libGL.so.1.2.0
	ln -s libGL.so.1.2.0 ${pkgdir}/usr/lib/fglrx/libGL.so.1
	ln -s libGL.so.1 ${pkgdir}/usr/lib/fglrx/libGL.so

	ln -s fglrx/libGL.so.1.2.0 ${pkgdir}/usr/lib/libGL.so.1.2.0
	ln -s libGL.so.1.2.0 ${pkgdir}/usr/lib/libGL.so.1
	ln -s libGL.so.1 ${pkgdir}/usr/lib/libGL.so

	# We have to provide symlinks to mesa, as catalyst doesn't ship them
	ln -s mesa/libEGL.so.1.0.0 ${pkgdir}/usr/lib/libEGL.so.1.0.0
	ln -s libEGL.so.1.0.0 ${pkgdir}/usr/lib/libEGL.so.1
	ln -s libEGL.so.1 ${pkgdir}/usr/lib/libEGL.so

	ln -s mesa/libGLESv1_CM.so.1.0.0 ${pkgdir}/usr/lib/libGLESv1_CM.so.1.0.0
	ln -s libGLESv1_CM.so.1.0.0 ${pkgdir}/usr/lib/libGLESv1_CM.so.1
	ln -s libGLESv1_CM.so.1 ${pkgdir}/usr/lib/libGLESv1_CM.so

	ln -s mesa/libGLESv2.so.2.0.0 ${pkgdir}/usr/lib/libGLESv2.so.2.0.0
	ln -s libGLESv2.so.2.0.0 ${pkgdir}/usr/lib/libGLESv2.so.2
	ln -s libGLESv2.so.2 ${pkgdir}/usr/lib/libGLESv2.so

	cd ${srcdir}/archive_files/common
	install -m644 etc/ati/* ${pkgdir}/etc/ati
	chmod 755 ${pkgdir}/etc/ati/authatieventsd.sh
	if [ "${_old_control}" = "y" ]; then
		rm ${pkgdir}/etc/ati/control
		install -m644 ${srcdir}/catalyst-15.9_control_file ${pkgdir}/etc/ati/control
	fi

	install -m644 etc/security/console.apps/amdcccle-su ${pkgdir}/etc/security/console.apps

	install -m755 usr/X11R6/bin/* ${pkgdir}/usr/bin
	install -m644 usr/include/GL/*.h ${pkgdir}/usr/include/GL
	install -m755 usr/sbin/*.sh ${pkgdir}/usr/bin
	install -m644 usr/share/ati/amdcccle/* ${pkgdir}/usr/share/ati/amdcccle
	install -m644 usr/share/icons/*.xpm ${pkgdir}/usr/share/pixmaps
	install -m644 usr/share/man/man8/*.8 ${pkgdir}/usr/share/man/man8
	install -m644 usr/share/applications/*.desktop ${pkgdir}/usr/share/applications

	# ACPI example files
	#       install -m755 usr/share/doc/fglrx/examples/etc/acpi/*.sh ${pkgdir}/etc/acpi
	#       sed -i -e "s/usr\/X11R6/usr/g" ${pkgdir}/etc/acpi/ati-powermode.sh
	install -m644 usr/share/doc/fglrx/examples/etc/acpi/events/* ${pkgdir}/etc/acpi/events
	# put version modified by aslmaswd - V
	install -m755 ${srcdir}/ati-powermode.sh ${pkgdir}/etc/acpi

	# Add ATI Events Daemon launcher
	install -m755 ${srcdir}/atieventsd.sh ${pkgdir}/etc/rc.d/atieventsd
	install -m644 ${srcdir}/atieventsd.service ${pkgdir}/usr/lib/systemd/system

	# thanks to cerebral, we dont need that damned symlink
	install -m755 ${srcdir}/catalyst.sh ${pkgdir}/etc/profile.d

	# License
	#       install -m644 ${srcdir}/archive_files/LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}
	install -m644 ${srcdir}/archive_files/LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}
	install -m644 ${srcdir}/archive_files/common/usr/share/doc/amdcccle/ccc_copyrights.txt \
		${pkgdir}/usr/share/licenses/${pkgname}/amdcccle_copyrights.txt

	# since 11.11 : opencl files
	if [ "${CARCH}" = "i686" ]; then
		cd ${srcdir}/archive_files/arch/x86
		_arc=32
	elif [ "${CARCH}" = "x86_64" ]; then
		cd ${srcdir}/archive_files/arch/x86_64
		_arc=64
	fi

	install -m644 etc/OpenCL/vendors/amdocl${_arc}.icd ${pkgdir}/etc/OpenCL/vendors
	install -m755 usr/bin/clinfo ${pkgdir}/usr/bin
	install -m755 -d ${pkgdir}/etc/modules-load.d
	install -m644 ${srcdir}/catalyst.conf ${pkgdir}/etc/modules-load.d

	#workaround for the high io bug , thanks to lano1106 for finding this ugly bug! https://bbs.archlinux.org/viewtopic.php?pid=1279977#p1279977
	install -m755 ${srcdir}/temp_links_catalyst ${pkgdir}/usr/bin
	install -m644 ${srcdir}/temp-links-catalyst.service ${pkgdir}/usr/lib/systemd/system

	# powerXpress
	install -m755 ${srcdir}/switchlibGL ${pkgdir}/usr/lib/fglrx
	install -m755 ${srcdir}/switchlibglx ${pkgdir}/usr/lib/fglrx
	# switching script: switch xorg.conf + aticonfig --px-Xgpu + switchlibGL + add/remove fglrx into MODULES
	install -m755 ${srcdir}/pxp_switch_catalyst ${pkgdir}/usr/bin
	
	#fix laptops wake on 4.15+
	install -m755 -d ${pkgdir}/usr/X11R6/lib64/modules/dri
	ln -s /usr/lib/dri/fglrx_dri.so ${pkgdir}/usr/X11R6/lib64/modules/dri/fglrx_dri.so

	##catalyst-dkms section
	cd ${srcdir}/archive_files

	# Prepare modules source files
	install -dm755 ${pkgdir}/usr/src/fglrx-${pkgver}/2.6.x
	_archdir=x86_64
	test "${CARCH}" = "i686" && _archdir=x86
	install -m755 -d ${pkgdir}/usr/src/fglrx-${pkgver}
	install -m644 common/lib/modules/fglrx/build_mod/*.c \
		${pkgdir}/usr/src/fglrx-${pkgver}
	install -m644 common/lib/modules/fglrx/build_mod/*.h \
		${pkgdir}/usr/src/fglrx-${pkgver}
	install -m644 common/lib/modules/fglrx/build_mod/2.6.x/Makefile \
		${pkgdir}/usr/src/fglrx-${pkgver}/2.6.x
	install -m644 common/lib/modules/fglrx/build_mod/make.sh \
		${pkgdir}/usr/src/fglrx-${pkgver}
	install -m644 arch/${_archdir}/lib/modules/fglrx/build_mod/libfglrx_ip.a \
		${pkgdir}/usr/src/fglrx-${pkgver}
	install -m644 arch/${_archdir}/lib/modules/fglrx/build_mod/libfglrx_ip.a ${pkgdir}/usr/lib/fglrx/libfglrx_ip.a_shipped

	# copy dkms.conf and set version
	cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/fglrx-${pkgver}/
	sed -i -e "s/@VERSION@/${pkgver}/" "${pkgdir}/usr/src/fglrx-${pkgver}/dkms.conf"

	##lib32-catalyst-utils section
	if [ "${CARCH}" = "x86_64" ] && [[ $(cat /etc/pacman.conf | grep -c "#\[multilib]") == 0 ]]; then
		cd ${srcdir}
		install -D -m755 lib32-catalyst.sh ${pkgdir}/etc/profile.d/lib32-catalyst.sh
		cd ${srcdir}/archive_files/arch/x86/usr
		install -dm755 ${pkgdir}/usr/lib32
		install -dm755 ${pkgdir}/usr/lib32/fglrx
		install -dm755 ${pkgdir}/usr/lib32/dri
		#	install -dm755 ${pkgdir}/usr/lib32/hsa		#removed in 14.1
		install -m755 lib/*.so* ${pkgdir}/usr/lib32
		if [ "${_old_control}" = "y" ]; then
			## use opencl runtime from 15.9
			install -m755 ${srcdir}/archive_files_2/arch/x86/usr/lib/libamdocl* ${pkgdir}/usr/lib32
		fi
		rm ${pkgdir}/usr/lib32/libOpenCL.so.1 #lib32-opencl-icd-loader provides this
		#	install -m755 lib/hsa/* ${pkgdir}/usr/lib32/hsa		#removed in 14.1
		install -m755 X11R6/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/fglrx
		install -m755 X11R6/lib/libAMDXvBA.so.1.0 ${pkgdir}/usr/lib32
		install -m755 X11R6/lib/libatiadlxx.so ${pkgdir}/usr/lib32
		install -m755 X11R6/lib/libfglrx_dm.so.1.0 ${pkgdir}/usr/lib32
		install -m755 X11R6/lib/libXvBAW.so.1.0 ${pkgdir}/usr/lib32

		install -m755 X11R6/lib/modules/dri/*.so ${pkgdir}/usr/lib32/dri

		cd $pkgdir/usr/lib32
		ln -s libfglrx_dm.so.1.0 ${pkgdir}/usr/lib32/libfglrx_dm.so.1
		ln -s libfglrx_dm.so.1 ${pkgdir}/usr/lib32/libfglrx_dm.so
		ln -s libAMDXvBA.so.1.0 ${pkgdir}/usr/lib32/libAMDXvBA.so.1
		ln -s libAMDXvBA.so.1 ${pkgdir}/usr/lib32/libAMDXvBA.so
		ln -s libXvBAW.so.1.0 ${pkgdir}/usr/lib32/libXvBAW.so.1
		ln -s libXvBAW.so.1 ${pkgdir}/usr/lib32/libXvBAW.so
		ln -s libatiuki.so.1.0 ${pkgdir}/usr/lib32/libatiuki.so.1
		ln -s libatiuki.so.1 ${pkgdir}/usr/lib32/libatiuki.so

		ln -s fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/fglrx/libGL.so.1.2.0
		ln -s libGL.so.1.2.0 ${pkgdir}/usr/lib32/fglrx/libGL.so.1
		ln -s libGL.so.1 ${pkgdir}/usr/lib32/fglrx/libGL.so
		ln -s fglrx/libGL.so.1.2.0 ${pkgdir}/usr/lib32/libGL.so.1.2.0
		ln -s libGL.so.1.2.0 ${pkgdir}/usr/lib32/libGL.so.1
		ln -s libGL.so.1 ${pkgdir}/usr/lib32/libGL.so

		# We have to provide symlinks to lib32-mesa, as catalyst doesn't ship them
		ln -s mesa/libEGL.so.1.0.0 ${pkgdir}/usr/lib32/libEGL.so.1.0.0
		ln -s libEGL.so.1.0.0 ${pkgdir}/usr/lib32/libEGL.so.1
		ln -s libEGL.so.1 ${pkgdir}/usr/lib32/libEGL.so

		ln -s mesa/libGLESv1_CM.so.1.0.0 ${pkgdir}/usr/lib32/libGLESv1_CM.so.1.0.0
		ln -s libGLESv1_CM.so.1.0.0 ${pkgdir}/usr/lib32/libGLESv1_CM.so.1
		ln -s libGLESv1_CM.so.1 ${pkgdir}/usr/lib32/libGLESv1_CM.so

		ln -s mesa/libGLESv2.so.2.0.0 ${pkgdir}/usr/lib32/libGLESv2.so.2.0.0
		ln -s libGLESv2.so.2.0.0 ${pkgdir}/usr/lib32/libGLESv2.so.2
		ln -s libGLESv2.so.2 ${pkgdir}/usr/lib32/libGLESv2.so

		# OpenCL
		install -m755 -d ${pkgdir}/etc/OpenCL/vendors
		install -m644 ${srcdir}/archive_files/arch/x86/etc/OpenCL/vendors/amdocl32.icd ${pkgdir}/etc/OpenCL/vendors
	fi
}
