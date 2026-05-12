# Maintainer: cantosun99 <privat at cantosun dot de>
pkgname=llama.cpp-sycl
pkgver=2026.0.0
pkgrel=1
pkgdesc="llama.cpp with Intel Arc GPU acceleration via SYCL/oneAPI (bundled runtime, no separate oneAPI install required). Please read the README on GitHub before use."
arch=('x86_64')
url="https://github.com/cantosun99/llama.cpp-sycl"
license=('MIT')

provides=('llama.cpp')
conflicts=(
    'llama.cpp'
    'llama.cpp-git'
    'llama.cpp-bin'
    'llama.cpp-cuda'
    'llama.cpp-cuda-git'
    'llama.cpp-cuda-essentials-only'
    'llama.cpp-vulkan'
    'llama.cpp-vulkan-git'
    'llama.cpp-vulkan-bin'
    'llama.cpp-vulkan-gemma4'
    'llama.cpp-cublas-git'
    'llama.cpp-hip'
    'llama.cpp-hip-gfx1151'
    'llama.cpp-hipblas-git'
    'llama.cpp-gfx1151'
    'llama.cpp-openvino'
    'llama.cpp-clblast'
    'llama.cpp-clblas-git'
    'llama.cpp-opencl'
    'llama.cpp-sycl-f16'
    'llama.cpp-sycl-f16-git'
    'llama.cpp-sycl-f32'
    'llama.cpp-sycl-f32-git'
    'llama.cpp-bin-noavx'
)
depends=(
    'intel-compute-runtime'
    'level-zero-loader'
    'level-zero-headers'
    'gcc-libs'
)
makedepends=(
    'git'
    'cmake'
    'make'
)
options=(!strip)

_source_release="2026.0.0"
source=(
    "https://github.com/cantosun99/llama.cpp-sycl/releases/download/$_source_release/intel.tar.part-aa"
    "https://github.com/cantosun99/llama.cpp-sycl/releases/download/$_source_release/intel.tar.part-ab"
    "https://github.com/cantosun99/llama.cpp-sycl/releases/download/$_source_release/intel.tar.part-ac"
)

sha256sums=(
    'bfb49f991a14dbb11c69618a332e0c5584e39dbc11bfc48f3cc47eb7f0965bcf'
    '8a9ac72795ea4c64a59c481458dd0248013337b8621698ad1ff704048542b015'
    '2dd7f0159c2f8f9601c3d4d372be3251a6d5c3b5379dba280e2b5249ed185dd4'
)
noextract=(
    'intel.tar.part-aa'
    'intel.tar.part-ab'
    'intel.tar.part-ac'
)

prepare() {
    # Recombine split parts into one tarball
    echo "Recombining split parts into intel.tar.gz..."
    cat "${srcdir}"/intel.tar.part-* > "${srcdir}/intel.tar.gz"

    # Extract the oneAPI toolchain (tar contains intel/oneapi/... → becomes $srcdir/opt/intel/oneapi)
    echo "Extracting oneAPI toolchain..."
    mkdir -p "${srcdir}/opt"
    tar -xzf "${srcdir}/intel.tar.gz" -C "${srcdir}/opt/"

    # Clone latest llama.cpp source (always builds against HEAD)
    git clone --depth=1 https://github.com/ggml-org/llama.cpp "${srcdir}/llama.cpp"
}

build() {
    local oneapi_root="${srcdir}/opt/intel/oneapi"

    # Source setvars if present (standard oneAPI layout)
    if [[ -f "${oneapi_root}/setvars.sh" ]]; then
        set +u
        source "${oneapi_root}/setvars.sh" --force
        set -u
    else
        # Fallback: manually prepend icx/icpx to PATH
        export PATH="${oneapi_root}/compiler/latest/bin:${PATH}"
        export LD_LIBRARY_PATH="${oneapi_root}/compiler/latest/lib:${LD_LIBRARY_PATH:-}"
    fi

    cd "${srcdir}/llama.cpp"

    # Strip -D_FORTIFY_SOURCE from CFLAGS/CXXFLAGS for IntelLLVM device-side compilation.
    # Refs: https://github.com/ggml-org/llama.cpp/issues/11713
    local _cflags="${CFLAGS//-D_FORTIFY_SOURCE=*/} -U_FORTIFY_SOURCE"
    local _cxxflags="${CXXFLAGS//-D_FORTIFY_SOURCE=*/} -U_FORTIFY_SOURCE"

    cmake -B build \
        -DCMAKE_C_FLAGS="$_cflags" \
        -DCMAKE_CXX_FLAGS="$_cxxflags" \
        -DGGML_SYCL=ON \
        -DCMAKE_C_COMPILER=icx \
        -DCMAKE_CXX_COMPILER=icpx \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_RPATH=/usr/lib

    cmake --build build --config Release -j$(nproc)
}

package() {
    # Install oneAPI runtime files to /opt/intel/oneapi on the user's system
    echo "Installing oneAPI runtime to /opt/intel/oneapi..."
    mkdir -p "${pkgdir}/opt/intel"
    cp -r "${srcdir}/opt/intel/oneapi" "${pkgdir}/opt/intel/"

    # Install llama.cpp (binaries, shared libs, symlinks, correct RPATHs)
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/llama.cpp/build"

    # Install license
    install -Dm644 "${srcdir}/llama.cpp/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
