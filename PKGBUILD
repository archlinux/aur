# Maintainer: Vi0L0 <vi0l093@gmail.com>
# Great Contributor: Eduardo "kensai" Romero (previous maintainer)
# Contributor: csslayer
# Contributor: cvigano
# Contributor: lordheavy
# Contributor: zoqaeski (authatieventsd' patch for lightdm)
# Contributor: zoopp
# Contributor: solar (authatieventsd' patch s/-1/255)
# Contributor: aslmaswd (acpi main script)
# Contributor: npfeiler (libcl/opencl-icd-loader cleaning)

pkgbase=catalyst-utils
pkgname=('catalyst-utils' 'catalyst-libgl' 'opencl-catalyst')

pkgver=15.9
pkgrel=7
_amdver=15.201.1151
arch=('i686' 'x86_64')
url="http://www.amd.com"
license=('custom')
options=('staticlibs' 'libtool' '!strip' '!upx')

url_ref="http://support.amd.com/en-us/download/desktop?os=Linux+x86"
DLAGENTS="http::/usr/bin/curl --referer ${url_ref} -o %o %u"

source=(
    http://www2.ati.com/drivers/linux/amd-catalyst-${pkgver}-linux-installer-${_amdver}-x86.x86_64.zip
    catalyst.sh
    atieventsd.sh
    atieventsd.service
    ati-powermode.sh
    catalyst.conf
    arch-fglrx-authatieventsd_new.patch
    switchlibGL
    switchlibglx
    pxp_switch_catalyst
    temp_links_catalyst
    temp-links-catalyst.service)

md5sums=('d2de2df6946b452c266a3c892e6e46ff'
         'bdafe749e046bfddee2d1c5e90eabd83'
         '9d9ea496eadf7e883d56723d65e96edf'
	 'b79e144932616221f6d01c4b05dc9306'
	 '9e2a7ded987b7d2b2cfffc7281ebd8a5'
	 '3e19c2285c76f4cb92108435a1e9c302'
	 'b3ceefeb97c609037845f65d0956c4f0'
         '394bc493fdf493a5093f9e2095096d02'
         '3226230592fa3c91ff22389114fc5dc7'
         '9e706c272feb167be55ba7201dfa8d51'
	 '0e6d963436dd23dbb45ae0f4fc9b661c'
	 '2c22bb4d4f828cb8b024f670c1ae7e45')

build() {
     /bin/sh ./AMD-Catalyst-${pkgver}-Linux-installer-${_amdver}-x86.x86_64.run --extract archive_files
}

