# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# Upstream recommends a minimum of 32GB of RAM for building.
# If you get the error "c++: fatal error: Killed signal terminated program cc1plus",
# upstream recommends to decrease the number of building threads. You will need to
# manually modify the PKGBUILD for this, and add a '--parallel <n>' option at the
# end of the cmake build command.

pkgname=intel-npu-compiler-git
pkgver=2025.38rc2.r1.g08db5c5
pkgrel=1
pkgdesc='Intel Neural Processing Unit (NPU) compiler (git version)'
arch=('x86_64')
url='https://github.com/openvinotoolkit/npu_compiler/'
license=('Apache-2.0')
depends=(
    'gcc-libs'
    'glibc'
    'onetbb'
    'pugixml'
    'zlib'
    'zstd')
makedepends=(
    'cmake'
    'git'
    'git-lfs'
    'ninja'
    'python')
provides=('intel-npu-compiler')
conflicts=('intel-npu-compiler')
source=('git+https://github.com/openvinotoolkit/npu_compiler.git'
        'git+https://github.com/openvinotoolkit/openvino.git'
        'git+https://github.com/intel/linux-npu-driver.git'
        # common git submodules
        'git+https://github.com/google/flatbuffers.git'
        # npu-compiler git submodules
        'git+https://github.com/openvinotoolkit/npu_plugin_elf.git'
        'git+https://github.com/intel/npu-plugin-llvm.git'
        'git+https://github.com/intel/npu-nn-cost-model.git'
        'git+https://github.com/google/gtest-parallel.git'
        # openvino git submodules
        'oneDNN-openvinotoolkit'::'git+https://github.com/openvinotoolkit/oneDNN.git'
        'git+https://github.com/herumi/xbyak.git'
        'git+https://github.com/madler/zlib.git'
        'git+https://github.com/gflags/gflags.git'
        'googletest-openvinotoolkit'::'git+https://github.com/openvinotoolkit/googletest.git'
        'git+https://github.com/KhronosGroup/OpenCL-ICD-Loader.git'
        'git+https://github.com/KhronosGroup/OpenCL-Headers.git'
        'git+https://github.com/KhronosGroup/OpenCL-CLHPP.git'
        'git+https://github.com/onnx/onnx.git'
        'git+https://github.com/protocolbuffers/protobuf.git'
        'git+https://github.com/pybind/pybind11.git'
        'git+https://github.com/intel/ittapi.git'
        'git+https://github.com/nithinn/ncc.git'
        'git+https://github.com/oneapi-src/oneDNN.git'
        'git+https://github.com/nlohmann/json.git'
        'git+https://github.com/ARM-software/ComputeLibrary.git'
        'git+https://github.com/openvinotoolkit/mlas.git'
        'git+https://github.com/oneapi-src/level-zero.git'
        'git+https://github.com/intel/level-zero-npu-extensions.git'
        'git+https://github.com/jbeder/yaml-cpp.git'
        'git+https://github.com/openvinotoolkit/telemetry.git'
        'git+https://github.com/libxsmm/libxsmm.git'
        'git+https://github.com/openvinotoolkit/shl.git'
        'git+https://github.com/ARM-software/kleidiai.git'
        'git+https://github.com/herumi/xbyak_riscv.git'
        # patches
        '010-intel-npu-compiler-llvm-disable-atomic-check.patch'
        '020-intel-npu-compiler-disable-werror.patch'
        '030-intel-npu-compiler-fix-install.patch'
        '040-intel-npu-compiler-llvm-gcc15-fix.patch'
        '010-openvino-disable-werror.patch'
        '020-openvino-gtest-gcc15-fix.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'b994175b16daa45d426d86952ab50fb6a1b3a47bcbf19be4752ecf82c6ebdde7'
            '142f2d9f63c0fcc0a8484711ba5f67b819eee83ba698ad60d70e281cba069c4a'
            '444bdc87986952074811e6599ae86834005ebd68781dbc108a448b5124e07533'
            'c4cb907528be3b72f01cc3529c7ae347880e00d661737039a23b3ea733ed3ca2'
            'ba2d8b40b8921acc70e0212138eb2b5db2b7311058b1092236356cf0dfe725f9'
            'e7ec20d4fb173ae29b5b1f682e7b85efa3f5359ee355b959a7f51148c84ecc7f')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    git -C npu_compiler lfs install --local
    git -C npu_compiler lfs pull https://github.com/openvinotoolkit/npu_compiler.git
    
    git -C openvino lfs install --local
    git -C openvino lfs pull https://github.com/openvinotoolkit/openvino.git
    
    git -C npu_compiler submodule init
    git -C npu_compiler config --local submodule.thirdparty/flatbuffers.url "${srcdir}/flatbuffers"
    git -C npu_compiler config --local submodule.thirdparty/elf.url "${srcdir}/npu_plugin_elf"
    git -C npu_compiler config --local submodule.thirdparty/llvm-project.url "${srcdir}/npu-plugin-llvm"
    git -C npu_compiler config --local submodule.thirdparty/vpucostmodel.url "${srcdir}/npu-nn-cost-model"
    git -C npu_compiler config --local submodule.thirdparty/gtest-parallel.url "${srcdir}/gtest-parallel"
    git -C npu_compiler -c protocol.file.allow='always' submodule update
    
    git -C npu_compiler/thirdparty/vpucostmodel lfs install --local
    git -C npu_compiler/thirdparty/vpucostmodel lfs pull https://github.com/intel/npu-nn-cost-model.git
    
    local _openvino_commit
    _openvino_commit="$(awk '/OPENVINO_REVISION/ { sub(/\)/, "", $2); print $2; exit }' linux-npu-driver/compiler/compiler_source.cmake)"
    git -C openvino config --local advice.detachedHead false
    git -C openvino checkout "$_openvino_commit"
    
    git -C openvino submodule init
    git -C openvino config --local submodule.src/plugins/intel_cpu/thirdparty/onednn.url "${srcdir}/oneDNN-openvinotoolkit"
    git -C openvino config --local submodule.thirdparty/xbyak.url "${srcdir}/xbyak"
    git -C openvino config --local submodule.thirdparty/zlib/zlib.url "${srcdir}/zlib"
    git -C openvino config --local submodule.thirdparty/pugixml.update none
    git -C openvino config --local submodule.thirdparty/gflags/gflags.url "${srcdir}/gflags"
    git -C openvino config --local submodule.thirdparty/gtest/gtest.url "${srcdir}/googletest-openvinotoolkit"
    git -C openvino config --local submodule.thirdparty/ocl/icd_loader.url "${srcdir}/OpenCL-ICD-Loader"
    git -C openvino config --local submodule.thirdparty/ocl/cl_headers.url "${srcdir}/OpenCL-Headers"
    git -C openvino config --local submodule.thirdparty/ocl/clhpp_headers.url "${srcdir}/OpenCL-CLHPP"
    git -C openvino config --local submodule.thirdparty/onnx.url "${srcdir}/onnx"
    git -C openvino config --local submodule.thirdparty/protobuf.url "${srcdir}/protobuf"
    git -C openvino config --local submodule.src/bindings/python/thirdparty/pybind11.url "${srcdir}/pybind11"
    git -C openvino config --local submodule.thirdparty/ittapi/ittapi.url "${srcdir}/ittapi"
    git -C openvino config --local submodule.ncc.url "${srcdir}/ncc"
    git -C openvino config --local submodule.thirdparty/onednn_gpu.url "${srcdir}/oneDNN"
    git -C openvino config --local submodule.thirdparty/json/nlohmann_json.url "${srcdir}/json"
    git -C openvino config --local submodule.thirdparty/flatbuffers/flatbuffers.url "${srcdir}/flatbuffers"
    git -C openvino config --local submodule.thirdparty/snappy.update none
    git -C openvino config --local submodule.ARMComputeLibrary.url "${srcdir}/ComputeLibrary"
    git -C openvino config --local submodule.src/plugins/intel_cpu/thirdparty/mlas.url "${srcdir}/mlas"
    git -C openvino config --local submodule.thirdparty/level_zero/level-zero.url "${srcdir}/level-zero"
    git -C openvino config --local submodule.src/plugins/intel_npu/thirdparty/level-zero-ext.url "${srcdir}/level-zero-npu-extensions"
    git -C openvino config --local submodule.src/plugins/intel_npu/thirdparty/yaml-cpp.url "${srcdir}/yaml-cpp"
    git -C openvino config --local submodule.thirdparty/telemetry.url "${srcdir}/telemetry"
    git -C openvino config --local submodule.src/plugins/intel_cpu/thirdparty/libxsmm.url "${srcdir}/libxsmm"
    git -C openvino config --local submodule.src/plugins/intel_cpu/thirdparty/shl.url "${srcdir}/shl"
    git -C openvino config --local submodule.src/plugins/intel_cpu/thirdparty/kleidiai.url "${srcdir}/kleidiai"
    git -C openvino config --local submodule.src/plugins/intel_cpu/thirdparty/xbyak_riscv.url "${srcdir}/xbyak_riscv"
    git -C openvino -c protocol.file.allow='always' submodule update
    
    #ln -sf ../npu_compiler/CMakePresets.json openvino/CMakePresets.json
    
    patch -d npu_compiler/thirdparty/llvm-project -Np1 -i "${srcdir}/010-intel-npu-compiler-llvm-disable-atomic-check.patch"
    patch -d npu_compiler -Np1 -i "${srcdir}/020-intel-npu-compiler-disable-werror.patch"
    patch -d npu_compiler -Np1 -i "${srcdir}/030-intel-npu-compiler-fix-install.patch"
    patch -d npu_compiler/thirdparty/llvm-project -Np1 -i "${srcdir}/040-intel-npu-compiler-llvm-gcc15-fix.patch"
    
    patch -d openvino -Np1 -i "${srcdir}/010-openvino-disable-werror.patch"
    patch -d openvino/thirdparty/gtest/gtest -Np1 -i "${srcdir}/020-openvino-gtest-gcc15-fix.patch"
}

