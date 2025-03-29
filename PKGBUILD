# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# Upstream recommends a minimum of 32GB of RAM for building.
# If you get the error "c++: fatal error: Killed signal terminated program cc1plus",
# upstream recommends to decrease the number of building threads. You will need to
# manually modify the PKGBUILD for this, and add a '--parallel <n>' option at the
# end of the cmake build command.

pkgname=intel-npu-compiler
pkgver=2025.12
pkgrel=1
_npu_compiler_tag=npu_ud_2025_12_rc2
_openvino_commit=8d5f583bc7e56152440192806b3acda619a997fe
pkgdesc='Intel Neural Processing Unit (NPU) compiler'
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
source=("git+https://github.com/openvinotoolkit/npu_compiler.git#tag=${_npu_compiler_tag}"
        "git+https://github.com/openvinotoolkit/openvino.git#commit=${_openvino_commit}"
        # common git submodules
        'git+https://github.com/google/flatbuffers.git'
        'git+https://github.com/jbeder/yaml-cpp.git'
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
        'git+https://github.com/openvinotoolkit/telemetry.git'
        'git+https://github.com/libxsmm/libxsmm.git'
        'git+https://github.com/openvinotoolkit/shl.git'
        
        '010-intel-npu-compiler-llvm-disable-atomic-check.patch'
        '020-intel-npu-compiler-disable-werror.patch'
        '030-intel-npu-compiler-build-options.patch'
        '040-intel-npu-compiler-fix-install.patch'
        '010-openvino-disable-werror.patch'
        '020-openvino-level-zero-disable-werror.patch')
sha256sums=('f0368514eed2814b4530f4ac514659af7c3068f2455d3547a3bc8c05e4fdaf8b'
            'e1a37e41b5bb4ab654dea8c2e0961ae068142c8a73d285aa6da2984b37c51f4c'
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
            '9123c2b05f4cc9d203c5c51df2254fc5b1bb02f55918bbf4059907185b045cec'
            '142f2d9f63c0fcc0a8484711ba5f67b819eee83ba698ad60d70e281cba069c4a'
            '563e9c19fae5e7200281c506500df7bd4d7e305b0a23101c6a1d9306f20fef8d'
            '0ac423551d42290063d0b11ef7d23fe5debb6bc2c9e5c9ca137f98be910cc2ff'
            '61759ec17031a94222270dec03052010bf3da8bc2d53088d1bfe2ec9ef547dc5'
            'f7893f1a68555471646c4b7593c16330068c04587dc8cf140a1a3817527d377a')

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
    git -C npu_compiler config --local submodule.thirdparty/yaml-cpp.url "${srcdir}/yaml-cpp"
    git -C npu_compiler config --local submodule.thirdparty/gtest-parallel.url "${srcdir}/gtest-parallel"
    git -C npu_compiler -c protocol.file.allow='always' submodule update
    
    git -C npu_compiler/thirdparty/vpucostmodel lfs install --local
    git -C npu_compiler/thirdparty/vpucostmodel lfs pull https://github.com/intel/npu-nn-cost-model.git
    
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
    git -C openvino -c protocol.file.allow='always' submodule update
    
    ln -sf ../npu_compiler/CMakePresets.json openvino/CMakePresets.json
    
    patch -d npu_compiler/thirdparty/llvm-project -Np1 -i "${srcdir}/010-intel-npu-compiler-llvm-disable-atomic-check.patch"
    patch -d npu_compiler -Np1 -i "${srcdir}/020-intel-npu-compiler-disable-werror.patch"
    patch -d npu_compiler -Np1 -i "${srcdir}/030-intel-npu-compiler-build-options.patch"
    patch -d npu_compiler -Np1 -i "${srcdir}/040-intel-npu-compiler-fix-install.patch"
    
    patch -d openvino -Np1 -i "${srcdir}/010-openvino-disable-werror.patch"
    patch -d openvino/thirdparty/level_zero/level-zero -Np1 -i "${srcdir}/020-openvino-level-zero-disable-werror.patch"
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
    
    export NPU_PLUGIN_HOME="${srcdir}/npu_compiler"
    export OPENVINO_HOME="${srcdir}/openvino"
    
    cmake -B build -S openvino --preset npuCidReleaseLinux -Wno-dev
    cmake --build build --target compilerTest profilingTest vpuxCompilerL0Test loaderTest
}

package() {
    DESTDIR="$pkgdir" cmake --install build --prefix '/usr' --component CiD
}
