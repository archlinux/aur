# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=mnn
pkgver=3.5.0
pkgrel=1
pkgdesc='Lightweight high-performance deep learning inference engine (CPU/Vulkan/OpenCL) with model converter and tools'
arch=('x86_64')
url='https://github.com/alibaba/MNN'
license=('Apache-2.0')
depends=(
    'gcc-libs'
    'glibc'
    'vulkan-icd-loader'
    'ocl-icd'
)
makedepends=(
    'cmake'
    'ninja'
    'gcc'
    'vulkan-headers'
    'opencl-headers'
)
optdepends=(
    'vulkan-driver: Vulkan GPU backend at runtime'
    'opencl-driver: OpenCL GPU backend at runtime'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alibaba/MNN/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7a4db1df4bd6c2116841f90b51961b8cb9466d52520bc7893081bfa4c7e8a9be')

build() {
    # MNN's converter does not compile against system protobuf 34 / abseil 2026
    # (abseil resize_and_overwrite.h FloatToString lambda: 'const char*' vs
    # 'char*'). Use MNN's bundled protobuf 3.19 (MNN_BUILD_PROTOBUFFER=ON) — it
    # still builds the FULL converter and sidesteps the system-abseil mismatch
    # (so 'protobuf' is no longer a dep).
    # MNN_USE_SYSTEM_LIB=ON links the Vulkan/OpenCL backends against the system
    # loaders rather than dlopen'ing bundled headers.
    cmake -S "MNN-$pkgver" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMNN_BUILD_SHARED_LIBS=ON \
        -DMNN_SEP_BUILD=ON \
        -DMNN_USE_SYSTEM_LIB=ON \
        -DMNN_BUILD_TOOLS=ON \
        -DMNN_BUILD_QUANTOOLS=ON \
        -DMNN_EVALUATION=ON \
        -DMNN_BUILD_CONVERTER=ON \
        -DMNN_BUILD_PROTOBUFFER=ON \
        -DMNN_OPENCL=ON \
        -DMNN_VULKAN=ON \
        -DMNN_AVX2=ON \
        -DMNN_USE_SSE=ON \
        -DMNN_SUPPORT_BF16=ON \
        -DMNN_LOW_MEMORY=ON \
        -DMNN_CPU_WEIGHT_DEQUANT_GEMM=ON \
        -DMNN_SUPPORT_TRANSFORMER_FUSE=ON \
        -DMNN_BUILD_TEST=OFF \
        -DMNN_BUILD_DEMO=OFF \
        -DMNN_BUILD_BENCHMARK=OFF
    cmake --build build
}

package() {
    # Installs the MNN/MNN_Express/MNN_CL/MNN_Vulkan shared libs and the public
    # MNN headers (include/MNN/, include/MNN/expr/).
    DESTDIR="$pkgdir" cmake --install build

    # MNN does not provide install() rules for the CLI tools/converter, so place
    # the user-facing executables under /usr/bin ourselves. They are emitted into
    # the build root and the tools/cpp subdirs depending on the target.
    install -dm755 "$pkgdir/usr/bin"
    local _bin
    for _bin in MNNConvert MNNDump2Json MNNRevert2Buffer GetMNNInfo \
                MNNV2Basic.out ModuleBasic.out quantized.out \
                classficationTopkEval.out; do
        local _src
        _src=$(find build -type f -name "$_bin" -executable 2>/dev/null | head -1)
        if [[ -n "$_src" ]]; then
            install -Dm755 "$_src" "$pkgdir/usr/bin/$_bin"
        fi
    done

    install -Dm644 "MNN-$pkgver/LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
