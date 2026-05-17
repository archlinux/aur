# Maintainer: cantosun99 <privat at cantosun dot de>
pkgname=llama.cpp-sycl
pkgver=2026.0.0
pkgrel=3
pkgdesc="llama.cpp with Intel Arc GPU acceleration via SYCL/oneAPI. Please read the README on GitHub before use."
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
    'intel-oneapi-toolkit'
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
options=(!strip !buildflags)
# Direct download links from Intel:
#   DLE:  https://www.intel.com/content/www/us/en/developer/tools/oneapi/oneapi-toolkit-download.html
#   oneDNN: https://www.intel.com/content/www/us/en/developer/tools/oneapi/onednn-download.html
_source_dle="intel-deep-learning-essentials-2026.0.0.624_offline.sh"
_source_onednn="intel-onednn-2026.0.0.689_offline.sh"
source=(
    "$_source_dle::https://registrationcenter-download.intel.com/akdlm/IRC_NAS/8170208e-86db-4faa-a0d6-1ecf62699574/$_source_dle"
    "$_source_onednn::https://registrationcenter-download.intel.com/akdlm/IRC_NAS/964163c0-9651-4e14-8ebf-3cc27e2519e4/$_source_onednn"
)
noextract=(
    "$_source_dle"
    "$_source_onednn"
)
# SHA-384 checksums provided by Intel on the download pages
sha384sums=(
    '04e1b3392cb01e2f50fbe4ef985686902158af0c232e3990d1955ee2cd67ade8c70ba24f604b45d4f513c3050ecf93d5'
    '29cd895492bdde32b83611f21e85b06085b15604cd26eb45aa4692c0e1d8a57d34cf2c447d3a07559d46f14c3afc27bf'
)

prepare() {
    # Clone latest llama.cpp source (always builds against HEAD)
    git clone --depth=1 https://github.com/ggml-org/llama.cpp "${srcdir}/llama.cpp"
}

build() {
    # Install Intel Deep Learning Essentials (SYCL compiler icx/icpx, MKL, oneDAL, etc.)
    echo "Installing Intel Deep Learning Essentials..."
    sh "${srcdir}/${_source_dle}" -a --silent --eula accept \
        --install-dir "${srcdir}/oneapi"

    # Install Intel oneAPI Deep Neural Network Library (oneDNN)
    echo "Installing Intel oneDNN..."
    sh "${srcdir}/${_source_onednn}" -a --silent --eula accept \
        --install-dir "${srcdir}/oneapi"

    local oneapi_root="${srcdir}/oneapi"
    # Source setvars.sh to set up the full oneAPI environment
    set +u
    source "${oneapi_root}/setvars.sh" --force
    set -u

    cd "${srcdir}/llama.cpp"
    # !buildflags is set in options to prevent makepkg from injecting CFLAGS/CXXFLAGS
    # into the IntelLLVM device-side compilation pipeline, which can cause runtime
    # failures (e.g. unresolved glibc fortify symbols in SYCL device IR).
    cmake -B build \
        -DGGML_SYCL=ON \
        -DCMAKE_C_COMPILER=icx \
        -DCMAKE_CXX_COMPILER=icpx \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/llama.cpp-sycl \
        -DCMAKE_INSTALL_RPATH=/opt/llama.cpp-sycl/lib
    cmake --build build --config Release -j$(nproc)
}

package() {
    # Install oneAPI runtime to /opt/intel/oneapi on the user's system
    mkdir -p "${pkgdir}/opt/intel"
    cp -r "${srcdir}/oneapi" "${pkgdir}/opt/intel/oneapi"

    # Install llama.cpp to /opt/llama.cpp-sycl
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/llama.cpp/build"

    # Symlink binaries into /usr/bin so they are accessible system-wide
    mkdir -p "${pkgdir}/usr/bin"
    for bin in "${pkgdir}/opt/llama.cpp-sycl/bin/"*; do
        ln -s "/opt/llama.cpp-sycl/bin/$(basename "$bin")" "${pkgdir}/usr/bin/$(basename "$bin")"
    done

    # Install license
    install -Dm644 "${srcdir}/llama.cpp/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
