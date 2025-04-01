# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=openvino
pkgname=(
    'openvino'
    'openvino-intel-gpu-plugin'
    'openvino-intel-npu-plugin'
    'python-openvino')
pkgver=2025.0.0
pkgrel=2
_commit=1f68be9f5945f2a239ada580e62c992d820f9cb7
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
    'protobuf'
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
        '010-openvino-change-install-paths.patch'
        '020-openvino-disable-werror.patch'
        '030-openvino-level-zero-disable-werror.patch'
        '040-openvino-protobuf23-fix.patch'
        '050-opevino-cmake4-fix.patch')
sha256sums=('5f560596631a1428f378468215d21dee44dd0dd2556f1ece3352dcb775397940'
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
            'd9d65a752744d324b43033fb223a50ab945090278a801d797c55649587210216'
            '8858496f3e2409d4d72802e9dd6823167309feee35086c591212692883f8bb7f'
            'f7893f1a68555471646c4b7593c16330068c04587dc8cf140a1a3817527d377a'
            'bcc3b452c40799187b7ba2c557516ef72d55929c44bed2c4d7182cfd01bae4ce'
            'ce883a506fc7964d10f03a20fa4620d69fef4aa5c4a2ecb07ce9d13d29dba7fc')
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
    git -C openvino config --local submodule.thirdparty/protobuf.update none
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
    git -C openvino -c protocol.file.allow='always' submodule update
    
    patch -d openvino -Np1 -i "${srcdir}/010-openvino-change-install-paths.patch"
    patch -d openvino -Np1 -i "${srcdir}/020-openvino-disable-werror.patch"
    patch -d openvino/thirdparty/level_zero/level-zero -Np1 -i "${srcdir}/030-openvino-level-zero-disable-werror.patch"
    patch -d openvino -Np1 -i "${srcdir}/040-openvino-protobuf23-fix.patch"
    patch -d openvino -Np1 -i "${srcdir}/050-opevino-cmake4-fix.patch"
    
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
        -DENABLE_INTEL_NPU_PROTOPIPE:BOOL='ON' \
        -DENABLE_NCC_STYLE:BOOL='OFF' \
        -DENABLE_SAMPLES:BOOL='OFF' \
        -DENABLE_PYTHON:BOOL='ON' \
        -DENABLE_SYSTEM_FLATBUFFERS:BOOL='ON' \
        -DENABLE_SYSTEM_OPENCL:BOOL='ON' \
        -DENABLE_SYSTEM_PROTOBUF:BOOL='ON' \
        -DENABLE_SYSTEM_PUGIXML:BOOL='ON' \
        -DENABLE_SYSTEM_SNAPPY:BOOL='ON' \
        -DENABLE_SYSTEM_TBB:BOOL='ON' \
        -DENABLE_TBBBIND_2_5:BOOL='OFF' \
        -DOpenCL_HPP:FILEPATH="${srcdir}/openvino/thirdparty/ocl/clhpp_headers/include/CL/opencl.hpp" \
        -DOpenCL_INCLUDE_DIR:PATH="${srcdir}/openvino/thirdparty/ocl/cl_headers" \
        -DProtobuf_USE_STATIC_LIBS:BOOL='OFF' \
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
        'protobuf'
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
    mv "${pkgdir}/usr/bin"/ov-{compile_tool,protopipe,single-image-test} intel-npu-plugin/usr/bin
    mv "${pkgdir}/usr/share/doc/openvino"/README-{compile_tool,protopipe,single-image-test}.md intel-npu-plugin/usr/share/doc/openvino
    
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
    python openvino/src/bindings/python/wheel/setup.py dist_info -o "${pkgdir}${_site_pkgs}"
    
    install -D -m644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
