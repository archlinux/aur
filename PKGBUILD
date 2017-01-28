# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# This package provides only the files for Intel Media SDK.
# The proper installation requires a specific (older) Linux kernel version,
# kernel patches and other system modifications. For the sake of the system
# this package will not touch the kernel or system libraries.  Only the SDK
# files will be provided in '/opt'.

_year=2017
_release="R2"
_sdkver=16.5.1
pkgname=intel-media-sdk
pkgver="${_year}.${_release}"
pkgrel=1
pkgdesc="Intel Media SDK (only SDK files, no kernel patches, no system modifications)"
arch=('x86_64')
url="https://software.intel.com/en-us/intel-media-server-studio"
license=('custom')
makedepends=('poppler')
provides=('libmfx' 'libmfx.a' 'iHD_drv_video.so' 'libmfxhw64.so' 'libmfxsw64.so'
          'libmfx_h264la_hw64.so' 'libmfx_vp8d_hw64.so' 'igfxcmjit64.so' 'igfxcmrt64.so')
source=("http://registrationcenter-download.intel.com/akdlm/irc_nas/vcp/11167/MediaServerStudioEssentials${_year}${_release}.tar.gz")
sha256sums=('5f32f7abddec54751203f2937c4ad7748013dee9849d7c61786091c38bffdaf4')

prepare() {
        cd "${srcdir}/MediaServerStudioEssentials${_year}${_release}"
        bsdtar -x -f "SDK${_year}Production${_sdkver}.tar.gz"
        
        cd "${srcdir}/MediaServerStudioEssentials${_year}${_release}/SDK${_year}Production${_sdkver}/Generic"
        bsdtar -x -f intel-linux-media_generic_"$_sdkver"-*_64bit.tar.gz
}

package() {
	# copy SDK files
	
	mkdir -p "${pkgdir}"/opt/intel/mediasdk/{doc,include/mfx,lib/lin_x64,lib64,plugins,tools}
	
	cd "${srcdir}/MediaServerStudioEssentials${_year}${_release}/SDK${_year}Production${_sdkver}/Generic/opt/intel/mediasdk"
	install -D -m644 doc/*               "${pkgdir}"/opt/intel/mediasdk/doc
	install -D -m644 include/*           "${pkgdir}"/opt/intel/mediasdk/include
	install -D -m644 include/*           "${pkgdir}"/opt/intel/mediasdk/include/mfx  # to compile ffmpeg without lu-zero's libmfx
	install -D -m777 lib/lin_x64/*       "${pkgdir}"/opt/intel/mediasdk/lib/lin_x64
	install -D -m777 lib64/*             "${pkgdir}"/opt/intel/mediasdk/lib64
	install -D -m777 plugins/*.so        "${pkgdir}"/opt/intel/mediasdk/plugins
	install -D -m644 plugins/plugins.cfg "${pkgdir}"/opt/intel/mediasdk/plugins/plugins.cfg
	cp --recursive --force tools/*       "${pkgdir}"/opt/intel/mediasdk/tools
	
	cd "${srcdir}/MediaServerStudioEssentials${_year}${_release}/SDK${_year}Production${_sdkver}/Generic/opt/intel/common"
	install -D -m777 mdf/lib64/*         "${pkgdir}"/opt/intel/mediasdk/lib64
	
	
	# copy license files
	
	cd "${srcdir}/MediaServerStudioEssentials${_year}${_release}"
	pdftotext -layout "Intel(R)_Media_Server_Studio_EULA.pdf"
	install -D -m644  "Intel(R)_Media_Server_Studio_EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644  redist.txt "${pkgdir}/usr/share/licenses/${pkgname}/redist.txt"
	
	
	# create a pkgconfig file for libmfx
	
	mkdir -p  "${pkgdir}"/opt/intel/mediasdk/lib/pkgconfig
	touch     "${pkgdir}"/opt/intel/mediasdk/lib/pkgconfig/libmfx.pc
	chmod 644 "${pkgdir}"/opt/intel/mediasdk/lib/pkgconfig/libmfx.pc
	
	echo "prefix=/opt/intel/mediasdk"                                 >>"${pkgdir}"/opt/intel/mediasdk/lib/pkgconfig/libmfx.pc
	echo "exec_prefix=\${prefix}"                                     >>"${pkgdir}"/opt/intel/mediasdk/lib/pkgconfig/libmfx.pc
	echo "libdir=\${prefix}/lib/lin_x64"                              >>"${pkgdir}"/opt/intel/mediasdk/lib/pkgconfig/libmfx.pc
	echo "includedir=\${prefix}/include"                              >>"${pkgdir}"/opt/intel/mediasdk/lib/pkgconfig/libmfx.pc
	echo ""                                                           >>"${pkgdir}"/opt/intel/mediasdk/lib/pkgconfig/libmfx.pc
	echo "Name: libmfx"                                               >>"${pkgdir}"/opt/intel/mediasdk/lib/pkgconfig/libmfx.pc
	echo "Description: Intel Media SDK Dispatched static library"     >>"${pkgdir}"/opt/intel/mediasdk/lib/pkgconfig/libmfx.pc
	echo "Version: ${_sdkver}"                                        >>"${pkgdir}"/opt/intel/mediasdk/lib/pkgconfig/libmfx.pc
	echo "Libs: -L\${libdir} -lmfx -lva -lstdc++ -ldl -lva-drm -ldrm" >>"${pkgdir}"/opt/intel/mediasdk/lib/pkgconfig/libmfx.pc
	echo "Cflags: -I\${includedir} -I/usr/include/libdrm"             >>"${pkgdir}"/opt/intel/mediasdk/lib/pkgconfig/libmfx.pc		
}
