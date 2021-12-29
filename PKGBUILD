# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=openvino
pkgver=2021.4.2
pkgrel=3
pkgdesc='A toolkit for developing artificial inteligence and deep learning applications'
arch=('x86_64')
url='https://docs.openvinotoolkit.org/'
license=('Apache')
depends=('numactl' 'libxml2')
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
             'python' 'cython' 'shellcheck')
provides=('intel-openvino')
conflicts=('intel-openvino')
replaces=('intel-openvino')
options=('!emptydirs')
# supported firmwares: VPU_SUPPORTED_FIRMWARES in inference-engine/cmake/vpu_dependencies.cmake
_firmware_ver=1875 # FIRMWARE_PACKAGE_VERSION in inference-engine/cmake/vpu_dependencies.cmake
_gnaver=03.00.00.1377 # GNA_VERSION (GNA2) in inference-engine/cmake/dependencies.cmake
_tbbver=2020_20200415 # inference-engine/cmake/dependencies.cmake
_tbbbind_ver=2_4_static_lin_v2 # inference-engine/cmake/dependencies.cmake
source=("git+https://github.com/openvinotoolkit/openvino.git#tag=${pkgver}"
        'git+https://github.com/opencv/ade.git'
        'oneDNN-openvinotoolkit'::'git+https://github.com/openvinotoolkit/oneDNN.git'
        'googletest-openvinotoolkit'::'git+https://github.com/openvinotoolkit/googletest.git'
        'git+https://github.com/gflags/gflags.git'
        'git+https://github.com/herumi/xbyak.git'
        'git+https://github.com/madler/zlib.git'
        "https://download.01.org/opencv/master/openvinotoolkit/thirdparty/unified/VPU/usb-ma2x8x/firmware_usb-ma2x8x_${_firmware_ver}.zip"
        "https://download.01.org/opencv/master/openvinotoolkit/thirdparty/unified/VPU/pcie-ma2x8x/firmware_pcie-ma2x8x_${_firmware_ver}.zip"
        "https://download.01.org/opencv/master/openvinotoolkit/thirdparty/unified/GNA/GNA_${_gnaver}.zip"
        "https://download.01.org/opencv/master/openvinotoolkit/thirdparty/linux/tbb${_tbbver}_lin_strip.tgz"
        "https://download.01.org/opencv/master/openvinotoolkit/thirdparty/linux/tbbbind_${_tbbbind_ver}.tgz"
        'openvino.conf'
        'openvino.sh'
        'setupvars.sh'
        '010-ade-disable-werror.patch'
        '020-openvino-cldnn-disable-werror.patch'
        '030-openvino-ngraph-disable-werror.patch')
