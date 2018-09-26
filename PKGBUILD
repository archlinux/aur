# Maintainer: grmat <grmat@sub.red>

pkgname='compute-runtime-git'
pkgdesc="Intel(R) Graphics Compute Runtime for OpenCL(TM). Replaces Beignet for Gen8 (Broadwell) and beyond. Git version."
pkgver=18.37.11481.r81.g9e8a4344
pkgrel=1
arch=('x86_64')
url='https://01.org/compute-runtime'
license=('MIT')
makedepends=('git' 'llvm' 'clang' 'python2' 'opencl-headers' 'cmake')
optdepends=('libva: for cl_intel_va_api_media_sharing'
            'libdrm: for cl_intel_va_api_media_sharing')
depends=('ocl-icd' 'ncurses' 'zlib')
conflicts=('compute-runtime')
provides=('opencl-driver')

source=("neo::git+https://github.com/intel/compute-runtime"
        "clang_source::git+https://github.com/llvm-mirror/clang#branch=release_40"
        "common_clang::git+https://github.com/intel/opencl-clang"
        "llvm_patches::git+https://github.com/intel/llvm-patches"
        "llvm_source::git+https://github.com/llvm-mirror/llvm#branch=release_40"
        "gmmlib::git+https://github.com/intel/gmmlib"
        "opencl_headers::git+https://github.com/KhronosGroup/OpenCL-Headers"
        "igc::git+https://github.com/intel/intel-graphics-compiler")

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/neo"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake -DBUILD_TYPE=Release \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        ../neo
  make "$MAKEFLAGS"
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="$pkgdir" install
}

