# Maintainer: satcom886 <rostik.medved@gmail.com>

pkgname=vc4cl-git
pkgver=r170.eec7e57
pkgrel=1
pkgdesc="VC4CL is an implementation of the OpenCL 1.2 standard for the VideoCore IV GPU."
arch=('any')
url="https://github.com/doe300/VC4CL"
license=('MIT')
groups=()
depends=('clang' 'clinfo' 'ocl-icd' 'vc4c-git')
makedepends=('make' 'git' 'gcc' 'cmake' 'llvm' 'opencl-headers')
optdepends=()
provides=('opencl-pi' 'opencl-vc4' 'opencl-driver' 'vc4-opencl' 'vc4cl')
source=("VC4CL::git+https://github.com/doe300/VC4CL" "VC4CL.icd")
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/VC4CLStdLib"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p $srcdir/VC4CL/build
	cd $srcdir/VC4CL/build
	cmake "$srcdir/VC4CL" -DCMAKE_BUILD_TYPE=Release -DMULTI_THREADED=true -DCLANG_FOUND=/usr/bin/clang -DVC4CL_STDLIB_DIR=/usr/local/include/vc4cl-stdlib
	make
}

package() {
    install -m 644 "$srcdir/VC4CL.icd" $pkgdir/etc/OpenCL/vendors/
    cd $srcdir/VC4CL/build
    make DESTDIR="$pkgdir"/ install
}
