# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=openvino
pkgname=(
    'openvino'
    'openvino-intel-gpu-plugin'
    'openvino-intel-npu-plugin'
    'python-openvino')
pkgver=2025.4.1
pkgrel=1
_commit=82bbf0292c5bd490bc25a383e63d6461d3ee05c5
pkgdesc='A toolkit for optimizing and deploying deep learning models'
arch=('x86_64')
url='https://docs.openvino.ai/'
license=('Apache-2.0' 'LicenseRef-custom')
makedepends=(
    'cmake'
    'flatbuffers'
    'git'
    'git-lfs'
    'ocl-icd'
    'onetbb'
    'opencv'
    'patchelf'
    'pugixml'
    'pybind11'
    'python'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'snappy')
options=('!emptydirs')
source=("git+https://github.com/openvinotoolkit/openvino.git#commit=${_commit}?signed"
        'oneDNN-openvinotoolkit'::'git+https://github.com/openvinotoolkit/oneDNN.git'
        'git+https://github.com/herumi/xbyak.git'
        'git+https://github.com/madler/zlib.git'
        'git+https://github.com/gflags/gflags.git'
        'googletest-openvinotoolkit'::'git+https://github.com/openvinotoolkit/googletest.git'
        'git+https://github.com/KhronosGroup/OpenCL-Headers.git'
        'git+https://github.com/KhronosGroup/OpenCL-CLHPP.git'
        'git+https://github.com/onnx/onnx.git'
        'git+https://github.com/protocolbuffers/protobuf.git'
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
        '010-openvino-change-install-paths.patch'
        '020-openvino-disable-werror.patch')
sha256sums=('bdd6b8c7f36bd72886d5ea69676f4bc5bcbc04ce6aa310710d4f1e0cbff3af53'
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
            'a7c333ec8272b2a9c7adb87a194bbdbee5f5b281da0cfaaa99acf2316c32f6ac'
            'd5ff4b19ca9daf2b052650d2d7f60297239091c68e57fd7d5637508be0ef0e52')
validpgpkeys=('968479A1AFF927E37D1A566BB5690EEEBB952194')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    git -C openvino lfs install --local
    git -C openvino lfs pull "$(printf '%s' "${source[0]/git+/}" | sed 's/#.*$//')"
    
    git -C openvino submodule init
    git -C openvino config --local submodule.src/plugins/intel_cpu/thirdparty/onednn.url "${srcdir}/oneDNN-openvinotoolkit"
    git -C openvino config --local submodule.thirdparty/xbyak.url "${srcdir}/xbyak"
    git -C openvino config --local submodule.thirdparty/zlib/zlib.url "${srcdir}/zlib"
    git -C openvino config --local submodule.thirdparty/pugixml.update none
    git -C openvino config --local submodule.thirdparty/gflags/gflags.url "${srcdir}/gflags"
    git -C openvino config --local submodule.thirdparty/gtest/gtest.url "${srcdir}/googletest-openvinotoolkit"
    git -C openvino config --local submodule.thirdparty/ocl/icd_loader.update none
    git -C openvino config --local submodule.thirdparty/ocl/cl_headers.url "${srcdir}/OpenCL-Headers"
    git -C openvino config --local submodule.thirdparty/ocl/clhpp_headers.url "${srcdir}/OpenCL-CLHPP"
    git -C openvino config --local submodule.thirdparty/onnx.url "${srcdir}/onnx"
    git -C openvino config --local submodule.thirdparty/protobuf.url "${srcdir}/protobuf"
    git -C openvino config --local submodule.src/bindings/python/thirdparty/pybind11.update none
    git -C openvino config --local submodule.thirdparty/ittapi/ittapi.url "${srcdir}/ittapi"
    git -C openvino config --local submodule.ncc.url "${srcdir}/ncc"
    git -C openvino config --local submodule.thirdparty/onednn_gpu.url "${srcdir}/oneDNN"
    git -C openvino config --local submodule.thirdparty/json/nlohmann_json.url "${srcdir}/json"
    git -C openvino config --local submodule.thirdparty/flatbuffers/flatbuffers.update none
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
    
    patch -d openvino -Np1 -i "${srcdir}/010-openvino-change-install-paths.patch"
    patch -d openvino -Np1 -i "${srcdir}/020-openvino-disable-werror.patch"
    
    install -d -m755 {benchmark_app,licenses}
    install -d -m755 intel-gpu-plugin/usr/lib/openvino
    install -d -m755 intel-npu-plugin/usr/{bin,{lib,share/doc}/openvino}
}

