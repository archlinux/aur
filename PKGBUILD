# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-compute-runtime-git
pkgver=22.43.24558.r8479.g7ce4ec736f
pkgrel=1
pkgdesc='Intel(R) Graphics Compute Runtime for oneAPI Level Zero and OpenCL(TM) Driver (git version)'
arch=('x86_64')
url='https://01.org/compute-runtime/'
license=('MIT')
depends=(
    'gcc-libs'
    'glibc'
    'intel-gmmlib'
    'intel-graphics-compiler-git')
makedepends=(
    'cmake'
    'git'
    'igsc'
    'level-zero-headers-git'
    'libva')
optdepends=(
    'libdrm: for cl_intel_va_api_media_sharing'
    'libva: for cl_intel_va_api_media_sharing')
provides=('intel-compute-runtime' 'opencl-driver' 'level-zero-driver')
conflicts=('intel-compute-runtime')
options=('!lto')
source=('git+https://github.com/intel/compute-runtime.git'
        '010-intel-compute-runtime-disable-werror.patch')
sha256sums=('SKIP'
            'fbc3c652c2a5edd22b7b9134679f8ce98ef6c4726ee18b555d1787054c2205f3')

prepare() {
    patch -d compute-runtime -Np1 -i "${srcdir}/010-intel-compute-runtime-disable-werror.patch"
}

pkgver() {
    git -C compute-runtime describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    # ${${pkgver#*.}%.*} not supported by bash?
    # Fix runtime error in blender
    CXXFLAGS+=' -DSANITIZER_BUILD=1'
    CFLAGS+=' -DSANITIZER_BUILD=1'
    
    # fix warning: "_FORTIFY_SOURCE" redefined
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    # opencl-headers supported by upstream is already in the source tree
    # https://github.com/intel/compute-runtime/blob/24.48.31907.7/third_party/opencl_headers/.version
    local _opencl_headers_dir="${srcdir}/compute-runtime/third_party/opencl_headers"
    export CXXFLAGS+=" -isystem${_opencl_headers_dir}"
    
    cmake -B build -S compute-runtime \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DNEO_BUILD_UNVERSIONED_OCLOC:BOOL='ON' \
        -DNEO_DISABLE_LD_GOLD:BOOL='ON' \
        -DNEO_OCL_VERSION_MAJOR:STRING="${pkgver%%.*}" \
        -DNEO_OCL_VERSION_MINOR:STRING="$(cut -d '.' -f2 <<< "$pkgver")" \
        -DNEO_VERSION_BUILD:STRING="$(cut -d '.' -f3 <<< "$pkgver")" \
        -DSUPPORT_DG1:BOOL='ON' \
        -DSUPPORT_DG2:BOOL='ON' \
        -DKHRONOS_GL_HEADERS_DIR:PATH='/usr/include' \
        -DKHRONOS_HEADERS_DIR:PATH="${_opencl_headers_dir}" \
        -DSKIP_UNIT_TESTS:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 compute-runtime/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "$(find "${pkgdir}/usr/lib" -regex '.*libze_intel_gpu.so.[0-9]*' -exec basename {} +)" "${pkgdir}/usr/lib/libze_intel_gpu.so"
}
