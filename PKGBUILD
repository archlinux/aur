# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# You need to download the SDK file from Intel's website. (registration required).
# Look for the Community Edition Free Download.
# Download website:
# https://software.intel.com/en-us/intel-media-server-studio

_year=2015
_release=R6
_sdkver=16.4.2.1
pkgname=intel-media-sdk
pkgver="$_year"."$_release"
pkgrel=2
pkgdesc="Intel Media SDK"
arch=('x86_64')
url="https://software.intel.com/en-us/intel-media-server-studio"
license=('custom' 'BSD')
makedepends=('poppler')
source=("file://MediaServerStudioEssentials${_year}${_release}.tar.gz")
sha256sums=('c9f9dc6064a6f15c3275f475d795407f6cfaee621fe87221949ba1dbaeb34e93')

prepare() {
        cd "${srcdir}/MediaServerStudioEssentials${_year}${_release}"
        
        bsdtar -x -f "SDK${_year}Production${_sdkver}.tar.gz"
        
        cd "${srcdir}/MediaServerStudioEssentials${_year}${_release}/SDK${_year}Production${_sdkver}/Generic"
        
        bsdtar -x -f intel-linux-media-ocl_generic_"$_sdkver"-*_64bit.tar.gz
}

package() {
	cd "${srcdir}/MediaServerStudioEssentials${_year}${_release}/SDK${_year}Production${_sdkver}/Generic/opt/intel/mediasdk"
	
	mkdir -p "${pkgdir}"/opt/intel/mediasdk/{builder,doc,include,lib/lin_x64,lib64,plugins,tools}
	
	install -D -m644 builder/* "${pkgdir}"/opt/intel/mediasdk/builder
	install -D -m644 doc/* "${pkgdir}"/opt/intel/mediasdk/doc
	install -D -m644 include/* "${pkgdir}"/opt/intel/mediasdk/include
	install -D -m777 lib/lin_x64/* "${pkgdir}"/opt/intel/mediasdk/lib/lin_x64
	install -D -m777 lib64/* "${pkgdir}"/opt/intel/mediasdk/lib64
	install -D -m777 plugins/*.so "${pkgdir}"/opt/intel/mediasdk/plugins
	install -D -m644 plugins/plugins.cfg "${pkgdir}"/opt/intel/mediasdk/plugins/plugins.cfg
	cp --recursive --force tools/* "${pkgdir}"/opt/intel/mediasdk/tools
	
	cd "${srcdir}/MediaServerStudioEssentials${_year}${_release}"
	
	pdftotext -layout "Intel(R) Media Server Studio EULA.pdf"
	
	install -D -m644 "Intel(R) Media Server Studio EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "redist.txt" "${pkgdir}/usr/share/licenses/${pkgname}/redist.txt"
}
