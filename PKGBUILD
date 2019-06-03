# Maintainer: Ilya Elenskiy <elenskiy.ilya@gmail.com>

pkgname=python-numba-roctools-git
pkgver=0.0.0.r2.g31ab1ff
pkgrel=1
pkgdesc="Numba backend for ROCm HSA"
arch=('x86_64')
url="https://github.com/numba/roctools"
license=('BSD')
groups=()
depends=('python-numba' 'python-llvmlite>=0.29.0' 'llvm>=8.0.0' 'lld>=8.0.0' 'rocr-runtime>=2.4.0')
makedepends=(git cmake make gcc gtest 'llvm>=8.0.0') 
provides=('python-numba-roctools')
opencl_devel_ver="1.2.0-2019050359"
source=(
    "roctools::git+https://github.com/numba/roctools.git#branch=wip/rocm_1_9"
    "http://repo.radeon.com/rocm/yum/rpm/rocm-opencl-devel-${opencl_devel_ver}.x86_64.rpm"
    "link_dynamic_fix_triplet.patch"
)

sha256sums=('SKIP'
            '7c89bb5c763534628102f7c5a441dcd92feea56e4f0acdf74b4829452640ac37'
            '5a7a9df7dac923ec25a0a8d518f83cd9ad5805f33b4782ec3c212a5a8495e6cb')

pkgver() {
    cd roctools
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # link LLVM dynamically and change triplet to amdgcn-amd-amdhsa
    patch -p0 -d $srcdir < $srcdir/link_dynamic_fix_triplet.patch
}

build() {
    mkdir -p $srcdir/roctools/build
    cd $srcdir/roctools/build
    cmake .. -DCMAKE_BITCODE_ROOT:PATH=$srcdir/opt/rocm/opencl/lib/x86_64/bitcode -DCMAKE_CONDA_ROOT:PATH=/usr -DCMAKE_BUILD_TYPE=RELEASE
    make
}

check() {
    cd $srcdir/roctools/build/rocmlite/test
    ./test_rocmlite
    ./test_rocmlite_functions
}

package() {
    mkdir -p $pkgdir/usr/share/rocmtools
    cp $srcdir/opt/rocm/opencl/lib/x86_64/bitcode/*.amdgcn.bc $pkgdir/usr/share/rocmtools
    mkdir -p $pkgdir/usr/lib
    cp $srcdir/roctools/build/rocmlite/librocmlite.so* $pkgdir/usr/lib
}
