# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=openvino-git
pkgver=2021.4.2.r2181.g738a571742
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
            'python: for Python API'
            'python-numpy: for Python API'
            'cython: for Python API'
            'python-py-cpuinfo: for benchmark tool'
            'python-progress: for benchmark tool'
            'opencv: for benchmark and cross_check tools')
makedepends=('git' 'git-lfs' 'cmake' 'intel-compute-runtime' 'libusb' 'ocl-icd' 'opencv'
             'python' 'cython' 'shellcheck' 'aria2' 'wget')
provides=('openvino' 'intel-openvino-git')
conflicts=('openvino' 'intel-openvino-git')
replaces=('intel-openvino-git')
options=('!emptydirs' '!lto')
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
        'git+https://github.com/pboettch/json-schema-validator.git'
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
            '48b6a93bb54c36f9bc87a7f326b0a634f752f34f57f90a60dccc13f92fd96a9d'
            '15918bfcab40965828e2f6250b16152dc9b8c078bd86f1929bb5fd38f19f854d'
            '502fcbb3fcbb66aa5149ad2cc5f1fa297b51ed12c5c9396a16b5795a03860ed0'
            '33233c69916485f1bef20c9d5f48bdba1189012ce8bad9dafc01249e7bc10f86')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    git -C openvino lfs install --local
    git -C openvino lfs pull "${source[0]/git+/}"
    
    git -C openvino submodule init
    git -C openvino config --local submodule.src/plugins/intel_cpu/thirdparty/mkl-dnn.url "${srcdir}/oneDNN-openvinotoolkit"
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
    git -C openvino config --local submodule.thirdparty/json/nlohmann_json_schema_validator.url "${srcdir}/json-schema-validator"
    git -C openvino submodule update
    
    patch -d openvino/thirdparty/ade -Np1 -i "${srcdir}/010-ade-disable-werror.patch"
    patch -d openvino -Np1 -i "${srcdir}/020-openvino-use-protobuf-shared-libs.patch"
}

pkgver() {
    local _version
    local _revision
    local _shorthash
    _version="$(git -C openvino tag --list | sort -Vr | sed '/dev_/d' | head -n1)"
    _revision="$(git -C openvino rev-list --count "${_version}..HEAD")"
    _shorthash="$(git -C openvino rev-parse --short HEAD)"
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    local _ocvmaj
    _ocvmaj="$(opencv_version | awk -F'.' '{ print $1 }')"
    
    export OpenCV_DIR="/usr/lib/cmake/opencv${_ocvmaj}"
    
    # note: does not accept 'None' build type
    cmake -B build -S openvino \
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
        -DTREAT_WARNING_AS_ERROR:BOOL='OFF' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 openvino.conf -t "${pkgdir}/etc/ld.so.conf.d"
    
    local _gnaver
    local _gnasover
    local _gnasover_full
    local _gnadir="${pkgdir}/opt/intel/openvino/runtime/lib/intel64"
    _gnaver="$(find openvino/temp -maxdepth 1 -type d -name 'gna_*' | sed 's/.*_//')"
    _gnasover="$(find "$_gnadir" -type f -regextype 'posix-basic' -regex '.*/libgna\.so\.[0-9]*$' | sed 's/.*\.//')"
    _gnasover_full="$(find "$_gnadir" -type f -regextype 'posix-basic' -regex '.*/libgna\.so\.[0-9]*\..*' | sed 's/.*\.so\.//')"
    
    rm "${_gnadir}/libgna.so"{,".${_gnasover}"}
    ln -s "libgna.so.${_gnasover_full}" "${_gnadir}/libgna.so.${_gnasover}"
    ln -s "libgna.so.${_gnasover}" "${_gnadir}/libgna.so"
    
    cp -dr --no-preserve='ownership' "openvino/temp/gna_${_gnaver}/include" \
        "${pkgdir}/opt/intel/openvino/runtime/include/gna"
    chmod -R a+r "${pkgdir}/opt/intel/openvino/runtime/include/gna"
}
