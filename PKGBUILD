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
# Contributor: zoqaeski (authatieventsd' patch for lightdm)
# Contributor: fnf
# Contributor: jacob @ amd (non-root access rights patch)
# Contributor: lano1106 (patch to improve jacob's patch)
# Contributor: zoopp
# Contributor: solar (authatieventsd' patch s/-1/255)
# Contributor: Cold (current_euid patch)
# Contributor: kolasa (3.19, 4.0 & 4.1 kernel patch)

# PKGEXT='.pkg.tar.gz' # imho time to pack this pkg into tar.xz is too long, unfortunatelly yaourt got problems when ext is different from .pkg.tar.xz - V

pkgname=catalyst-total-pxp
pkgver=15.5
pkgrel=1
#_amdver=15.101.1001
pkgdesc="AMD/ATI drivers with powerXpress support. catalyst-hook + catalyst-utils + lib32-catalyst-utils. Radeons HD 2 3 4 xxx ARE NOT SUPPORTED"
arch=('i686' 'x86_64')
url="http://www.amd.com"
license=('custom')
options=('staticlibs' 'libtool' '!strip' '!upx')
depends=('linux>=3.0' 'linux<4.2' 'linux-headers' 'xorg-server>=1.7.0' 'xorg-server<1.17.0' 'libxrandr' 'libsm' 'fontconfig' 'libxcursor' 'libxi' 'gcc-libs' 'gcc>4.0.0' 'make' 'patch' 'libxinerama')
optdepends=('qt4: to run ATi Catalyst Control Center (amdcccle)'
	    'libxxf86vm: to run ATi Catalyst Control Center (amdcccle)'
	    'opencl-headers: headers necessary for OpenCL development'
	    'acpid: acpi event support  / atieventsd'
	    'linux-lts-headers: to build the fglrx module for the linux-lts kernel')
conflicts=('nvidia-utils' 'nvidia' 'catalyst' 'catalyst-daemon' 'catalyst-generator' 'catalyst-hook' 'catalyst-utils' 'libcl' 'catalyst-dkms')
provides=('libgl' "libatical=${pkgver}" "catalyst=${pkgver}" "catalyst-utils=${pkgver}" "catalyst-hook=${pkgver}" "catalyst-libgl=${pkgver}" "opencl-catalyst=${pkgver}" 'libcl' 'dri' 'libtxc_dxtn')

if [ "${CARCH}" = "x86_64" ]; then
 warning "x86_64 system detected"
 warning "[multilib] repository must be uncommented in /etc/pacman.conf to add lib32-catalyst-utils into the package"
  if [[ `cat /etc/pacman.conf | grep -c "#\[multilib]"` = 0 ]]; then
    warning "OK, lib32-catalyst-utils will be added to the package"
    depends+=('lib32-libxext' 'lib32-libdrm' 'lib32-libxinerama')
    conflicts+=('lib32-nvidia-utils' 'lib32-catalyst-utils' 'lib32-libcl')
    provides+=('lib32-libgl' "lib32-catalyst-utils=${pkgver}" "lib32-catalyst-libgl=${pkgver}" "lib32-opencl-catalyst=${pkgver}" 'lib32-dri' 'lib32-libtxc_dxtn' 'lib32-libcl')
      else
	warning "lib32-catalyst-utils will NOT be added to the package"
  fi
fi

install=${pkgname}.install

url_ref="http://support.amd.com/en-us/download/desktop?os=Linux+x86"
DLAGENTS="http::/usr/bin/curl --referer ${url_ref} -o %o %u"

source=(
    http://www2.ati.com/drivers/linux/amd-catalyst-omega-${pkgver}-linux-run-installers.zip
    catalyst_build_module
    lib32-catalyst.sh
    catalyst.sh
    atieventsd.sh
    atieventsd.service
    catalyst.conf
    arch-fglrx-authatieventsd_new.patch
    hook-fglrx
    ati_make.sh
    makefile_compat.patch
    switchlibGL
    switchlibglx
    catalystpxp.sh
    20-catalystpxp.conf
    pxp_switch_catalyst
    lib32-catalystpxp.sh
    catalyst-hook.service
    temp_links_catalyst
    temp-links-catalyst.service
    lano1106_fglrx_intel_iommu.patch
    lano1106_kcl_agp_13_4.patch
    lano1106_fglrx-13.8_proc.patch
    cold-fglrx-3.14-current_euid.patch
    fglrx_gpl_symbol.patch
    fglrx_3.17rc6-no_hotplug.patch
    kolasa-3.19-get_cpu_var.patch
    kolasa_4.0-cr4-strn.patch
    kolasa_4.1_remove-IRQF_DISABLED.patch)

