# Original Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Current Maintainer: Leopold Bloom <blinxwang@gmail.com>
pkgname=beignet
pkgver=1.1.1
pkgrel=3
pkgdesc='A GPGPU System for Intel Ivybridge GPUs'
arch=('x86_64')
url='http://cgit.freedesktop.org/beignet/'
license=('LGPL2.1')
depends=('glu' 'libsm' 'libxext' 'mesa' 'ncurses' 'ocl-icd' 'llvm')
makedepends=('clang' 'cmake' 'python2')
provides=('opencl-intel' 'opencl-headers' 'opencl-headers12')
conflicts=('opencl-intel' 'opencl-headers' 'opencl-headers12')
replaces=('opencl-intel' 'opencl-headers' 'opencl-headers12')
source=("https://01.org/sites/default/files/beignet-$pkgver-source.tar.gz")
sha256sums=('9bf4c69eb4fbd3c7cc9ef75c1952bca6f05259ffbe753a27e08ed98bb32e1119')

build() {
	cp llvm-3.7-patch-1.patch "$srcdir/Beignet-$pkgver-Source"
	cp llvm-3.7-patch-2.patch "$srcdir/Beignet-$pkgver-Source"
	cp llvm-3.7-patch-3.patch "$srcdir/Beignet-$pkgver-Source"
	cp llvm-3.7-patch-4.patch "$srcdir/Beignet-$pkgver-Source"
	cp llvm-3.7-patch-5.patch "$srcdir/Beignet-$pkgver-Source"
	cd "$srcdir/Beignet-$pkgver-Source"
	patch -Np1 -i llvm-3.7-patch-1.patch
	patch -Np1 -i llvm-3.7-patch-2.patch
	patch -Np1 -i llvm-3.7-patch-3.patch
	patch -Np1 -i llvm-3.7-patch-4.patch
	patch -Np1 -i llvm-3.7-patch-5.patch
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