package_catalyst-libgl() {
      pkgdesc="AMD/ATI drivers. Catalyst drivers libraries symlinks + experimental powerXpress support."
      depends=('catalyst-utils' 'mesa')
      conflicts=('libgl' 'mesa-libgl' 'mesa-libgl-git' 'libgles' 'libegl')
      provides=('libgl' 'mesa-libgl' 'mesa-libgl-git' 'libgles' 'libegl')
      install=catalyst-libgl.install

      install -m755 -d ${pkgdir}/usr/lib/xorg/modules/extensions
      ln -snf /usr/lib/xorg/modules/extensions/fglrx/fglrx-libglx.so ${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so

      install -m755 -d ${pkgdir}/usr/lib/fglrx
      ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/fglrx/libGL.so.1.2.0
      ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/fglrx/libGL.so.1
      ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/fglrx/libGL.so
      ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/libGL.so.1.2.0
      ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/libGL.so.1
      ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/libGL.so


      # We have to provide symlinks to mesa, as catalyst doesn't ship them
      ln -s /usr/lib/mesa/libEGL.so.1.0.0 ${pkgdir}/usr/lib/libEGL.so.1.0.0
      ln -s libEGL.so.1.0.0	          ${pkgdir}/usr/lib/libEGL.so.1
      ln -s libEGL.so.1.0.0               ${pkgdir}/usr/lib/libEGL.so

      ln -s /usr/lib/mesa/libGLESv1_CM.so.1.1.0 ${pkgdir}/usr/lib/libGLESv1_CM.so.1.1.0
      ln -s libGLESv1_CM.so.1.1.0	        ${pkgdir}/usr/lib/libGLESv1_CM.so.1
      ln -s libGLESv1_CM.so.1.1.0               ${pkgdir}/usr/lib/libGLESv1_CM.so

      ln -s /usr/lib/mesa/libGLESv2.so.2.0.0 ${pkgdir}/usr/lib/libGLESv2.so.2.0.0
      ln -s libGLESv2.so.2.0.0               ${pkgdir}/usr/lib/libGLESv2.so.2
      ln -s libGLESv2.so.2.0.0               ${pkgdir}/usr/lib/libGLESv2.so


     # powerXpress
      install -m755 ${srcdir}/switchlibGL ${pkgdir}/usr/lib/fglrx
      install -m755 ${srcdir}/switchlibglx ${pkgdir}/usr/lib/fglrx
      # switching script: switch xorg.conf + aticonfig --px-Xgpu + switchlibGL + add/remove fglrx into MODULES
      install -m755 -d ${pkgdir}/usr/bin
      install -m755 ${srcdir}/pxp_switch_catalyst ${pkgdir}/usr/bin
	
     # License
      install -m755 -d ${pkgdir}/usr/share/licenses
      ln -s catalyst-utils ${pkgdir}/usr/share/licenses/${pkgname}
}

package_opencl-catalyst() {
      pkgdesc="AMD/ATI drivers. OpenCL implemention for AMD Catalyst"
      provides=('opencl-driver')
      depends=('gcc-libs')
      optdepends=('opencl-headers: headers necessary for OpenCL development'
                'opencl-icd-loader: OpenCL ICD Bindings')
      conflicts=('opencl-amd')


      if [ "${CARCH}" = "i686" ]; then
	cd ${srcdir}/archive_files/arch/x86
	_arc=32
	_lib=lib
      elif [ "${CARCH}" = "x86_64" ]; then
	cd ${srcdir}/archive_files/arch/x86_64
	_arc=64
	_lib=lib64
      fi

      install -m755 -d ${pkgdir}/etc/OpenCL/vendors
      install -m644 etc/OpenCL/vendors/amdocl${_arc}.icd ${pkgdir}/etc/OpenCL/vendors

      install -m755 -d ${pkgdir}/usr/lib
      install -m755 usr/${_lib}/libamdocl*.so ${pkgdir}/usr/lib
#       install -m755 usr/${_lib}/libOpenCL.so.1 ${pkgdir}/usr/lib      #opencl-icd-loader provides this
#       ln -s libOpenCL.so.1 ${pkgdir}/usr/lib/libOpenCL.so

      install -m755 -d ${pkgdir}/usr/bin
      install -m755 usr/bin/clinfo ${pkgdir}/usr/bin

     # License
      install -m755 -d ${pkgdir}/usr/share/licenses
      ln -s catalyst-utils ${pkgdir}/usr/share/licenses/${pkgname}
}

package_catalyst-utils() {
      pkgdesc="AMD/ATI drivers. Utilities and libraries. Radeons HD 2 3 4 xxx ARE NOT SUPPORTED"
      depends=('xorg-server>=1.7.0' 'xorg-server<1.18.0' 'libxrandr' 'libsm' 'fontconfig' 'libxcursor' 'libxi' 'gcc-libs' 'libxinerama')
      optdepends=('qt4: to run ATi Catalyst Control Center (amdcccle)'
		  'libxxf86vm: to run ATi Catalyst Control Center (amdcccle)'
		  'acpid: acpi event support  / atieventsd'
		  'catalyst-libgl: Catalyst drivers libraries symlinks.'
		  'opencl-catalyst: OpenCL implemention for AMD Catalyst'
		  'procps-ng: brings pgrep used in acpi event support')
      if [ "${CARCH}" = "x86_64" ]; then
      optdepends+=('lib32-catalyst-utils: Utilities and libraries (32-bit)')
      fi
      conflicts=('catalyst-test' 'catalyst-total' 'catalyst-total-pxp' 'catalyst-utils-pxp')
      provides=("libatical=${pkgver}" 'dri' 'libtxc_dxtn')
      install=catalyst-utils.install

  ## Install userspace tools and libraries
    # Create directories
      install -m755 -d ${pkgdir}/etc/ati
      install -m755 -d ${pkgdir}/etc/rc.d
      install -m755 -d ${pkgdir}/etc/profile.d
      install -m755 -d ${pkgdir}/etc/acpi/events
      install -m755 -d ${pkgdir}/etc/security/console.apps

      install -m755 -d ${pkgdir}/usr/lib/xorg/modules/dri
      install -m755 -d ${pkgdir}/usr/lib/xorg/modules/drivers
      install -m755 -d ${pkgdir}/usr/lib/xorg/modules/extensions/fglrx
      install -m755 -d ${pkgdir}/usr/lib/xorg/modules/linux
      install -m755 -d ${pkgdir}/usr/lib/dri
      install -m755 -d ${pkgdir}/usr/lib/fglrx
      install -m755 -d ${pkgdir}/usr/lib/systemd/system
#       install -m755 -d ${pkgdir}/usr/lib/hsa

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
      install -m755 X11R6/${_lib}/libAMDXvBA.so.1.0 ${pkgdir}/usr/lib
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
#       install  -m755 ${_lib}/hsa/* ${pkgdir}/usr/lib/hsa

    ## QT libs (only 2 files) - un-comment 2 lines below if you don't want to install qt package
#      install -m755 -d ${pkgdir}/usr/share/ati/${_lib}
#      install -m755 share/ati/${_lib}/*.so* ${pkgdir}/usr/share/ati/${_lib}

      ln -snf /usr/lib/xorg/modules/dri/fglrx_dri.so ${pkgdir}/usr/lib/dri/fglrx_dri.so
      ln -snf libfglrx_dm.so.1.0 ${pkgdir}/usr/lib/libfglrx_dm.so.1
      ln -snf libfglrx_dm.so.1.0 ${pkgdir}/usr/lib/libfglrx_dm.so
      ln -snf libatiuki.so.1.0 ${pkgdir}/usr/lib/libatiuki.so.1
      ln -snf libatiuki.so.1.0 ${pkgdir}/usr/lib/libatiuki.so

     # provided in opencl-catalyst package
      rm ${pkgdir}/usr/lib/lib{amdocl*,OpenCL}.so* 

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

      install -m755 -d ${pkgdir}/etc/modules-load.d
      install -m644 ${srcdir}/catalyst.conf ${pkgdir}/etc/modules-load.d

    #workaround for the high io bug , thanks to lano1106 for finding this ugly bug! https://bbs.archlinux.org/viewtopic.php?pid=1279977#p1279977
      install -m755 ${srcdir}/temp_links_catalyst ${pkgdir}/usr/bin
      install -m644 ${srcdir}/temp-links-catalyst.service ${pkgdir}/usr/lib/systemd/system
}