md5sums=('979f9f2e0948fa6e92ff0125f5c6b575'
	 '4eba5dab3085c929ee22ba68d28eda6b'
	 'af7fb8ee4fc96fd54c5b483e33dc71c4'
         'bdafe749e046bfddee2d1c5e90eabd83'
         '9d9ea496eadf7e883d56723d65e96edf'
	 '90a37e010f4e5f45e270cd000894d553'
	 '3e19c2285c76f4cb92108435a1e9c302'
	 'b3ceefeb97c609037845f65d0956c4f0'
         '9126e1ef0c724f8b57d3ac0fe77efe2f'
	 '62239156a9656c6f41e89a879578925c'
	 '3e1b82bd69774ea808da69c983d6a43b'
         'f98cd932f56fdc4da73ba383926f1ade'
         '52e20085e141c1ff48dff4496bdae889'
         '003d6620ccedde9a3b40e6798e80df24'
         'aa0bbfca2c4b32aa25bbf8024af68978'
         '6b8d659b62442c962b4f3cc0efa19845'
         'a6f2f8c17484624ab36fc3c820bbcb4f'
	 'a64e2eae5addc6d670911ccf94b8cda4'
	 '0e6d963436dd23dbb45ae0f4fc9b661c'
	 '2c22bb4d4f828cb8b024f670c1ae7e45'
	 '5184b94a2a40216a67996999481dd9ee'
	 'c5156eddf81c8a1719b160d05a2e8d67'
	 '2ab4837233de42332753882445373d7b'
	 'ba33b6ef10896d3e1b5e4cd96390b771'
	 'ef97fc080ce7e5a275fe0c372bc2a418'
	 '67a22f624bae95a76638ce269392cb01'
	 '3aa45013515b724a71bbd8e01f98ad99'
	 'dee3df1c5d3ed87363f4304da917fc00'
	 '81a9e38dee025151cccb7e5db2362cfb')

