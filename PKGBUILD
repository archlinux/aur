# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-openvino
pkgver=2020.3.0
pkgrel=2
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
_firmware_ver=1119
_gnaver=01.00.00.1401
source=("git+https://github.com/openvinotoolkit/openvino.git#tag=${pkgver}"
        'git+https://github.com/opencv/ade.git'
        'git+https://github.com/NervanaSystems/ngraph.git'
        "https://download.01.org/opencv/${pkgver%%.*}/openvinotoolkit/${pkgver%.*}/inference_engine/firmware_usb-ma2450_${_firmware_ver}.zip"
        "https://download.01.org/opencv/${pkgver%%.*}/openvinotoolkit/${pkgver%.*}/inference_engine/firmware_usb-ma2x8x_${_firmware_ver}.zip"
        "https://download.01.org/opencv/${pkgver%%.*}/openvinotoolkit/${pkgver%.*}/inference_engine/firmware_pcie-ma248x_${_firmware_ver}.zip"
        "https://download.01.org/opencv/${pkgver%%.*}/openvinotoolkit/${pkgver%.*}/inference_engine/GNA_${_gnaver}.zip"
        'intel-openvino.conf'
        'intel-openvino.sh'
        'setupvars.sh'
        '010-ade-disable-werror.patch'
        '020-intel-openvino-cldnn-disable-werror.patch'
        '030-intel-openvino-do-not-install-tbb.patch'
        '040-intel-openvino-cldnn-fix-build.patch'::'https://github.com/openvinotoolkit/openvino/commit/ed444bf9f4dda442bd2da51140f45631163e0e55.patch'
        '050-intel-openvino-mkldnn-fix-build.patch'::'https://github.com/openvinotoolkit/openvino/commit/63a77bb4a18d4d95f8056a88027468360af091d4.patch')
noextract=('firmware_usb-ma2450_1119.zip'
           'firmware_usb-ma2x8x_1119.zip'
           'firmware_pcie-ma248x_1119.zip'
           "GNA_${_gnaver}.zip")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '9b8f61954751343995dde9d714134e5082dbaadffb0c7c33d41ce84c1296a20e'
            '94cd485105de47ef3f747baec1261a1254ddf30e308807948dd8b0176ecdfebf'
            '338940db127b16231e0afa948c83ed576458b130dd2a0a593c5edb29d9637f35'
            'be1a0779fc13be30161a7d2f3592c3948476bbe735b797a37d0a4d7afdc404c5'
            'f485aa97d88d424dd3a223e0eddbbc382ec6c8d5094d51cbd3f0524b915e3d68'
            '49a1cdd2357ac3c657b28d72aea1294e4af46389e41ed0d55ccbd12bd995058d'
            '3b72b36f9e7ae69fce4a72dc8b6bb73cd80298b53733353dcae074a5ced3e418'
            '502fcbb3fcbb66aa5149ad2cc5f1fa297b51ed12c5c9396a16b5795a03860ed0'
            'b58aa9ec526cb6c528c58fc8b1a1b93b425999d1de29f0dd15a8b680c9eb8c77'
            '70064c504ccbde211d06deaff7a810f8a896ff218cb12438d0bae701d8f5b98a'
            'cf936694fca3a840bec33bfd94fd13cfb7f8ba47b822965a6129a6818abdeab2'
            '33185d586143a8eeb68451519ae5aa519883d3d05e43715fb3eb604d47050f28')

prepare() {
    git -C openvino submodule init
    git -C openvino config --local submodule.inference-engine/thirdparty/ade.url "${srcdir}/ade"
    git -C openvino config --local submodule.ngraph.url "${srcdir}/ngraph"
    git -C openvino submodule update
    
    patch -d openvino/inference-engine/thirdparty/ade -Np1 -i "${srcdir}/010-ade-disable-werror.patch"
    patch -d openvino -Np1 -i "${srcdir}/020-intel-openvino-cldnn-disable-werror.patch"
    patch -d openvino -Np1 -i "${srcdir}/030-intel-openvino-do-not-install-tbb.patch"
    patch -d openvino -Np1 -i "${srcdir}/040-intel-openvino-cldnn-fix-build.patch"
    patch -d openvino -Np1 -i "${srcdir}/050-intel-openvino-mkldnn-fix-build.patch"
}

build() {
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    export IE_PATH_TO_DEPS="$srcdir"
    export OpenCV_DIR='/usr/lib/cmake/opencv4'
    
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
    
    rm -r "${pkgdir}/opt/intel/openvino/deployment_tools/inference_engine/external/gna/lib"
    cp -a "openvino/inference-engine/temp/gna_${_gnaver}/include"   "${pkgdir}/opt/intel/openvino/deployment_tools/inference_engine/external/gna"
    cp -a "openvino/inference-engine/temp/gna_${_gnaver}/linux/x64" "${pkgdir}/opt/intel/openvino/deployment_tools/inference_engine/external/gna/lib"
}
