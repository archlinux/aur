# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=mnn
pkgver=3.6.1
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
    'gcc'
    'ninja'
    'opencl-headers'
    'patchelf'
    'vulkan-headers'
)
optdepends=(
    'vulkan-driver: Vulkan GPU backend at runtime'
    'opencl-driver: OpenCL GPU backend at runtime'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/alibaba/MNN/archive/refs/tags/$pkgver.tar.gz"
    'dont-install-bundled-protobuf.patch'
    'gcc16-strict-ansi.patch'
)
sha256sums=('4b6065c4e2674318f5bf1dc75836ce4d30c17bfe598c4a1b11b7d0b2092b06e6'
            'cd5c3882fda8f96373d54fd1e942228a7d70335724073946a36a00319068df58'
            'c0de4163291f15bd4729af165f2ccc47c61dd27742fa732001688a70ff941a71')

prepare() {
    cd "MNN-$pkgver"
    # MNN needs its vendored protobuf 3.19 for the converter, but consumers
    # must not receive a second system-wide protobuf SDK from this package.
    # Keep the statically linked build target while excluding its install rules.
    patch -Np1 -i "$srcdir/dont-install-bundled-protobuf.patch"
    # MNN manually defines the implementation-reserved __STRICT_ANSI__ macro
    # while also asking CMake for GNU C++ mode.  GCC 16 then exposes both its
    # strict and GNU __int128 overloads and diagnoses duplicate definitions.
    # Let the compiler set this macro from the selected language mode.
    patch -Np1 -i "$srcdir/gcc16-strict-ansi.patch"
}

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
        -DMNN_SUPPORT_TRANSFORMER_FUSE=ON \
        -DMNN_BUILD_TEST=ON \
        -DMNN_BUILD_DEMO=OFF \
        -DMNN_BUILD_BENCHMARK=ON
    cmake --build build
}

check() {
    # These are the two CPU stages from upstream's test_ci.sh local workflow:
    # the complete single-thread suite and the multithreaded operator sweep.
    CUDA_VISIBLE_DEVICES='' ./build/run_test.out all 0 0 1 '' 0
    CUDA_VISIBLE_DEVICES='' ./build/run_test.out op 0 0 4 '' 0
}

package() {
    # Installs the MNN/MNN_Express/MNN_CL/MNN_Vulkan shared libs and the public
    # MNN headers (include/MNN/, include/MNN/expr/).
    DESTDIR="$pkgdir" cmake --install build

    # Upstream has no install rules for the separately-built GPU backends or
    # converter support library. All three are runtime components, not tests.
    install -dm755 "$pkgdir/usr/lib"
    local _lib
    for _lib in \
        libMNN_CL.so libMNN_Vulkan.so libMNNConvertDeps.so \
        libMNNTrain.so libMNNTrainUtils.so; do
        local _libsrc
        _libsrc=$(find build -type f -name "$_lib" | head -1)
        [[ -n "$_libsrc" ]]
        install -Dm755 "$_libsrc" "$pkgdir/usr/lib/$_lib"
    done

    # MNN likewise has no install rules for its documented command-line tools.
    install -dm755 "$pkgdir/usr/bin"
    local _bin
    for _bin in \
        MNNConvert MNNDump2Json MNNRevert2Buffer TestConvertResult \
        GetMNNInfo MNNV2Basic.out ModuleBasic.out SequenceModuleTest.out \
        OpenCLProgramBuildTest.out mergeInplaceForCPU modelCompare.out \
        mobilenetTest.out backendTest.out testModel.out testModel_expr.out \
        testModelWithDescribe.out getPerformance.out checkInvalidValue.out \
        timeProfile.out testTrain.out fuseTest compilefornpu checkDir.out \
        checkFile.out winogradExample.out benchmark.out \
        benchmarkExprModels.out quantized.out classficationTopkEval.out; do
        local _src
        _src=$(find build -type f -name "$_bin" -executable 2>/dev/null | head -1)
        [[ -n "$_src" ]]
        install -Dm755 "$_src" "$pkgdir/usr/bin/$_bin"
    done

    # The copied build-tree executables otherwise retain absolute build RPATHs.
    local _file
    while IFS= read -r -d '' _file; do
        if [[ $(LC_ALL=C od -An -tx1 -N4 "$_file") == ' 7f 45 4c 46' ]]; then
            patchelf --remove-rpath "$_file" || return
        fi
    done < <(find "$pkgdir/usr/bin" "$pkgdir/usr/lib" -type f -print0)

    install -Dm644 "MNN-$pkgver/LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
