pkgname=mingw-w64-tools
pkgver=4.0.2
_pkgver=${pkgver/rc/-rc}
pkgrel=1
pkgdesc="MinGW-w64 utilities"
arch=(i686 x86_64)
url="http://mingw-w64.sourceforge.net"
license=("GPL3" "LGPL2")
groups=(mingw-w64)
options=(!libtool !emptydirs)
source=("http://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/mingw-w64-v${_pkgver}.tar.bz2"
"mingw-w64-tools-2.0.999-s390.patch"
"mingw-w64-tools-2.0.999-widl-includedir.patch")
md5sums=('bb6404499342e02447b7c49f47b06b5e'
         '85a915187d7092c659a56fca102da04c'
         'e448767d2af073c99795f72bc4e1700c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "${srcdir}/mingw-w64-v$_pkgver"
	patch -p2 -i ../mingw-w64-tools-2.0.999-s390.patch
	patch -p1 -i ../mingw-w64-tools-2.0.999-widl-includedir.patch
}

build() {
	cd "${srcdir}"
	mkdir -p "${srcdir}"/gendef-build && cd "${srcdir}"/gendef-build
	"${srcdir}"/mingw-w64-v${_pkgver}/mingw-w64-tools/gendef/configure --prefix=/usr
	make
	mkdir -p "${srcdir}"/genidl-build && cd "${srcdir}"/genidl-build
	"${srcdir}"/mingw-w64-v${_pkgver}/mingw-w64-tools/genidl/configure --prefix=/usr
	make
	mkdir -p "${srcdir}"/genpeimg-build && cd "${srcdir}"/genpeimg-build
	"${srcdir}"/mingw-w64-v${_pkgver}/mingw-w64-tools/genpeimg/configure --prefix=/usr
	make
	for _arch in ${_architectures}; do
		mkdir -p "${srcdir}"/widl-${_arch}-build && cd "${srcdir}"/widl-${_arch}-build
		"${srcdir}"/mingw-w64-v${_pkgver}/mingw-w64-tools/widl/configure --prefix=/usr --target=${_arch} \
			--program-prefix="${_arch}-"
		make
	done
}

package() {
	cd "${srcdir}/gendef-build"
	make DESTDIR="${pkgdir}" install
	cd ../genidl-build
	make DESTDIR="${pkgdir}" install
	cd ../genpeimg-build
	make DESTDIR="${pkgdir}" install
	for _arch in ${_architectures}; do
		cd ../widl-${_arch}-build
		make DESTDIR="${pkgdir}" install
	done
	install -Dm644 "${srcdir}/mingw-w64-v${_pkgver}/mingw-w64-tools/gendef/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.gendef"
	install -m644 "${srcdir}/mingw-w64-v${_pkgver}/mingw-w64-tools/genidl/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.genidl"
	install -m644 "${srcdir}/mingw-w64-v${_pkgver}/mingw-w64-tools/genpeimg/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.genpeimg"
	
}