build() {
    # fix warning: "_FORTIFY_SOURCE" redefined
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    export CXXFLAGS+=" -isystem${srcdir}/openvino/thirdparty/ocl/clhpp_headers/include"
    
    # note: does not accept 'None' build type
    # note: protopipe currently requires opencv 4.13.0, still unreleased at the time of writing
    cmake -B build -S openvino \
        -G 'Unix Makefiles' \
        -DBUILD_TESTING:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_CXX_STANDARD:STRING='17' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -DENABLE_SSE42:BOOL='OFF' \
        -DENABLE_AVX2:BOOL='OFF' \
        -DENABLE_AVX512F:BOOL='OFF' \
        -DENABLE_CLANG_FORMAT:BOOL='OFF' \
        -DENABLE_CPPLINT:BOOL='OFF' \
        -DENABLE_INTEL_NPU:BOOL='ON' \
        -DENABLE_INTEL_NPU_PROTOPIPE:BOOL='OFF' \
        -DENABLE_NCC_STYLE:BOOL='OFF' \
        -DENABLE_PLUGINS_XML:BOOL='ON' \
        -DENABLE_PYTHON:BOOL='ON' \
        -DENABLE_SAMPLES:BOOL='OFF' \
        -DENABLE_SYSTEM_FLATBUFFERS:BOOL='ON' \
        -DENABLE_SYSTEM_OPENCL:BOOL='ON' \
        -DENABLE_SYSTEM_PROTOBUF:BOOL='OFF' \
        -DENABLE_SYSTEM_PUGIXML:BOOL='ON' \
        -DENABLE_SYSTEM_SNAPPY:BOOL='ON' \
        -DENABLE_SYSTEM_TBB:BOOL='ON' \
        -DENABLE_TBBBIND_2_5:BOOL='OFF' \
        -DOpenCL_HPP:FILEPATH="${srcdir}/openvino/thirdparty/ocl/clhpp_headers/include/CL/opencl.hpp" \
        -DOpenCL_INCLUDE_DIR:PATH="${srcdir}/openvino/thirdparty/ocl/cl_headers" \
        -Wno-dev
    cmake --build build
    
    cd openvino/tools/benchmark_tool
    python -m build --wheel --no-isolation
    python -m installer --destdir="${srcdir}/benchmark_app" --prefix='' dist/*.whl
}

package_openvino() {
    depends=(
        'gcc-libs'
        'glibc'
        'onetbb'
        'pugixml'
        'snappy')
    optdepends=(
        'openvino-intel-gpu-plugin: for Intel GPU plugin'
        'openvino-intel-npu-plugin: for Intel NPU plugin')
    provides=('intel-openvino')
    conflicts=('intel-openvino')
    replaces=('intel-openvino')
    
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 openvino/bin/intel64/Release/libopenvino_template_extension.so -t "${pkgdir}/usr/lib"
    install -D -m644 openvino/bin/intel64/Release/libopenvino_template_plugin.so -t "${pkgdir}/usr/lib/openvino"
    cp -dr --no-preserve='ownership' openvino/bin/intel64/Release/libopenvino_jax_frontend.so* "${pkgdir}/usr/lib"
    
    mv "${pkgdir}/usr/lib/openvino"/libopenvino_intel_gpu_plugin.so intel-gpu-plugin/usr/lib/openvino
    mv "${pkgdir}/usr/lib/openvino"/libopenvino_intel_npu_plugin.so intel-npu-plugin/usr/lib/openvino
    #mv "${pkgdir}/usr/bin/ov-protopipe" intel-npu-plugin/usr/bin
    mv "${pkgdir}/usr/bin"/ov-{compile_tool,single-image-test} intel-npu-plugin/usr/bin
    #mv "${pkgdir}/usr/share/doc/openvino/README-protopipe.md" intel-npu-plugin/usr/share/doc/openvino
    mv "${pkgdir}/usr/share/doc/openvino"/README-{compile_tool,single-image-test}.md intel-npu-plugin/usr/share/doc/openvino
    
    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    mv "${pkgdir}/usr/lib/python${_pyver}" .
    
    cp "${pkgdir}/usr/share/licenses/${pkgname}"/* licenses
}

package_openvino-intel-gpu-plugin() {
    pkgdesc='Intel GPU plugin for OpenVINO'
    depends=(
        'gcc-libs'
        'glibc'
        'intel-compute-runtime'
        'ocl-icd'
        'onetbb'
        "openvino=${pkgver}"
        'pugixml')
    
    mv intel-gpu-plugin/usr "$pkgdir"
    install -D -m644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_openvino-intel-npu-plugin() {
    pkgdesc='Intel NPU plugin for OpenVINO'
    depends=(
        'gcc-libs'
        'glibc'
        'intel-npu-compiler'
        'intel-npu-driver'
        'onetbb'
        'opencv'
        "openvino=${pkgver}"
        'pugixml')
    
    mv intel-npu-plugin/usr "$pkgdir"
    install -D -m644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python-openvino() {
    pkgdesc='Python bindings for OpenVINO'
    depends=(
        'gcc-libs'
        'glibc'
        "openvino=${pkgver}"
        'python'
        'python-numpy'
        'python-openvino-telemetry'
        'python-packaging')
    optdepends=(
        'python-jax: for JAX frontend'
        'python-opencv: for filling vectors in benchmark'
        #'python-openvino-tokenizers: for OpenVINO converter (OVC)'
        'python-pillow: for Torchvision to OpenVINO preprocessing converter'
        'python-pytorch: for PyTorch frontend and Torchvision to OpenVINO preprocessing converter'
        'python-tensorflow: for TensorFlow frontend'
        'python-torchvision: for Torchvision to OpenVINO preprocessing converter')
    
    local _pyver
    local _site_pkgs
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    _site_pkgs=$(python -c "import site; print(site.getsitepackages()[0])")
    
    install -d -m755 "${pkgdir}/usr/lib"
    install -D -m755 benchmark_app/bin/benchmark_app "${pkgdir}/usr/bin/ov-py-benchmark_app"
    mv "python${_pyver}" "${pkgdir}/usr/lib"
    rm "${pkgdir}${_site_pkgs}/requirements.txt"
    
    export WHEEL_VERSION="$pkgver"
    python openvino/setup.py dist_info -o "${pkgdir}${_site_pkgs}"
    
    install -D -m644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
