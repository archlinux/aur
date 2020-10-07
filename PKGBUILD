# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-openvino-git
pkgver=2020.2.r1348.g8062f20c1
pkgrel=1
pkgdesc='Toolkit for developing applications and solutions that emulate human vision using Intel hardware (git version)'
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
makedepends=('git' 'git-lfs' 'cmake' 'python' 'cython' 'opencv' 'aria2' 'wget')
provides=('intel-openvino')
conflicts=('intel-openvino')
options=('!emptydirs')
source=('git+https://github.com/openvinotoolkit/openvino.git'
        'git+https://github.com/opencv/ade.git'
        'git+https://github.com/openvinotoolkit/oneDNN.git'
        'googletest-openvinotoolkit'::'git+https://github.com/openvinotoolkit/googletest.git'
        'git+https://github.com/gflags/gflags.git'
        'intel-openvino.conf'
        'intel-openvino.sh'
        'setupvars.sh'
        '010-ade-disable-werror.patch'
        '020-intel-openvino-cldnn-disable-werror.patch'
        '030-intel-openvino-do-not-install-tbb.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'f485aa97d88d424dd3a223e0eddbbc382ec6c8d5094d51cbd3f0524b915e3d68'
            '49a1cdd2357ac3c657b28d72aea1294e4af46389e41ed0d55ccbd12bd995058d'
            '093199ae759e8755166b9737562438866123eda9b1afbbef2f7107b3cf827be5'
            '502fcbb3fcbb66aa5149ad2cc5f1fa297b51ed12c5c9396a16b5795a03860ed0'
            'b58aa9ec526cb6c528c58fc8b1a1b93b425999d1de29f0dd15a8b680c9eb8c77'
            'f7e6616ef15c6252dbad9f13b446ec36b675b29e5b93ab34f8b136d7218a4150')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    git -C openvino lfs install --local
    git -C openvino lfs pull "${source[0]/git+/}"
    
    git -C openvino submodule init
    git -C openvino config --local submodule.inference-engine/thirdparty/ade.url "${srcdir}/ade"
    git -C openvino config --local submodule.inference-engine/thirdparty/mkl-dnn.url "${srcdir}/oneDNN"
    git -C openvino config --local submodule.inference-engine/tests/ie_test_utils/common_test_utils/gtest.url "${srcdir}/googletest-openvinotoolkit"
    git -C openvino config --local submodule.inference-engine/samples/thirdparty/gflags.url "${srcdir}/gflags"
    git -C openvino submodule update
    
    patch -d openvino/inference-engine/thirdparty/ade -Np1 -i "${srcdir}/010-ade-disable-werror.patch"
    patch -d openvino -Np1 -i "${srcdir}/020-intel-openvino-cldnn-disable-werror.patch"
    patch -d openvino -Np1 -i "${srcdir}/030-intel-openvino-do-not-install-tbb.patch"
}

pkgver() {
    git -C openvino describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    local _ocvmaj
    local _pyver
    _ocvmaj="$(opencv_version | awk -F'.' '{ print $1 }')"
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    
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
    
    local _gnaver
    _gnaver="$(find openvino/inference-engine/temp -type d -name 'gna_*' | sed 's/^.*gna_//')"
    cp -a "openvino/inference-engine/temp/gna_${_gnaver}/include" "${pkgdir}/opt/intel/openvino/deployment_tools/inference_engine/external/gna"
}
