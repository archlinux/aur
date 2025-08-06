# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-compute-runtime-legacy
pkgver=24.35.30872.36
pkgrel=1
pkgdesc='Intel Graphics Compute Runtime for oneAPI Level Zero and OpenCL Driver (legacy platforms)'
arch=('x86_64')
url='https://github.com/intel/compute-runtime/'
license=('MIT')
depends=(
    'gcc-libs'
    'glibc'
    'intel-gmmlib-legacy'
    'intel-graphics-compiler-legacy')
makedepends=(
    'cmake'
    'igsc-legacy'
    'libva'
    'level-zero-headers-legacy')
optdepends=(
    'libdrm: for cl_intel_va_api_media_sharing'
    'libva: for cl_intel_va_api_media_sharing')
provides=("intel-compute-runtime=${pkgver}" 'opencl-driver' 'level-zero-driver')
conflicts=('intel-compute-runtime')
# https://github.com/intel/compute-runtime/issues/528
options=('!lto')
source=("https://github.com/intel/compute-runtime/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-intel-compute-runtime-disable-werror.patch'
        '020-intel-compute-runtime-gcc15-fix.patch')
sha256sums=('3325aa7830e628c7d0f129434351830cca28e11e5793cef67f71d1c2927fea71'
            'b98774fd019281d3a9bd6109d9fbaaae866e2ae4581397b582cdf454a29433e5'
            'c0b9270af11ae418c98c54b91ee932de2040935a6649a8d4fcb5ff8c38b1f4ef')

prepare() {
    patch -d "compute-runtime-${pkgver}" -Np1 -i "${srcdir}/010-intel-compute-runtime-disable-werror.patch"
    patch -d "compute-runtime-${pkgver}" -Np1 -i "${srcdir}/020-intel-compute-runtime-gcc15-fix.patch"
}

build() {
    # fix runtime error in blender
    CXXFLAGS+=' -DSANITIZER_BUILD=1'
    CFLAGS+=' -DSANITIZER_BUILD=1'
    
    # fix warning: "_FORTIFY_SOURCE" redefined
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    # opencl and opengl headers supported by upstream are already in the source tree
    local _opencl_headers_dir="${srcdir}/compute-runtime-${pkgver}/third_party/opencl_headers"
    local _opengl_headers_dir="${srcdir}/compute-runtime-${pkgver}/third_party/opengl_headers"
    export CXXFLAGS+=" -isystem${_opencl_headers_dir} -isystem${_opengl_headers_dir}"
    
    # tests currently disabled because of https://github.com/intel/compute-runtime/issues/599
    cmake -B build -S "compute-runtime-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DNEO_DISABLE_LD_GOLD:BOOL:BOOL='ON' \
        -DNEO_CURRENT_PLATFORMS_SUPPORT:BOOL='OFF' \
        -DNEO_LEGACY_PLATFORMS_SUPPORT:BOOL='ON' \
        -DNEO_OCL_VERSION_MAJOR:STRING="${pkgver%%.*}" \
        -DNEO_OCL_VERSION_MINOR:STRING="$(cut -d . -f2 <<< "$pkgver")" \
        -DNEO_VERSION_BUILD:STRING="$(cut -d . -f3 <<< "$pkgver")" \
        -DSUPPORT_DG1:BOOL='ON' \
        -DSUPPORT_DG2:BOOL='ON' \
        -DKHRONOS_GL_HEADERS_DIR:PATH="$_opengl_headers_dir" \
        -DKHRONOS_HEADERS_DIR:PATH="$_opencl_headers_dir" \
        -DSKIP_UNIT_TESTS:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "compute-runtime-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    ln -s "$(find "${pkgdir}/usr/lib" -regex '.*libze_intel_gpu_legacy1.so.[0-9]*' -exec basename {} \;)" "${pkgdir}/usr/lib/libze_intel_gpu_legacy1.so"
    ln -s "$(find "${pkgdir}/usr/bin" -name 'ocloc-*' -exec basename {} \;)" "${pkgdir}/usr/bin/ocloc"
}
