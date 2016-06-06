# Original Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Current Maintainer: Leopold Bloom <blinxwang@gmail.com>
pkgname=beignet
pkgver=1.1.2
pkgrel=5
pkgdesc='A GPGPU System for Intel Ivybridge GPUs'
arch=('x86_64')
url='http://cgit.freedesktop.org/beignet/'
license=('LGPL2.1')
depends=('glu' 'libsm' 'libxext' 'mesa' 'ncurses' 'ocl-icd' 'opencl-headers' 'llvm')
makedepends=('clang' 'cmake' 'python2')
provides=('opencl-intel')
conflicts=('opencl-intel')
source=("https://01.org/sites/default/files/beignet-$pkgver-source.tar.gz"
	"isnan.patch"
	"gcc6.patch"
	"clangfix.patch")
sha256sums=('6a8d875afbb5e3c4fc57da1ea80f79abadd9136bfd87ab1f83c02784659f1d96'
	    'SKIP'
	    'SKIP'
	    'SKIP')
prepare() {
	cp isnan.patch "$srcdir/Beignet-$pkgver-Source"
	cp gcc6.patch "$srcdir/Beignet-$pkgver-Source"
	cp clangfix.patch "$srcdir/Beignet-$pkgver-Source"
	cd "$srcdir/Beignet-$pkgver-Source"
	patch -Np1 -i isnan.patch
	patch -Np1 -i gcc6.patch
	patch -Np1 -i clangfix.patch
	cd "include/CL"
	rm {opencl.h,cl_platform.h,cl_gl_ext.h,cl.h,cl.hpp,cl_egl.h,cl_ext.h,cl_gl.h}
	touch dummy.hpp
}

build() {
	mkdir -p "$srcdir/Beignet-$pkgver-Source/build"
	cd "$srcdir/Beignet-$pkgver-Source/build"
	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=RELEASE \
		-DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2
	make
}

package() {
	cd "$srcdir/Beignet-$pkgver-Source/build"
	make DESTDIR="$pkgdir/" install
}
