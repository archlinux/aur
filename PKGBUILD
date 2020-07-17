# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-openvino
pkgver=2020.4
pkgrel=1
pkgdesc='Toolkit for developing applications and solutions that emulate human vision using Intel hardware'
arch=('x86_64')
url='https://docs.openvinotoolkit.org/'
license=('Apache')
depends=('ocl-icd' 'intel-compute-runtime' 'libusb' 'protobuf' 'tbb')
optdepends=('python: for using the Python API'
            'python-numpy: for using the Python API'
            'cython: for using the Python API'
            'python-py-cpuinfo: for running the benchmark tool'
            'python-progress: for running the benchmark tool'
            'opencv: for running the benchmark tool')
makedepends=('git' 'cmake' 'python' 'cython' 'opencv')
options=('!emptydirs')
_firmware_ver=1223
_gnaver=02.00.00.0925
source=("git+https://github.com/openvinotoolkit/openvino.git#tag=${pkgver}"
        'git+https://github.com/opencv/ade.git'
        'git+https://github.com/openvinotoolkit/oneDNN.git'
        'googletest-openvinotoolkit'::'git+https://github.com/openvinotoolkit/googletest.git'
        'git+https://github.com/gflags/gflags.git'
        "https://download.01.org/opencv/master/openvinotoolkit/thirdparty/unified/VPU/usb-ma2450/firmware_usb-ma2450_${_firmware_ver}.zip"
        "https://download.01.org/opencv/master/openvinotoolkit/thirdparty/unified/VPU/usb-ma2x8x/firmware_usb-ma2x8x_${_firmware_ver}.zip"
        "https://download.01.org/opencv/master/openvinotoolkit/thirdparty/unified/VPU/pcie-ma248x/firmware_pcie-ma248x_${_firmware_ver}.zip"
        "https://download.01.org/opencv/master/openvinotoolkit/thirdparty/unified/GNA/GNA_${_gnaver}.zip"
        'intel-openvino.conf'
        'intel-openvino.sh'
        'setupvars.sh'
        '010-ade-disable-werror.patch'
        '020-intel-openvino-cldnn-disable-werror.patch'
        '030-intel-openvino-do-not-install-tbb.patch'
        '040-intel-openvino-cldnn-fix-build.patch'::'https://github.com/openvinotoolkit/openvino/commit/ed444bf9f4dda442bd2da51140f45631163e0e55.patch')
noextract=("firmware_usb-ma2450_${_firmware_ver}.zip"
           "firmware_usb-ma2x8x_${_firmware_ver}.zip"
           "firmware_pcie-ma248x_${_firmware_ver}.zip"
           "GNA_${_gnaver}.zip")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '4dc246bd12d7a21c1b10ac3e090b30043777c4ea862e1e4119536ba03c5878ef'
            'd1d209221c1389a9a04e14ffeeaff1c3308f6ab105c7bd22f0e300df01cce4d8'
            '64dd77ecd2f7172421414a388a87be4e6271894a982a58b3829f9de1a1869abd'
            'fc9bf2a1326ded58dc87c6e6bcdac2dcd1b977ebf817f51c6f8d2f8540a14d6c'
            'f485aa97d88d424dd3a223e0eddbbc382ec6c8d5094d51cbd3f0524b915e3d68'
            '49a1cdd2357ac3c657b28d72aea1294e4af46389e41ed0d55ccbd12bd995058d'
            '093199ae759e8755166b9737562438866123eda9b1afbbef2f7107b3cf827be5'
            '502fcbb3fcbb66aa5149ad2cc5f1fa297b51ed12c5c9396a16b5795a03860ed0'
            'b58aa9ec526cb6c528c58fc8b1a1b93b425999d1de29f0dd15a8b680c9eb8c77'
            '806a8fd32f45e03d88e22f171fc831a319a1ef78c9da6b0700ca8ef43cb7a94d'
            'cf936694fca3a840bec33bfd94fd13cfb7f8ba47b822965a6129a6818abdeab2')

prepare() {
    git -C openvino submodule init
    git -C openvino config --local submodule.inference-engine/thirdparty/ade.url "${srcdir}/ade"
    git -C openvino config --local submodule.inference-engine/thirdparty/mkl-dnn.url "${srcdir}/oneDNN"
    git -C openvino config --local submodule.inference-engine/tests/ie_test_utils/common_test_utils/gtest.url "${srcdir}/googletest-openvinotoolkit"
    git -C openvino config --local submodule.inference-engine/samples/thirdparty/gflags.url "${srcdir}/gflags"
    git -C openvino submodule update
    
    install -D -m644 "firmware_usb-ma2450_${_firmware_ver}.zip"  -t thirdparty/unified/VPU/usb-ma2450
    install -D -m644 "firmware_usb-ma2x8x_${_firmware_ver}.zip"  -t thirdparty/unified/VPU/usb-ma2x8x
    install -D -m644 "firmware_pcie-ma248x_${_firmware_ver}.zip" -t thirdparty/unified/VPU/pcie-ma248x
    install -D -m644 "GNA_${_gnaver}.zip" -t thirdparty/unified/GNA
    
    patch -d openvino/inference-engine/thirdparty/ade -Np1 -i "${srcdir}/010-ade-disable-werror.patch"
    patch -d openvino -Np1 -i "${srcdir}/020-intel-openvino-cldnn-disable-werror.patch"
    patch -d openvino -Np1 -i "${srcdir}/030-intel-openvino-do-not-install-tbb.patch"
    patch -d openvino -Np1 -i "${srcdir}/040-intel-openvino-cldnn-fix-build.patch"
}

build() {
    local _ocvmaj
    local _pyver
    _ocvmaj="$(opencv_version | awk -F'.' '{ print $1 }')"
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    
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
        -DPYTHON_EXECUTABLE='/usr/bin/python' \
        -DPYTHON_LIBRARY="/usr/lib/libpython${_pyver}.so" \
        -DPYTHON_INCLUDE_DIR="/usr/include/python${_pyver}" \
        -DENABLE_OPENCV:BOOL='OFF' \
        -DNGRAPH_TEST_UTIL_ENABLE:BOOL='OFF' \
        -DNGRAPH_UNIT_TEST_ENABLE:BOOL='FALSE' \
        -DNGRAPH_USE_SYSTEM_PROTOBUF:BOOL='ON' \
        -DTBBROOT:PATH='/usr' \
        -DTBB_DIR:PATH='/usr/lib/cmake/TBB' \
        -DTREAT_WARNING_AS_ERROR:BOOL='OFF' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    
    install -D -m644 intel-openvino.conf -t "${pkgdir}/etc/ld.so.conf.d"
    install -D -m755 intel-openvino.sh -t "${pkgdir}/etc/profile.d"
    install -D -m755 setupvars.sh -t "${pkgdir}/opt/intel/openvino/bin"
    cp -a "openvino/inference-engine/temp/gna_${_gnaver}/include" "${pkgdir}/opt/intel/openvino/deployment_tools/inference_engine/external/gna"
}
