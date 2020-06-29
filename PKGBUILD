# Maintainer: satcom886 <rostik.medved@gmail.com>

pkgname=vc4c-git
pkgver=1
pkgrel=4
pkgdesc="Compiler for the VC4CL OpenCL-implementation"
arch=('any')
url="https://github.com/doe300/VC4C"
license=('MIT')
groups=()
depends=('llvm' 'clinfo' 'ocl-icd')
makedepends=('wget' 'gcc' 'cmake' 'clang' 'opencl-headers')
optdepends=()
conflicts=('vc4clstdlib-git')
provides=('opencl-pi' 'opencl-vc4' 'opencl-driver')
source=("VC4C.tar.gz::https://github.com/doe300/VC4C/archive/master.tar.gz" "VC4CLStdLib.tar.gz::https://github.com/doe300/VC4CLStdLib/archive/master.tar.gz" "auto_dummy.patch")
md5sums=('SKIP' 'SKIP' 'e409cafcdc79aa53aef1484e53bd25e7')

build() {
	mkdir -p $srcdir/VC4C-master/build
	mkdir -p $srcdir/VC4CLStdLib-master/build
	cd $srcdir/VC4CLStdLib-master/build
	cmake "$srcdir/VC4CLStdLib-master" -DCLANG_FOUND=/usr/bin/clang -DVC4CL_STDLIB_DIR=$srcdir/VC4CLStdLib-master/include
	make
	cd $srcdir/VC4C-master/build
	cmake -DCMAKE_BUILD_TYPE=Release -DMULTI_THREADED=true "$srcdir/VC4C-master"
	make
}

prepare() {
	patch -R $srcdir/VC4C-master/src/ProcessUtil.cpp $srcdir/auto_dummy.patch
}

package() {
	cd $srcdir/VC4CLStdLib-master/build
	make DESTDIR="$pkgdir"/ install
	cd $srcdir/VC4C-master/build
	make DESTDIR="$pkgdir"/ install
}