pkgver() {
    git -C npu_compiler describe --long --tags --abbrev='7' | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^npu_ud_//;s/_rc/rc/;s/_/./g'
}

build() {
    # fix warning: "_FORTIFY_SOURCE" redefined
    # note: upstream openvino forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    # fix error:
    # c++: error: =format-security: linker input file not found: No such file or directory
    export CFLAGS="${CFLAGS/-Werror=format-security/}"
    export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"
    
    # https://github.com/openvinotoolkit/npu_compiler/issues/159
    #export CONFIG='Release'
    #export NPU_PLUGIN_HOME="${srcdir}/npu_compiler"
    #export OPENVINO_HOME="${srcdir}/openvino"
    #
    #cmake -B build -S openvino \
    #    --preset npuCidLinux \
    #    -G 'Ninja' \
    #    -DCMAKE_C_COMPILER_LAUNCHER:STRING='' \
    #    -DCMAKE_CXX_COMPILER_LAUNCHER:STRING='' \
    #    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    #    -DENABLE_SYSTEM_PUGIXML:BOOL='true' \
    #    -DENABLE_SYSTEM_TBB:BOOL='true' \
    #    -Wno-dev
    cmake -B build -S openvino \
        -G 'Ninja' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        \
        -DBUILD_SHARED_LIBS:BOOL='false' \
        -DENABLE_OV_IR_FRONTEND:BOOL='true' \
        -DTHREADING:STRING='TBB' \
        -DENABLE_TBBBIND_2_5:BOOL='false' \
        -DBUILD_COMPILER_FOR_DRIVER:BOOL='true' \
        -DOPENVINO_EXTRA_MODULES:FILEPATH="${srcdir}/npu_compiler" \
        \
        -DENABLE_LTO:BOOL='false' \
        -DENABLE_FASTER_BUILD:BOOL='false' \
        -DENABLE_CPPLINT:BOOL='false' \
        -DENABLE_TESTS:BOOL='false' \
        -DENABLE_FUNCTIONAL_TESTS:BOOL='false' \
        -DENABLE_SAMPLES:BOOL='false' \
        -DENABLE_JS:BOOL='false' \
        -DENABLE_PYTHON:BOOL='false' \
        -DENABLE_PYTHON_PACKAGING:BOOL='false' \
        -DENABLE_WHEEL:BOOL='false' \
        -DENABLE_OV_ONNX_FRONTEND:BOOL='false' \
        -DENABLE_OV_PADDLE_FRONTEND:BOOL='false' \
        -DENABLE_OV_PYTORCH_FRONTEND:BOOL='false' \
        -DENABLE_OV_TF_FRONTEND:BOOL='false' \
        -DENABLE_OV_TF_LITE_FRONTEND:BOOL='false' \
        -DENABLE_OV_JAX_FRONTEND:BOOL='false' \
        -DENABLE_SYSTEM_PUGIXML:BOOL='true' \
        -DENABLE_SYSTEM_TBB:BOOL='true' \
        -DENABLE_TBB_RELEASE_ONLY:BOOL='false' \
        -DENABLE_OPENCV:BOOL='false' \
        -DENABLE_MULTI:BOOL='false' \
        -DENABLE_HETERO:BOOL='false' \
        -DENABLE_AUTO:BOOL='false' \
        -DENABLE_AUTO_BATCH:BOOL='false' \
        -DENABLE_TEMPLATE:BOOL='false' \
        -DENABLE_PROXY:BOOL='false' \
        -DENABLE_INTEL_CPU:BOOL='false' \
        -DENABLE_INTEL_GPU:BOOL='false' \
        -DENABLE_NPU_PLUGIN_ENGINE:BOOL='false' \
        -DENABLE_ZEROAPI_BACKEND:BOOL='false' \
        -DENABLE_DRIVER_COMPILER_ADAPTER:BOOL='false' \
        -DENABLE_INTEL_NPU_INTERNAL:BOOL='false' \
        -DENABLE_INTEL_NPU_PROTOPIPE:BOOL='false' \
        -DENABLE_PRIVATE_TESTS:BOOL='false' \
        -DENABLE_NPU_LSP_SERVER:BOOL='false'\
        -Wno-dev
    cmake --build build --target compilerTest profilingTest vpuxCompilerL0Test loaderTest
}

package() {
    DESTDIR="$pkgdir" cmake --install build --component CiD
}
