# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=openvino
pkgver=2022.3.0
pkgrel=1
pkgdesc='A toolkit for developing artificial inteligence and deep learning applications'
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
             'python' 'cython' 'shellcheck' 'tbb')
provides=('intel-openvino')
conflicts=('intel-openvino')
replaces=('intel-openvino')
options=('!emptydirs')
# supported firmwares: VPU_SUPPORTED_FIRMWARES in src/plugins/intel_myriad/myriad_dependencies.cmake
_firmware_ver=20221129_35 # FIRMWARE_PACKAGE_VERSION in src/plugins/intel_myriad/myriad_dependencies.cmake
_gnaver=03.00.00.1910 # GNA_VERSION in cmake/dependencies.cmake
#_tbbver=2020_617e9a71 # cmake/dependencies.cmake
#_tbbbind_ver=2_5_static_lin_v2 # cmake/dependencies.cmake
source=("git+https://github.com/openvinotoolkit/openvino.git#tag=${pkgver}"
        "https://storage.openvinotoolkit.org/dependencies/myriad/firmware_pcie-ma2x8x_${_firmware_ver}.zip"
        "https://storage.openvinotoolkit.org/dependencies/myriad/firmware_usb-ma2x8x_${_firmware_ver}.zip"
        "https://storage.openvinotoolkit.org/dependencies/gna/gna_${_gnaver}.zip"
        #"https://storage.openvinotoolkit.org/dependencies/thirdparty/linux/tbb${_tbbver}_lin_strip.tgz"
        #"https://download.01.org/opencv/master/openvinotoolkit/thirdparty/linux/tbbbind_${_tbbbind_ver}.tgz"
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
        'openvino.conf'
        'setupvars.sh'
        '010-ade-disable-werror.patch'
        '020-openvino-use-protobuf-shared-libs.patch')
noextract=("firmware_usb-ma2x8x_${_firmware_ver}.zip"
           "firmware_pcie-ma2x8x_${_firmware_ver}.zip")
sha256sums=('SKIP'
            '5667eb028290fbec92220031590ba5f87774a7b638b13178e0dcf8447a4ee8ca'
            '1ca3566d294c8d269f3a0ad2f5699e9dbb2679a24a455b2cc343612303d867bd'
            '894ddbc0ae3459f04513b853b0cabc32890dd4ea37228a022b6a32101bdbb7f8'
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
            '5661837265c8e9cb1876982c7fc192ac694b7aa25448d8987c84ac545d31a4c6')

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
    git -C openvino -c protocol.file.allow='always' submodule update
    
    mkdir -p openvino/temp/vpu/firmware/{pcie,usb}-ma2x8x
    bsdtar -xf "firmware_pcie-ma2x8x_${_firmware_ver}.zip" -C openvino/temp/vpu/firmware/pcie-ma2x8x
    bsdtar -xf "firmware_usb-ma2x8x_${_firmware_ver}.zip"  -C openvino/temp/vpu/firmware/usb-ma2x8x
    cp -af "gna_${_gnaver}" openvino/temp
    #cp -af tbb openvino/temp
    #cp -af "tbbbind_${_tbbbind_ver/_static*/}" openvino/temp
    
    printf '%s\n' "${source[1]}" > openvino/temp/vpu/firmware/pcie-ma2x8x/ie_dependency.info
    printf '%s\n' "${source[2]}" > openvino/temp/vpu/firmware/usb-ma2x8x/ie_dependency.info
    printf '%s\n' "${source[3]}" > "openvino/temp/gna_${_gnaver}/ie_dependency.info"
    #printf '%s\n' "${source[4]}" > openvino/temp/tbb/ie_dependency.info
    #printf '%s\n' "${source[5]}" > "openvino/temp/tbbbind_${_tbbbind_ver/_static*/}/ie_dependency.info"
    
    patch -d openvino/thirdparty/ade -Np1 -i "${srcdir}/010-ade-disable-werror.patch"
    patch -d openvino -Np1 -i "${srcdir}/020-openvino-use-protobuf-shared-libs.patch"
}

build() {
    local _ocvmaj
    _ocvmaj="$(opencv_version | awk -F'.' '{ print $1 }')"
    
    local -x OpenCV_DIR="/usr/lib/cmake/opencv${_ocvmaj}"
    
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
        -DENABLE_ONEDNN_FOR_GPU:BOOL='OFF' \
        -DTREAT_WARNING_AS_ERROR:BOOL='OFF' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 openvino.conf -t "${pkgdir}/etc/ld.so.conf.d"
}
