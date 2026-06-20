# Maintainer: cantosun99 <privat at cantosun dot de>
pkgname=llama.cpp-sycl
pkgver=b9739
pkgrel=1
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
    'intel-oneapi-basekit-2025'
)
depends=(
    'intel-compute-runtime'
    'level-zero-loader'
    'level-zero-headers'
    'gcc-libs'
    'intel-deep-learning-essentials'
)
makedepends=(
    'git'
    'cmake'
    'make'
)
options=(!strip !buildflags)
source=(
    "llama.cpp-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('343e0d50be0a96e4091a293205f9eda6f68ff47feb27fc67f76c2359692b821c')

prepare() {
    ln -sf "llama.cpp-${pkgver}" llama.cpp
}

build() {
    # Source oneAPI environment (provided by intel-deep-learning-essentials)
    set +u
    source /opt/intel/oneapi/setvars.sh --force
    set -u

    cd "${srcdir}/llama.cpp"
    # !buildflags is set in options to prevent makepkg from injecting CFLAGS/CXXFLAGS
    # into the IntelLLVM device-side compilation pipeline, which can cause runtime
    # failures (e.g. unresolved glibc fortify symbols in SYCL device IR).
    cmake -B build \
        -DGGML_SYCL=ON \
        -DGGML_SYCL_F16=ON \
        -DCMAKE_C_COMPILER=icx \
        -DCMAKE_CXX_COMPILER=icpx \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/llama.cpp-sycl \
        -DCMAKE_INSTALL_RPATH=/opt/llama.cpp-sycl/lib
    cmake --build build --config Release -j$(nproc)
}

package() {
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
