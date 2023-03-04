# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=openvino-git
pkgver=2022.3.0.r990.ga1cde2e7901
pkgrel=1
pkgdesc='A toolkit for developing artificial inteligence and deep learning applications (git version)'
arch=('x86_64')
url='https://docs.openvinotoolkit.org/'
license=('Apache')
depends=('protobuf' 'numactl' 'libxml2')
# GPU (clDNN) plugin: only Intel GPUs are supported:
# https://github.com/openvinotoolkit/openvino/issues/452#issuecomment-722941119
optdepends=('intel-compute-runtime: for GPU (clDNN) plugin'
            'ocl-icd: for GPU (clDNN) plugin'
            'libusb: for Myriad plugin'
            'tbb: for Myriad plugin'
            'python: for Python API'
            'python-numpy: for Python API'
            'cython: for Python API')
makedepends=('git' 'git-lfs' 'cmake' 'intel-compute-runtime' 'libusb' 'ocl-icd' 'opencv'
             'patchelf' 'python' 'cython' 'shellcheck' 'aria2' 'wget' 'tbb')
provides=('openvino' 'intel-openvino-git')
conflicts=('openvino' 'intel-openvino-git')
replaces=('intel-openvino-git')
options=('!emptydirs')
source=('git+https://github.com/openvinotoolkit/openvino.git'
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
        'openvino.conf'
        'setupvars.sh'
        '010-ade-disable-werror.patch'
        '020-openvino-use-protobuf-shared-libs.patch')
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
            '335a55533ab26bd1f63683921baf33b8e8e3f2732a94554916d202ee500f90af'
            'e5024ad3382f285fe63dc58faca379f11a669bbe9f5d90682c59ad588aab434c'
            '502fcbb3fcbb66aa5149ad2cc5f1fa297b51ed12c5c9396a16b5795a03860ed0'
            '9faccd9dc8088e36560a402b7613e149b773479b5070002d9504bf7bb2a267ed')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    git -C openvino lfs install --local
    git -C openvino lfs pull "${source[0]/git+/}"
    
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
    git -C openvino -c protocol.file.allow='always' submodule update
    
    patch -d openvino/thirdparty/ade -Np1 -i "${srcdir}/010-ade-disable-werror.patch"
    patch -d openvino -Np1 -i "${srcdir}/020-openvino-use-protobuf-shared-libs.patch"
}

pkgver() {
    local _version
    _version="$(git -C openvino tag --list | grep '^[[:digit:]]' | sed '/dev/d' | sort -r | head -n1)"
    printf '%s.r%s.g%s' "$_version" \
                        "$(git -C openvino rev-list --count "${_version}..HEAD")" \
                        "$(git -C openvino rev-parse --short HEAD)"
}

build() {
    local _ocvmaj
    _ocvmaj="$(opencv_version | awk -F'.' '{ print $1 }')"
    
    export OpenCV_DIR="/usr/lib/cmake/opencv${_ocvmaj}"
    
    # note: does not accept 'None' build type
    cmake -B build -S openvino \
        -G 'Unix Makefiles' \
        -DBUILD_TESTING:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/opt/intel/openvino' \
        -DENABLE_AVX512F:BOOL='OFF' \
        -DENABLE_PROFILING_ITT:BOOL='OFF' \
        -DENABLE_PYTHON:BOOL='ON' \
        -DENABLE_OPENCV:BOOL='OFF' \
        -DENABLE_CLANG_FORMAT:BOOL='OFF' \
        -DENABLE_NCC_STYLE:BOOL='OFF' \
        -DENABLE_SYSTEM_PROTOBUF:BOOL='ON' \
        -DENABLE_ONEDNN_FOR_GPU:BOOL='OFF' \
        -DENABLE_INTEL_GNA:BOOL='OFF' \
        -Dopencl_root_hints="${srcdir}/OpenCL-CLHPP/include" \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 openvino.conf -t "${pkgdir}/etc/ld.so.conf.d"
}
