# Maintainer: Vi0L0 <vi0l093@gmail.com>
# Partly based on original PKGBUILD by Mikko Seppala <t-r-a-y@mbnet.fi>
# Contributor: Manuel Gaul <inkaine@hotmail.com>
# Contributor: Enverex & kidoz
# Contributor: zoopp

_pkgbasename=catalyst-utils

pkgbase=lib32-$_pkgbasename
pkgname=('lib32-catalyst-utils' 'lib32-catalyst-libgl' 'lib32-opencl-catalyst')

pkgver=15.5
pkgrel=1
#_amdver=15.101.1001
url="http://www.amd.com"
arch=(x86_64)
license=('custom')
options=('staticlibs' 'libtool' '!strip' '!upx')
source=(
    http://www2.ati.com/drivers/linux/amd-catalyst-omega-${pkgver}-linux-run-installers.zip
    lib32-catalyst.sh)
md5sums=('979f9f2e0948fa6e92ff0125f5c6b575' 'af7fb8ee4fc96fd54c5b483e33dc71c4')

url_ref="http://support.amd.com/en-us/download/desktop?os=Linux+x86"
DLAGENTS="http::/usr/bin/curl --referer ${url_ref} -o %o %u"

build() {
     /bin/sh ./amd-catalyst-omega-${pkgver}-linux-run-installers.run --extract archive_files
}

package_lib32-catalyst-libgl() {
      pkgdesc="AMD/ATI drivers. Catalyst drivers libraries symlinks (32-bit)"
      depends=('lib32-catalyst-utils' 'lib32-mesa>=10.1.0-4')
      conflicts=('lib32-libgl' 'lib32-mesa-libgl' 'lib32-mesa-libgl-git')
      provides=('lib32-libgl' 'lib32-mesa-libgl' 'lib32-mesa-libgl-git')
      install=lib32-catalyst-libgl.install

      install -dm755 ${pkgdir}/usr/lib32/fglrx
      ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/fglrx/libGL.so.1.2.0
      ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/fglrx/libGL.so.1
      ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/fglrx/libGL.so
      ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/libGL.so.1.2.0
      ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/libGL.so.1
      ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/libGL.so


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


     # License
      install -m755 -d ${pkgdir}/usr/share/licenses
      ln -s $_pkgbasename ${pkgdir}/usr/share/licenses/${pkgname}
}

package_lib32-opencl-catalyst() {
      pkgdesc="AMD/ATI drivers. OpenCL implemention for AMD Catalyst (32-bit)"
      provides=('lib32-libcl')
      conflicts=('lib32-libcl')
      depends=('lib32-gcc-libs')
      optdepends=('opencl-headers: headers necessary for OpenCL development')

      install -m755 -d ${pkgdir}/etc/OpenCL/vendors
      install -m644 ${srcdir}/archive_files/arch/x86/etc/OpenCL/vendors/amdocl32.icd ${pkgdir}/etc/OpenCL/vendors

      cd ${srcdir}/archive_files/arch/x86
      install -m755 -d ${pkgdir}/usr/lib32
      install -m755 usr/lib/libamdocl*.so ${pkgdir}/usr/lib32
      install -m755 usr/lib/libOpenCL.so.1 ${pkgdir}/usr/lib32
      ln -s libOpenCL.so.1 ${pkgdir}/usr/lib32/libOpenCL.so

     # License
      install -m755 -d ${pkgdir}/usr/share/licenses
      ln -s $_pkgbasename ${pkgdir}/usr/share/licenses/${pkgname}
}

package_lib32-catalyst-utils() {
      pkgdesc="AMD/ATI drivers. Utilities and libraries (32-bit)"
      depends=('lib32-libxext' 'lib32-libdrm' 'catalyst-utils' 'lib32-libxinerama')
      conflicts=('lib32-catalyst-utils-pxp')
      provides=('lib32-dri' 'lib32-libtxc_dxtn')
      optdepends=('lib32-catalyst-libgl: Catalyst drivers libraries symlinks (32-bit)'
		  'lib32-opencl-catalyst: OpenCL implemention for AMD Catalyst (32-bit)')
      install=lib32-catalyst-utils.install

      cd ${srcdir}
      install -D -m755 lib32-catalyst.sh ${pkgdir}/etc/profile.d/lib32-catalyst.sh
      cd ${srcdir}/archive_files/arch/x86/usr
      install -dm755 ${pkgdir}/usr/lib32/fglrx
#       install -dm755 ${pkgdir}/usr/lib32/hsa
      install -dm755 ${pkgdir}/usr/lib32/xorg/modules/dri
      install -m755 lib/*.so* ${pkgdir}/usr/lib32
#       install -m755 lib/hsa/* ${pkgdir}/usr/lib32/hsa
      install -m755 X11R6/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/fglrx
      install -m755 X11R6/lib/libAMDXvBA.so.1.0 ${pkgdir}/usr/lib32
      install -m755 X11R6/lib/libatiadlxx.so ${pkgdir}/usr/lib32
      install -m755 X11R6/lib/libfglrx_dm.so.1.0 ${pkgdir}/usr/lib32
      install -m755 X11R6/lib/libXvBAW.so.1.0 ${pkgdir}/usr/lib32
      install -m755 X11R6/lib/modules/dri/*.so ${pkgdir}/usr/lib32/xorg/modules/dri
      ln -snf /usr/lib32/xorg/modules/dri ${pkgdir}/usr/lib32/dri

      ln -sf /usr/lib32/libfglrx_dm.so.1.0	${pkgdir}/usr/lib32/libfglrx_dm.so.1
      ln -sf /usr/lib32/libfglrx_dm.so.1.0	${pkgdir}/usr/lib32/libfglrx_dm.so
      ln -sf /usr/lib32/libAMDXvBA.so.1.0	${pkgdir}/usr/lib32/libAMDXvBA.so.1
      ln -sf /usr/lib32/libAMDXvBA.so.1.0	${pkgdir}/usr/lib32/libAMDXvBA.so
      ln -sf /usr/lib32/libXvBAW.so.1.0		${pkgdir}/usr/lib32/libXvBAW.so.1
      ln -sf /usr/lib32/libXvBAW.so.1.0		${pkgdir}/usr/lib32/libXvBAW.so
      ln -sf /usr/lib32/libatiuki.so.1.0	${pkgdir}/usr/lib32/libatiuki.so.1
      ln -sf /usr/lib32/libatiuki.so.1.0	${pkgdir}/usr/lib32/libatiuki.so

     # provided in lib32-opencl-catalyst package
      rm ${pkgdir}/usr/lib32/lib{amdocl*,OpenCL}.so*

     # License
      install -m755 -d ${pkgdir}/usr/share/licenses
      ln -s $_pkgbasename ${pkgdir}/usr/share/licenses/${pkgname}
}