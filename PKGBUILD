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
# Contributor: lano1106 (patch to fix support of intel's iommu and to remove dependency of kernel's CONFIG_AGP option)
# Contributor: Emil Karlson from gentoo (3.10 kernel patch)
# Contributor: zoqaeski (authatieventsd' patch for lightdm)
# Contributor: zoopp
# Contributor: solar (authatieventsd' patch s/-1/255)
# Contributor: Cold (current_euid patch)
# Contributor: ubuntu (parts of 4.0, 4.1 and 4.2 kernel patches)
# Contributor: kolasa (parts of 4.2 and 4.3 kernel patches)
# Contributor: gentoo (patch for 3.10 + part of 4.3 kernel patches)
# Contributor: 	aslmaswd (acpi main script)


# PKGEXT='.pkg.tar.gz' # imho time to pack this pkg into tar.xz is too long, unfortunatelly yaourt got problems when ext is different from .pkg.tar.xz - V

pkgname=catalyst-total-hd234k
pkgver=13.1
pkgrel=36
pkgdesc="AMD/ATI legacy drivers. catalyst-dkms+ catalyst-utils + lib32-catalyst-utils"
arch=('i686' 'x86_64')
url="http://www.amd.com"
license=('custom')
options=('staticlibs' 'libtool' '!strip' '!upx')
depends=('dkms' 'linux>=3.0' 'linux<4.7' 'linux-headers' 'xorg-server>=1.7.0' 'xorg-server<1.13.0' 'libxrandr' 'libsm' 'fontconfig' 'libxcursor' 'libxi' 'gcc-libs' 'gcc>4.0.0' 'make' 'patch' 'libxinerama' 'mesa>=10.1.0-4')
optdepends=('qt4: to run ATi Catalyst Control Center (amdcccle)'
	    'libxxf86vm: to run ATi Catalyst Control Center (amdcccle)'
	    'opencl-headers: headers necessary for OpenCL development'
	    'acpid: acpi event support  / atieventsd'
	    'linux-lts-headers: to build the fglrx module for the linux-lts kernel')
conflicts=('libgl' 'xf86-video-ati' 'xf86-video-radeonhd' 'catalyst-test' 'nvidia-utils' 'nvidia' 'catalyst' 'catalyst-daemon' 'catalyst-generator' 'catalyst-dkms' 'catalyst-utils' 'libcl')
provides=('libgl' "libatical=${pkgver}" "catalyst=${pkgver}" "catalyst-utils=${pkgver}" "catalyst-dkms=${pkgver}" "catalyst-libgl=${pkgver}" "opencl-catalyst=${pkgver}" 'libcl' 'dri' 'libtxc_dxtn')

if [ "${CARCH}" = "x86_64" ]; then
 warning "x86_64 system detected"
 warning "[multilib] repository must be uncommented in /etc/pacman.conf to add lib32-catalyst-utils into the package"
  if [[ `cat /etc/pacman.conf | grep -c "#\[multilib]"` = 0 ]]; then
    warning "OK, lib32-catalyst-utils will be added to the package"
    depends+=('lib32-libxext' 'lib32-libdrm' 'lib32-libxinerama' 'lib32-mesa>=10.1.0-4')
    conflicts+=('lib32-libgl' 'lib32-nvidia-utils' 'lib32-catalyst-utils' 'lib32-libcl')
    provides+=('lib32-libgl' "lib32-catalyst-utils=${pkgver}" "lib32-catalyst-libgl=${pkgver}" "lib32-opencl-catalyst=${pkgver}" 'lib32-dri' 'lib32-libtxc_dxtn' 'lib32-libcl')
      else
	warning "lib32-catalyst-utils will NOT be added to the package"
  fi
fi

install=${pkgname}.install

url_ref="http://support.amd.com/en-us/kb-articles/Pages/latest-linux-beta-driver.aspx"
DLAGENTS="http::/usr/bin/curl --referer ${url_ref} -o %o %u"

source=(
    http://www2.ati.com/drivers/legacy/amd-driver-installer-catalyst-${pkgver}-legacy-linux-x86.x86_64.zip
    lib32-catalyst.sh
    catalyst.sh
    atieventsd.sh
    atieventsd.service
    ati-powermode.sh

    catalyst.conf
    arch-fglrx-authatieventsd_new.patch
    makefile_compat.patch

    3.5-do_mmap.patch
    arch-fglrx-3.7.patch
    gentoo_linux-3.10-proc.diff
    foutrelis_3.10_fix_for_legacy.patch
    lano1106_fglrx_intel_iommu.patch
    lano1106_kcl_agp_13_4.patch
    cold-fglrx-3.14-current_euid.patch
    fglrx_gpl_symbol.patch
    kolasa-3.19-get_cpu_var.patch

    ubuntu_buildfix_kernel_4.0.patch
    ubuntu_buildfix_kernel_4.1.patch
    arch-fglrx-acpi_handle.patch
    4.2-ubuntu_buildfix_kernel_4.2-modified.patch
    4.2-fglrx-has_fpu.patch
    4.2-kolasa-fpu_save_init.patch
    4.3-kolasa-seq_printf.patch
    4.3-gentoo-mtrr.patch

    gcc5-something_something_the_dark_side.patch
    4.4-arch-block_signals.patch
    4.6-arch-get_user_pages-page_cache_release.patch
    
    dkms.conf
    makesh-dont-check-gcc-version.patch
    makesh-src_file.patch)

