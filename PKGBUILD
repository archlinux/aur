# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# only Intel GPUs are supported:
# https://github.com/openvinotoolkit/openvino/issues/452#issuecomment-722941119

pkgname=openvino
pkgver=2023.0.1
pkgrel=2
pkgdesc='A toolkit for developing artificial inteligence and deep learning applications'
arch=('x86_64')
url='https://docs.openvinotoolkit.org/'
license=('Apache')
depends=('pugixml' 'onetbb')
optdepends=('intel-compute-runtime: for Intel GPU plugin'
            'ocl-icd: for Intel GPU plugin'
            'snappy: for tensorflow frontend'
            'protobuf: for tensorflow, paddle and onnx frontends'
            'python: for Python API'
            'python-numpy: for Python API'
            'cython: for Python API')
makedepends=('git' 'git-lfs' 'cmake' 'opencl-clhpp' 'opencl-headers' 'ocl-icd' 'opencv'
             'snappy' 'python' 'python-setuptools' 'cython' 'fdupes' 'patchelf'
             'shellcheck')
provides=('intel-openvino')
conflicts=('intel-openvino')
replaces=('intel-openvino')
options=('!emptydirs')
_gnaver=03.05.00.1906 # GNA_VERSION in cmake/dependencies.cmake
source=("git+https://github.com/openvinotoolkit/openvino.git#tag=${pkgver}"
        "https://storage.openvinotoolkit.org/dependencies/gna/gna_${_gnaver}.zip"
        'oneDNN-openvinotoolkit'::'git+https://github.com/openvinotoolkit/oneDNN.git'
        'git+https://github.com/herumi/xbyak.git'
        'git+https://github.com/madler/zlib.git'
        'git+https://github.com/zeux/pugixml.git'
        'git+https://github.com/opencv/ade.git'
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
        'git+https://github.com/openvinotoolkit/open_model_zoo.git'
        'git+https://github.com/nlohmann/json.git'
        'git+https://github.com/google/flatbuffers.git'
        'git+https://github.com/google/snappy.git'
        'git+https://github.com/ARM-software/ComputeLibrary.git'
        'openvino.conf'
        'setupvars.sh'
        '010-ade-disable-werror.patch'
        '015-openvino-disable-werror.patch'
        '020-openvino-use-protobuf-shared-libs.patch')
sha256sums=('SKIP'
            '4a5be86d9c026b0e10afac2a57fc7c99d762b30e3d506abb3a3380fbcfe2726e'
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
            '335a55533ab26bd1f63683921baf33b8e8e3f2732a94554916d202ee500f90af'
            'e5024ad3382f285fe63dc58faca379f11a669bbe9f5d90682c59ad588aab434c'
            '502fcbb3fcbb66aa5149ad2cc5f1fa297b51ed12c5c9396a16b5795a03860ed0'
            '7f81f5ef6600b069e7e0b8ff11b7b48768991b9b4d9cd3c4cf845cd8dc99d26d'
            '49464620f363dfbd06c539e80e4f6bdf233e2d28f78e1aeedb419fb1eb9ebc81')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    git -C openvino lfs install --local
    git -C openvino lfs pull "$(printf '%s' "${source[0]/git+/}" | sed 's/#.*$//')"
    
    git -C openvino submodule init
    git -C openvino config --local submodule.src/plugins/intel_cpu/thirdparty/onednn.url "${srcdir}/oneDNN-openvinotoolkit"
    git -C openvino config --local submodule.thirdparty/xbyak.url "${srcdir}/xbyak"
    git -C openvino config --local submodule.thirdparty/zlib/zlib.url "${srcdir}/zlib"
    git -C openvino config --local submodule.thirdparty/pugixml.url "${srcdir}/pugixml"
    git -C openvino config --local submodule.thirdparty/ade.url "${srcdir}/ade"
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
    git -C openvino config --local submodule.tools/pot/thirdparty/open_model_zoo.url "${srcdir}/open_model_zoo"
    git -C openvino config --local submodule.thirdparty/json/nlohmann_json.url "${srcdir}/json"
    git -C openvino config --local submodule.thirdparty/flatbuffers/flatbuffers.url "${srcdir}/flatbuffers"
    git -C openvino config --local submodule.thirdparty/snappy.url "${srcdir}/snappy"
    git -C openvino config --local submodule.ARMComputeLibrary.url "${srcdir}/ComputeLibrary"
    git -C openvino -c protocol.file.allow='always' submodule update
    
    mkdir -p openvino/temp
    cp -af "gna_${_gnaver}" openvino/temp
    printf '%s\n' "${source[1]}" > "openvino/temp/gna_${_gnaver}/ie_dependency.info"
    
    # ade gcc 13 fix
    git -C openvino/thirdparty/ade cherry-pick --no-commit 7cecc9138b89e1946e3e515727bb69b2ab119806
    
    patch -d openvino/thirdparty/ade -Np1 -i "${srcdir}/010-ade-disable-werror.patch"
    patch -d openvino -Np1 -i "${srcdir}/015-openvino-disable-werror.patch"
    #patch -d openvino -Np1 -i "${srcdir}/020-openvino-use-protobuf-shared-libs.patch"
}

build() {
    local _ocvmaj
    _ocvmaj="$(opencv_version | awk -F'.' '{ print $1 }')"
    
    local -x OpenCV_DIR="/usr/lib/cmake/opencv${_ocvmaj}"
    
    # note: does not accept 'None' build type
    cmake -B build -S openvino \
        -G 'Unix Makefiles' \
        -DBUILD_TESTING:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/opt/intel/openvino' \
        -DENABLE_AVX512F:BOOL='OFF' \
        -DENABLE_PYTHON:BOOL='ON' \
        -DENABLE_OPENCV:BOOL='OFF' \
        -DENABLE_CLANG_FORMAT:BOOL='OFF' \
        -DENABLE_NCC_STYLE:BOOL='OFF' \
        -DENABLE_SYSTEM_PUGIXML:BOOL='ON' \
        -DENABLE_SYSTEM_TBB:BOOL='ON' \
        -DENABLE_SYSTEM_OPENCL:BOOL='ON' \
        -DENABLE_SYSTEM_PROTOBUF:BOOL='OFF' \
        -DENABLE_SYSTEM_FLATBUFFERS:BOOL='OFF' \
        -DENABLE_SYSTEM_SNAPPY:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 openvino.conf -t "${pkgdir}/etc/ld.so.conf.d"
}
