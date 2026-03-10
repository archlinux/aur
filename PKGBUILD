# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-compute-runtime-legacy
pkgver=24.35.30872.45
pkgrel=1
pkgdesc='Intel Graphics Compute Runtime for oneAPI Level Zero and OpenCL Driver (legacy platforms)'
arch=('x86_64')
url='https://github.com/intel/compute-runtime/'
license=('MIT')
depends=(
    'glibc'
    'intel-gmmlib-legacy'
    'intel-graphics-compiler-legacy'
    'libgcc'
    'libstdc++')
makedepends=(
    'cmake'
    'igsc-legacy'
    'level-zero-headers-legacy'
    'libva')
optdepends=(
    'igsc-legacy: for discrete GPU firmware enumeration through Level Zero'
    'libdrm: for cl_intel_va_api_media_sharing OpenCL extension'
    'libva: for cl_intel_va_api_media_sharing OpenCL extension')
provides=(
    "intel-compute-runtime=${pkgver}"
    'level-zero-driver'
    'opencl-driver')
conflicts=(
    'intel-compute-runtime')
source=("https://github.com/intel/compute-runtime/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-intel-compute-runtime-legacy-disable-werror.patch')
sha256sums=('f0e70bc85a7cc589330230cf8b7c515423678da5dae61a9bf1d905e492921a7a'
            '2513f7735f0463e6eaa0641902e11bedef9144c737307fad3974e315eaccc61b')

prepare() {
    patch -d "compute-runtime-${pkgver}" -Np1 -i "${srcdir}/010-intel-compute-runtime-legacy-disable-werror.patch"
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
    
    cmake -B build -S "compute-runtime-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DKHRONOS_GL_HEADERS_DIR:PATH="$_opengl_headers_dir" \
        -DKHRONOS_HEADERS_DIR:PATH="$_opencl_headers_dir" \
        -DNEO_CURRENT_PLATFORMS_SUPPORT:BOOL='OFF' \
        -DNEO_DISABLE_LD_GOLD:BOOL:BOOL='ON' \
        -DNEO_LEGACY_PLATFORMS_SUPPORT:BOOL='ON' \
        -DNEO_OCL_VERSION_MAJOR:STRING="${pkgver%%.*}" \
        -DNEO_OCL_VERSION_MINOR:STRING="$(cut -d . -f2 <<< "$pkgver")" \
        -DNEO_VERSION_BUILD:STRING="$(cut -d . -f3 <<< "$pkgver")" \
        -DSUPPORT_DG1:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "compute-runtime-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    ln -s "$(find "${pkgdir}/usr/lib" -regex '.*libze_intel_gpu_legacy1.so.[0-9]*' -exec basename {} \;)" "${pkgdir}/usr/lib/libze_intel_gpu_legacy1.so"
    ln -s "$(find "${pkgdir}/usr/bin" -name 'ocloc-*' -exec basename {} \;)" "${pkgdir}/usr/bin/ocloc"
}
