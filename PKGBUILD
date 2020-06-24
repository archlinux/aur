# Maintainer: satcom886 <rostik.medved@gmail.com>

pkgname=vc4cl-git
pkgver=1
pkgrel=2
pkgdesc="VC4CL is an implementation of the OpenCL 1.2 standard for the VideoCore IV GPU."
arch=('any')
url="https://github.com/doe300/VC4CL"
license=('MIT')
groups=()
depends=('llvm' 'clinfo' 'ocl-icd')
makedepends=('wget' 'gcc' 'cmake' 'clang' 'opencl-headers')
optdepends=()
conflicts=('vc4c-git' 'vc4clstdlib-git')
provides=('opencl-pi' 'opencl-vc4' 'opencl-driver')
source=("VC4C::git+https://github.com/doe300/VC4C/" "VC4CL::git+https://github.com/doe300/VC4CL/" "VC4CLStdLib::git+https://github.com/doe300/VC4CLStdLib/" "auto_dummy.patch")
md5sums=('SKIP' 'SKIP' 'SKIP' 'e409cafcdc79aa53aef1484e53bd25e7')

build() {
    mkdir -p $srcdir/VC4CL/build
	mkdir -p $srcdir/VC4C/build
	mkdir -p $srcdir/VC4CLStdLib/build
	cd $srcdir/VC4CLStdLib/build
	cmake ..
	make
	cd ../..
    cd VC4C/build
	cmake ..
	make
    cd ../..
    cd VC4CL/build
    cmake ..
    make
    cd ../..
}

prepare() {
	patch -R $srcdir/VC4C/src/ProcessUtil.cpp $srcdir/auto_dummy.patch
}

package() {
	cd $srcdir/VC4CLStdLib/build
	make DESTDIR="$pkgdir"/ install
	cd $srcdir/VC4C/build
	make DESTDIR="$pkgdir"/ install
    cd $srcdir/VC4CL/build
    make DESTDIR="$pkgdir"/ install
}