noextract=("firmware_usb-ma2x8x_${_firmware_ver}.zip"
           "firmware_pcie-ma2x8x_${_firmware_ver}.zip"
           "GNA_${_gnaver}.zip"
           "tbb${_tbbver}_lin_strip.tgz"
           "tbbbind_${_tbbbind_ver}.tgz")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'e65fcc1c6b0f3e9d814e53022c212ec0a2b83197a9df38badb298fb85ccf3acf'
            'b11368fec2036d96fb703d2a40b171184fefe89f27e74a988ef1ca34260a2bc5'
            'd45fb48994d8c2803a16e88e29ae48851066325b97c1c6c4a5bf4f4573d55c65'
            '95b2f3b0b70c7376a0c7de351a355c2c514b42c4966e77e3e34271a599501008'
            '6dc926258c6cd3cba0f5c2cc672fd2ad599a1650fe95ab11122e8f361a726cb6'
            '66cbaab93a6097207ff0908db155d590ad30b5fe12b429473e0bdfa99d1fd37f'
            '49a1cdd2357ac3c657b28d72aea1294e4af46389e41ed0d55ccbd12bd995058d'
            'cfcc5af35d7a50f83c780716f69f8a800b14bcf143f7abafd31a7a0dcb8c9ae8'
            '502fcbb3fcbb66aa5149ad2cc5f1fa297b51ed12c5c9396a16b5795a03860ed0'
            'bd5ede546abb49f7f07bf9f2aa7d9c7b1ecd9deba35ea6f4338ac4dfa8887542'
            'cc35be4846faca62aa7b34a6e98f126499fbdfd52a34ba839be1bdf98b5dbe20')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    git -C openvino lfs install --local
    git -C openvino lfs pull "$(printf '%s' "${source[0]/git+/}" | sed 's/#.*$//')"
    
    git -C openvino submodule init
    git -C openvino config --local submodule.inference-engine/thirdparty/ade.url "${srcdir}/ade"
    git -C openvino config --local submodule.inference-engine/thirdparty/mkl-dnn.url "${srcdir}/oneDNN-openvinotoolkit"
    git -C openvino config --local submodule.inference-engine/tests/ie_test_utils/common_test_utils/gtest.url "${srcdir}/googletest-openvinotoolkit"
    git -C openvino config --local submodule.inference-engine/samples/thirdparty/gflags.url "${srcdir}/gflags"
    git -C openvino config --local submodule.thirdparty/xbyak.url "${srcdir}/xbyak"
    git -C openvino config --local submodule.thirdparty/zlib/zlib.url "${srcdir}/zlib"
    git -C openvino submodule update
    
    install -D -m644 "firmware_usb-ma2x8x_${_firmware_ver}.zip"  -t thirdparty/unified/VPU/usb-ma2x8x
    install -D -m644 "firmware_pcie-ma2x8x_${_firmware_ver}.zip" -t thirdparty/unified/VPU/pcie-ma2x8x
    install -D -m644 "GNA_${_gnaver}.zip" -t thirdparty/unified/GNA
    install -D -m644 "tbb${_tbbver}_lin_strip.tgz" "tbbbind_${_tbbbind_ver}.tgz" -t thirdparty/linux
    
    patch -d openvino/inference-engine/thirdparty/ade -Np1 -i "${srcdir}/010-ade-disable-werror.patch"
    patch -d openvino -Np1 -i "${srcdir}/020-openvino-cldnn-disable-werror.patch"
    patch -d openvino -Np1 -i "${srcdir}/030-openvino-ngraph-disable-werror.patch"
}

build() {
    local _ocvmaj
    _ocvmaj="$(opencv_version | awk -F'.' '{ print $1 }')"
    
    export IE_PATH_TO_DEPS="$srcdir"
    export OpenCV_DIR="/usr/lib/cmake/opencv${_ocvmaj}"
    
    # note: does not accept 'None' build type
    cmake -B build -S openvino \
        -DBUILD_TESTING:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/opt/intel/openvino' \
        -DENABLE_AVX512F:BOOL='OFF' \
        -DENABLE_PROFILING_ITT:BOOL='OFF' \
        -DENABLE_PYTHON:BOOL='ON' \
        -DENABLE_SPEECH_DEMO:BOOL='OFF' \
        -DENABLE_OPENCV:BOOL='OFF' \
        -DNGRAPH_UNIT_TEST_ENABLE:BOOL='FALSE' \
        -DNGRAPH_USE_SYSTEM_PROTOBUF:BOOL='OFF' \
        -DTREAT_WARNING_AS_ERROR:BOOL='OFF' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    
    install -D -m644 openvino.conf -t "${pkgdir}/etc/ld.so.conf.d"
    install -D -m755 openvino.sh -t "${pkgdir}/etc/profile.d"
    install -D -m755 setupvars.sh -t "${pkgdir}/opt/intel/openvino/bin"
    
    local _gnasover
    local _gnasover_full
    local _gnadir="${pkgdir}/opt/intel/openvino/deployment_tools/inference_engine/external/gna/lib"
    _gnasover="$(find "$_gnadir" -type f -regextype 'posix-basic' -regex '.*/libgna\.so\.[0-9]*$' | sed 's/.*\.//')"
    _gnasover_full="$(find "$_gnadir" -type f -regextype 'posix-basic' -regex '.*/libgna\.so\.[0-9]*\..*' | sed 's/.*\.so\.//')"
    
    rm "${_gnadir}/libgna.so"{,".${_gnasover}"}
    ln -s "libgna.so.${_gnasover_full}" "${_gnadir}/libgna.so.${_gnasover}"
    ln -s "libgna.so.${_gnasover}" "${_gnadir}/libgna.so"
    
    cp -dr --no-preserve='ownership' "openvino/inference-engine/temp/gna_${_gnaver}/include" \
        "${pkgdir}/opt/intel/openvino/deployment_tools/inference_engine/external/gna"
    chmod -R a+r "${pkgdir}/opt/intel/openvino/deployment_tools/inference_engine/external/gna/include"
}