md5sums=('c07fd1332abe4c742a9a0d0e0d0a90de'
	 'af7fb8ee4fc96fd54c5b483e33dc71c4'
         'bdafe749e046bfddee2d1c5e90eabd83'
         '9d9ea496eadf7e883d56723d65e96edf'
	 'b79e144932616221f6d01c4b05dc9306'
	 '9e2a7ded987b7d2b2cfffc7281ebd8a5'

	 '3e19c2285c76f4cb92108435a1e9c302'
	 'b3ceefeb97c609037845f65d0956c4f0'
	 '3e1b82bd69774ea808da69c983d6a43b'

	 'a450e2e3db61994b09e9d99d95bee837'
	 'ff60c162b46e21e9810a722718023451'
	 '5872d95907a93ada44982e355e91e59d'
	 '5d6b5ae55adfb4909e042f50400a4e2d'
	 '5184b94a2a40216a67996999481dd9ee'
	 'c5156eddf81c8a1719b160d05a2e8d67'
	 'ba33b6ef10896d3e1b5e4cd96390b771'
	 'ef97fc080ce7e5a275fe0c372bc2a418'
	 '3aa45013515b724a71bbd8e01f98ad99'

	 '40aaf97acae268f8f7949e0fecb926d9'
	 '34f818673aec1eb2edb5f913b071ba08'
	 '645422762125052a0f13ecd03d7bf9dd'
	 '65ec204c8013fb5dc6aa624563c14512'
	 'ae67dff6c218e028443dff6eacb26485'
	 'ccfdf4784735a742c53bdc1309f49a51'
	 'cdea2b2055df7d843b6096615e82d030'
	 '98828e3eeaec2b3795e584883cc1b746'

	 'af80a9eb2016811ab79717c2bd370a25'
	 'd200e156e941ec7b0227e399fd20a9c2'
	 'd98bb6d66520bdaeac42b60b75b01ab4'
	 
	 '23d569abfdd7de433d76e003e4b3ccf9'
	 '10829e3b992b3e80a6e78c8e27748703'
	 '6cdc15206cc61e3de456416a9011db07')