build() {
  ## Unpack archive
     /bin/sh ./amd-catalyst-omega-${pkgver}-linux-run-installers.run --extract archive_files
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
      install -m755 -d ${pkgdir}/usr/lib/xorg/modules/updates/extensions/fglrx
      install -m755 -d ${pkgdir}/usr/lib/xorg/modules/linux
      install -m755 -d ${pkgdir}/usr/lib/dri
      install -m755 -d ${pkgdir}/usr/lib/catalystpxp/fglrx
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
      install -m755 extensions/fglrx/fglrx-libglx.so ${pkgdir}/usr/lib/xorg/modules/updates/extensions/fglrx/fglrx-libglx.so

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

      install -m755 X11R6/${_lib}/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/catalystpxp/fglrx
      install -m755 X11R6/${_lib}/libAMDXvBA.so.1.0 ${pkgdir}/usr/lib/
      ln -snf libAMDXvBA.so.1.0 ${pkgdir}/usr/lib/libAMDXvBA.so.1
      ln -snf libAMDXvBA.so.1.0 ${pkgdir}/usr/lib/libAMDXvBA.so
      install -m755 X11R6/${_lib}/libatiadlxx.so ${pkgdir}/usr/lib
      install -m755 X11R6/${_lib}/libfglrx_dm.so.1.0 ${pkgdir}/usr/lib
      install -m755 X11R6/${_lib}/libXvBAW.so.1.0 ${pkgdir}/usr/lib
      ln -snf libXvBAW.so.1.0 ${pkgdir}/usr/lib/libXvBAW.so.1
      ln -snf libXvBAW.so.1.0 ${pkgdir}/usr/lib/libXvBAW.so
      ln -snf /usr/lib/libXvBAW.so.1.0 ${pkgdir}/usr/lib/dri/fglrx_drv_video.so #omega 14.12
      install -m644 X11R6/${_lib}/*.a ${pkgdir}/usr/lib
      install -m644 X11R6/${_lib}/*.cap ${pkgdir}/usr/lib
      install -m755 X11R6/${_lib}/modules/dri/*.so ${pkgdir}/usr/lib/xorg/modules/dri
      install -m755 ${_lib}/*.so* ${pkgdir}/usr/lib
#       install -m755 ${_lib}/hsa/* ${pkgdir}/usr/lib/hsa		#removed in 14.1

    ## QT libs (only 2 files) - un-comment 2 lines below if you don't want to install qt package
    #      install -m755 -d ${pkgdir}/usr/share/ati/${_lib}
    #      install -m755 share/ati/${_lib}/*.so* ${pkgdir}/usr/share/ati/${_lib}

      ln -snf /usr/lib/xorg/modules/dri/fglrx_dri.so ${pkgdir}/usr/lib/dri/fglrx_dri.so
      ln -snf libfglrx_dm.so.1.0 ${pkgdir}/usr/lib/libfglrx_dm.so.1
      ln -snf libfglrx_dm.so.1.0 ${pkgdir}/usr/lib/libfglrx_dm.so
      ln -snf libatiuki.so.1.0 ${pkgdir}/usr/lib/libatiuki.so.1
      ln -snf libatiuki.so.1.0 ${pkgdir}/usr/lib/libatiuki.so
      ln -snf libOpenCL.so.1 ${pkgdir}/usr/lib/libOpenCL.so


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
      install -m755 usr/share/doc/fglrx/examples/etc/acpi/*.sh ${pkgdir}/etc/acpi
      sed -i -e 's/usr\/X11R6/usr/g' ${pkgdir}/etc/acpi/ati-powermode.sh
      install -m644 usr/share/doc/fglrx/examples/etc/acpi/events/* ${pkgdir}/etc/acpi/events

    # Add ATI Events Daemon launcher
      install -m755 ${srcdir}/atieventsd.sh ${pkgdir}/etc/rc.d/atieventsd
      install -m644 ${srcdir}/atieventsd.service ${pkgdir}/usr/lib/systemd/system

      install -m755 ${srcdir}/catalyst.sh ${pkgdir}/etc/profile.d

    # License
      install -m644 ${srcdir}/archive_files/LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}
      install -Dm644 ${srcdir}/archive_files/common/usr/share/doc/amdcccle/ccc_copyrights.txt \
	${pkgdir}/usr/share/licenses/${pkgname}/amdcccle_copyrights.txt

    # since 11.11 : opencl files
      if [ "${CARCH}" = "i686" ]; then
	cd ${srcdir}/archive_files/arch/x86
	_arc=32
      elif [ "${CARCH}" = "x86_64" ]; then
	cd ${srcdir}/archive_files/arch/x86_64
	_arc=64
      fi

      # since 11.11: amd's vendor file for it's opencl library
      install -m644 etc/OpenCL/vendors/amdocl${_arc}.icd ${pkgdir}/etc/OpenCL/vendors

      # since 11.11: clinfo binary
      install -m755 usr/bin/clinfo ${pkgdir}/usr/bin

      # since 12.8:
      install -m755 -d ${pkgdir}/etc/modules-load.d
      install -m644 ${srcdir}/catalyst.conf ${pkgdir}/etc/modules-load.d

      # powerXpress
	install -m755 ${srcdir}/switchlibGL ${pkgdir}/usr/lib/fglrx
	install -m755 ${srcdir}/switchlibglx ${pkgdir}/usr/lib/fglrx
	# use /usr/lib/catalystpxp dir in 1st place (libGL switch)
	install -m755 ${srcdir}/catalystpxp.sh ${pkgdir}/etc/profile.d
	# use /usr/lib/xorg/modules/updates dir in 1st place (libglx switch)
	install -m755 -d ${pkgdir}/etc/X11/xorg.conf.d
	install -m644 ${srcdir}/20-catalystpxp.conf ${pkgdir}/etc/X11/xorg.conf.d
	# switching script: switch xorg.conf + aticonfig --px-Xgpu + switchlibGL + add/remove fglrx into MODULES
	install -m755 ${srcdir}/pxp_switch_catalyst ${pkgdir}/usr/bin

      #workaround for the high io bug , thanks to lano1106 for finding this ugly bug! https://bbs.archlinux.org/viewtopic.php?pid=1279977#p1279977
	install -m755 ${srcdir}/temp_links_catalyst ${pkgdir}/usr/bin
	install -m644 ${srcdir}/temp-links-catalyst.service ${pkgdir}/usr/lib/systemd/system

##catalyst-hook section
      cd ${srcdir}/archive_files
      patch -Np1 -i ../makefile_compat.patch
      patch -Np1 -i ../lano1106_fglrx_intel_iommu.patch
      patch -Np1 -i ../lano1106_kcl_agp_13_4.patch
      patch -Np1 -i ../lano1106_fglrx-13.8_proc.patch
      patch -Np1 -i ../cold-fglrx-3.14-current_euid.patch
      patch -Np1 -i ../fglrx_3.17rc6-no_hotplug.patch
      patch -Np1 -i ../kolasa-3.19-get_cpu_var.patch
#      test "${CARCH}" = "i686" && patch -Np1 -i ../fglrx_gpl_symbol.patch
#	since 3.19 not only i686 needs gpl symbol - V
      patch -Np1 -i ../fglrx_gpl_symbol.patch
      patch -Np1 -i ../kolasa_4.0-cr4-strn.patch
      patch -Np1 -i ../kolasa_4.1_remove-IRQF_DISABLED.patch

    # Prepare modules source files
      _archdir=x86_64
      test "${CARCH}" = "i686" && _archdir=x86
      install -m755 -d ${pkgdir}/usr/share/ati/build_mod
      install -m644 common/lib/modules/fglrx/build_mod/*.c \
                ${pkgdir}/usr/share/ati/build_mod
      install -m644 common/lib/modules/fglrx/build_mod/*.h \
                ${pkgdir}/usr/share/ati/build_mod
      install -m644 common/lib/modules/fglrx/build_mod/2.6.x/Makefile \
                ${pkgdir}/usr/share/ati/build_mod
      install -m644 arch/${_archdir}/lib/modules/fglrx/build_mod/libfglrx_ip.a \
                ${pkgdir}/usr/share/ati/build_mod
      install -m755 -d ${pkgdir}/usr/bin
      install -m755 ${srcdir}/catalyst_build_module ${pkgdir}/usr/bin

    # modified ati's make.sh script
      install -m755 ${srcdir}/ati_make.sh ${pkgdir}/usr/share/ati/build_mod

    # hook fglrx
      install -m755 -d ${pkgdir}/usr/lib/initcpio/install
      install -m644 ${srcdir}/hook-fglrx ${pkgdir}/usr/lib/initcpio/install/fglrx

    # systemd service to perform fglrx module build at shutdown
      install -m755 -d ${pkgdir}/usr/lib/systemd/system
      install -m644 ${srcdir}/catalyst-hook.service ${pkgdir}/usr/lib/systemd/system


##lib32-catalyst-utils-pxp section
      if [ "${CARCH}" = "x86_64" ] && [[ `cat /etc/pacman.conf | grep -c "#\[multilib]"` = 0 ]]; then
	cd ${srcdir}
	install -D -m755 lib32-catalyst.sh ${pkgdir}/etc/profile.d/lib32-catalyst.sh
	install -D -m755 lib32-catalystpxp.sh ${pkgdir}/etc/profile.d/lib32-catalystpxp.sh

	cd ${srcdir}/archive_files/arch/x86/usr
	install -dm755 ${pkgdir}/usr/lib32/catalystpxp/fglrx
# 	install -dm755 ${pkgdir}/usr/lib32/hsa		#removed in 14.1
	install -dm755 ${pkgdir}/usr/lib32/xorg/modules/dri
	install -m755 lib/*.so* ${pkgdir}/usr/lib32
# 	install -m755 lib/hsa/* ${pkgdir}/usr/lib32/hsa		#removed in 14.1
	install -m755 X11R6/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/catalystpxp/fglrx
	install -m755 X11R6/lib/libAMDXvBA.so.1.0 ${pkgdir}/usr/lib32
	install -m755 X11R6/lib/libatiadlxx.so ${pkgdir}/usr/lib32
	install -m755 X11R6/lib/libfglrx_dm.so.1.0 ${pkgdir}/usr/lib32
	install -m755 X11R6/lib/libXvBAW.so.1.0 ${pkgdir}/usr/lib32
	install -m755 X11R6/lib/modules/dri/*.so ${pkgdir}/usr/lib32/xorg/modules/dri
	ln -snf /usr/lib32/xorg/modules/dri ${pkgdir}/usr/lib32/dri

	cd $pkgdir/usr/lib32
	ln -sf libfglrx_dm.so.1.0 libfglrx_dm.so.1
	ln -sf libAMDXvBA.so.1.0 libAMDXvBA.so.1
	ln -sf libAMDXvBA.so.1.0 libAMDXvBA.so
	ln -sf libXvBAW.so.1.0 libXvBAW.so.1
	ln -sf libXvBAW.so.1.0 libXvBAW.so
	ln -sf libatiuki.so.1.0 libatiuki.so.1
	ln -sf libatiuki.so.1.0 libatiuki.so
	ln -sf libOpenCL.so.1 libOpenCL.so

	install -m755 -d ${pkgdir}/etc/OpenCL/vendors
	install -m644 ${srcdir}/archive_files/arch/x86/etc/OpenCL/vendors/amdocl32.icd ${pkgdir}/etc/OpenCL/vendors
      fi
}