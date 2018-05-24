# Maintainer: grmat <grmat@sub.red>

pkgname='compute-runtime-git'
pkgdesc="Intel(R) Graphics Compute Runtime for OpenCL(TM). Replaces Beignet for Gen8 (Broadwell) and beyond. Git version."
pkgver='18.20.10830.r19.g01c1df3'
pkgrel=1
arch=('x86_64')
url='https://01.org/compute-runtime'
license=('MIT')
makedepends=('gcc54' 'llvm' 'clang' 'python2' 'opencl-headers')
optdepends=('libva: for cl_intel_va_api_media_sharing'
            'libdrm: for cl_intel_va_api_media_sharing')
depends=('ocl-icd')
conflicts=('compute-runtime')

source=("neo::git+https://github.com/intel/compute-runtime"
        "clang_source::git+https://github.com/llvm-mirror/clang#branch=release_40"
        "common_clang::git+https://github.com/intel/opencl-clang"
        "llvm_patches::git+https://github.com/intel/llvm-patches"
        "llvm_source::git+https://github.com/llvm-mirror/llvm#branch=release_40"
        "gmmlib::git+https://github.com/intel/gmmlib"
        "igc::git+https://github.com/intel/intel-graphics-compiler"
        "khronos::git+https://github.com/KhronosGroup/OpenCL-Headers")

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
  # doesn't build with gcc8 and gcc54 doesn't know -fno-plt
  cmake -DBUILD_TYPE=Release \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_COMPILER=gcc-5 \
        -DCMAKE_CXX_COMPILER=g++-5 \
        -DCMAKE_C_FLAGS="${CFLAGS/'-fno-plt'/}" \
        -DCMAKE_CXX_FLAGS="${CFLAGS/'-fno-plt'/}" \
        ../neo
  make "$MAKEFLAGS"
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="$pkgdir" install
}