build() {
  ## Unpack archive
    /bin/sh ./amd-driver-installer-catalyst-${pkgver}-legacy-linux-x86.x86_64.run --extract archive_files
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

      install -m755 -d ${pkgdir}/usr/lib/xorg/modules/dri
      install -m755 -d ${pkgdir}/usr/lib/xorg/modules/drivers
      install -m755 -d ${pkgdir}/usr/lib/xorg/modules/extensions
      install -m755 -d ${pkgdir}/usr/lib/xorg/modules/extensions/fglrx
      install -m755 -d ${pkgdir}/usr/lib/xorg/modules/linux
      install -m755 -d ${pkgdir}/usr/lib/dri
      install -m755 -d ${pkgdir}/usr/lib/fglrx
      install -m755 -d ${pkgdir}/usr/lib/systemd/system

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
      ln -snf /usr/lib/xorg/modules/extensions/fglrx/fglrx-libglx.so ${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so

    # Controlcenter / libraries
      if [ "${CARCH}" = "i686" ]; then
	cd ${srcdir}/archive_files/arch/x86/usr
	_lib=lib
      elif [ "${CARCH}" = "x86_64" ]; then
	cd ${srcdir}/archive_files/arch/x86_64/usr
	_lib=lib64
      fi

      install -m755 X11R6/bin/* ${pkgdir}/usr/bin
      install -m755 sbin/* ${pkgdir}/usr/bin
      install -m755 X11R6/${_lib}/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/fglrx
      ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/fglrx/libGL.so.1.2
      ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/fglrx-libGL.so.1.2
      ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/libGL.so.1.2
      ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/libGL.so.1
      ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/libGL.so
      install -m755 X11R6/${_lib}/libAMDXvBA.so.1.0 ${pkgdir}/usr/lib
      ln -snf libAMDXvBA.so.1.0 ${pkgdir}/usr/lib/libAMDXvBA.so.1
      ln -snf libAMDXvBA.so.1.0 ${pkgdir}/usr/lib/libAMDXvBA.so
      install -m755 X11R6/${_lib}/libatiadlxx.so ${pkgdir}/usr/lib
      install -m755 X11R6/${_lib}/libfglrx_dm.so.1.0 ${pkgdir}/usr/lib
      install -m755 X11R6/${_lib}/libXvBAW.so.1.0 ${pkgdir}/usr/lib
      ln -snf libXvBAW.so.1.0 ${pkgdir}/usr/lib/libXvBAW.so.1
      ln -snf libXvBAW.so.1.0 ${pkgdir}/usr/lib/libXvBAW.so
      install -m644 X11R6/${_lib}/*.a ${pkgdir}/usr/lib
      install -m644 X11R6/${_lib}/*.cap ${pkgdir}/usr/lib
      install -m755 X11R6/${_lib}/modules/dri/*.so ${pkgdir}/usr/lib/xorg/modules/dri
      install -m755 ${_lib}/*.so* ${pkgdir}/usr/lib

    ## QT libs (only 2 files) - un-comment 2 lines below if you don't want to install qt package
#      install -m755 -d ${pkgdir}/usr/share/ati/${_lib}
#      install -m755 share/ati/${_lib}/*.so* ${pkgdir}/usr/share/ati/${_lib}

      ln -snf /usr/lib/xorg/modules/dri/fglrx_dri.so ${pkgdir}/usr/lib/dri/fglrx_dri.so
      ln -snf libfglrx_dm.so.1.0 ${pkgdir}/usr/lib/libfglrx_dm.so.1
      ln -snf libfglrx_dm.so.1.0 ${pkgdir}/usr/lib/libfglrx_dm.so
      ln -snf libatiuki.so.1.0 ${pkgdir}/usr/lib/libatiuki.so.1
      ln -snf libatiuki.so.1.0 ${pkgdir}/usr/lib/libatiuki.so
      ln -snf libOpenCL.so.1 ${pkgdir}/usr/lib/libOpenCL.so

      # We have to provide symlinks to mesa, as catalyst doesn't ship them
      ln -s /usr/lib/mesa/libEGL.so.1.0.0 ${pkgdir}/usr/lib/libEGL.so.1.0.0
      ln -s libEGL.so.1.0.0	              ${pkgdir}/usr/lib/libEGL.so.1
      ln -s libEGL.so.1.0.0               ${pkgdir}/usr/lib/libEGL.so

      ln -s /usr/lib/mesa/libGLESv1_CM.so.1.1.0 ${pkgdir}/usr/lib/libGLESv1_CM.so.1.1.0
      ln -s libGLESv1_CM.so.1.1.0	            ${pkgdir}/usr/lib/libGLESv1_CM.so.1
      ln -s libGLESv1_CM.so.1.1.0               ${pkgdir}/usr/lib/libGLESv1_CM.so

      ln -s /usr/lib/mesa/libGLESv2.so.2.0.0 ${pkgdir}/usr/lib/libGLESv2.so.2.0.0
      ln -s libGLESv2.so.2.0.0               ${pkgdir}/usr/lib/libGLESv2.so.2
      ln -s libGLESv2.so.2.0.0               ${pkgdir}/usr/lib/libGLESv2.so

      cd ${srcdir}/archive_files/common
      patch -Np2 -i ${srcdir}/arch-fglrx-authatieventsd_new.patch
      install -m644 etc/ati/* ${pkgdir}/etc/ati
      chmod 755 ${pkgdir}/etc/ati/authatieventsd.sh

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


##catalyst-dkms section
      cd ${srcdir}/archive_files
      patch -Np1 -i ../makefile_compat.patch
      patch -Np1 -i ../3.5-do_mmap.patch
      patch -Np1 -i ../arch-fglrx-3.7.patch
      patch -Np0 -i ../gentoo_linux-3.10-proc.diff
      patch -l -Np1 -i ../foutrelis_3.10_fix_for_legacy.patch
      patch -Np1 -i ../lano1106_fglrx_intel_iommu.patch
      patch -Np1 -i ../lano1106_kcl_agp_13_4.patch
      patch -Np1 -i ../cold-fglrx-3.14-current_euid.patch
      patch -Np1 -i ../kolasa-3.19-get_cpu_var.patch
#      test "${CARCH}" = "i686" && patch -Np1 -i ../fglrx_gpl_symbol.patch
#	since 3.19 not only i686 needs gpl symbol - V
      patch -Np1 -i ../fglrx_gpl_symbol.patch
      patch -Np1 -i ../ubuntu_buildfix_kernel_4.0.patch
      patch -Np1 -i ../ubuntu_buildfix_kernel_4.1.patch
      patch -Np1 -i ../arch-fglrx-acpi_handle.patch
      patch -Np1 -i ../4.2-ubuntu_buildfix_kernel_4.2-modified.patch
      patch -Np1 -i ../4.2-fglrx-has_fpu.patch
      patch -Np1 -i ../4.2-kolasa-fpu_save_init.patch
#       patch -Np1 -i ../4.3-kolasa-seq_printf.patch            #not compiling, undeclared m
      patch -Np1 -i ../4.3-gentoo-mtrr.patch
      patch -Np1 -i ../gcc5-something_something_the_dark_side.patch
      patch -Np1 -i ../4.4-arch-block_signals.patch
      patch -Np1 -i ../4.6-arch-get_user_pages-page_cache_release.patch
      patch -Np1 -i ../makesh-dont-check-gcc-version.patch
      patch -Np1 -i ../makesh-src_file.patch


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

    # copy dkms.conf and set version
    cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/fglrx-${pkgver}/
    sed -i -e "s/@VERSION@/${pkgver}/" "${pkgdir}/usr/src/fglrx-${pkgver}/dkms.conf"


##lib32-catalyst-utils section
      if [ "${CARCH}" = "x86_64" ] && [[ `cat /etc/pacman.conf | grep -c "#\[multilib]"` = 0 ]]; then
	cd ${srcdir}
	install -D -m755 lib32-catalyst.sh ${pkgdir}/etc/profile.d/lib32-catalyst.sh
	cd ${srcdir}/archive_files/arch/x86/usr
	install -dm755 ${pkgdir}/usr/lib32
	install -dm755 ${pkgdir}/usr/lib32/fglrx
	install -dm755 ${pkgdir}/usr/lib32/dri
	install -dm755 ${pkgdir}/usr/lib32/xorg/modules/dri
	install -m755 lib/*.so* ${pkgdir}/usr/lib32
	install -m755 X11R6/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/fglrx
	ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/fglrx/libGL.so.1.2
	ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/fglrx-libGL.so.1.2
	ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/libGL.so.1.2
	ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/libGL.so.1
	ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/libGL.so
	install -m755 X11R6/lib/libAMDXvBA.so.1.0 ${pkgdir}/usr/lib32
	install -m755 X11R6/lib/libatiadlxx.so ${pkgdir}/usr/lib32
	install -m755 X11R6/lib/libfglrx_dm.so.1.0 ${pkgdir}/usr/lib32
	install -m755 X11R6/lib/libXvBAW.so.1.0 ${pkgdir}/usr/lib32
	install -m755 X11R6/lib/modules/dri/*.so ${pkgdir}/usr/lib32/xorg/modules/dri
	ln -snf /usr/lib32/xorg/modules/dri/fglrx_dri.so ${pkgdir}/usr/lib32/dri/fglrx_dri.so

	cd $pkgdir/usr/lib32
	ln -sf libfglrx_dm.so.1.0 libfglrx_dm.so.1
	ln -sf libAMDXvBA.so.1.0 libAMDXvBA.so.1
	ln -sf libAMDXvBA.so.1.0 libAMDXvBA.so
	ln -sf libXvBAW.so.1.0 libXvBAW.so.1
	ln -sf libXvBAW.so.1.0 libXvBAW.so
	ln -sf libatiuki.so.1.0 libatiuki.so.1
	ln -sf libatiuki.so.1.0 libatiuki.so
	ln -sf libOpenCL.so.1 libOpenCL.so

      # We have to provide symlinks to lib32-mesa, as catalyst doesn't ship them
	ln -s /usr/lib32/mesa/libEGL.so.1.0.0 ${pkgdir}/usr/lib32/libEGL.so.1.0.0
	ln -s libEGL.so.1.0.0	                ${pkgdir}/usr/lib32/libEGL.so.1
	ln -s libEGL.so.1.0.0                 ${pkgdir}/usr/lib32/libEGL.so

	ln -s /usr/lib32/mesa/libGLESv1_CM.so.1.1.0 ${pkgdir}/usr/lib32/libGLESv1_CM.so.1.1.0
	ln -s libGLESv1_CM.so.1.1.0	              ${pkgdir}/usr/lib32/libGLESv1_CM.so.1
	ln -s libGLESv1_CM.so.1.1.0                 ${pkgdir}/usr/lib32/libGLESv1_CM.so

	ln -s /usr/lib32/mesa/libGLESv2.so.2.0.0 ${pkgdir}/usr/lib32/libGLESv2.so.2.0.0
	ln -s libGLESv2.so.2.0.0                 ${pkgdir}/usr/lib32/libGLESv2.so.2
	ln -s libGLESv2.so.2.0.0                 ${pkgdir}/usr/lib32/libGLESv2.so

	# OpenCL
	install -m755 -d ${pkgdir}/etc/OpenCL/vendors
	install -m644 ${srcdir}/archive_files/arch/x86/etc/OpenCL/vendors/amdocl32.icd ${pkgdir}/etc/OpenCL/vendors
      fi
}
