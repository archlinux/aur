# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=caffe2-git
pkgver=0.7.0.r528.g437897b6
pkgrel=1
pkgdesc='A new lightweight, modular, and scalable deep learning framework (git version, gpu enabled)'
arch=('x86_64')
url='http://caffe2.ai/'
license=('BSD')
depends=(
    # official repositories:
        # required:
            'google-glog' 'protobuf' 'python2' 'python2-numpy' 'python2-protobuf' 'cuda'
            'cudnn'
        # not required but enabled in build:
            'gflags' 'gtest' 'openmp' 'leveldb' 'lmdb' 'openmpi' 'snappy' 'zeromq'
            'hiredis'
        # python2:
            'python2-pydot' 'python2-flask' 'graphviz' 'python2-hypothesis'
            'python2-jupyter_core' 'python2-matplotlib' 'python2-yaml' 'python2-requests'
            'python2-scipy' 'python2-setuptools' 'python2-tornado' 'python2-pyzmq'
            'python2-gflags'
    # AUR:
        # not required but enabled in build:
            'nccl'
        # python2:
            'python2-scikit-image' 'python2-leveldb' 'python2-lmdb' 'python2-glog'
    # missing:
        # 'python2-nvd3'
)
makedepends=(
    # official repositories:
        'git' 'cmake' 'gcc5' 'ninja'
    # AUR:
        'confu-git' 'python-peachpy-git'
)
provides=('caffe2')
conflicts=('caffe' 'caffe-cpu' 'caffe-git' 'caffe-cpu-git'
           'caffe2' 'caffe2-cpu' 'caffe2-cpu-git')
options=('!emptydirs')
source=(
    # main source:
        "$pkgname"::'git+https://github.com/caffe2/caffe2.git'
        'external-nnpack-fix.patch'
    # git submodules:
        'submodule-pybind11'::'git+https://github.com/pybind/pybind11.git'
        'submodule-nccl'::'git+https://github.com/nvidia/nccl.git'
        'submodule-cnmem'::'git+https://github.com/nvidia/cnmem.git'
        'submodule-cub'::'git+https://github.com/NVlabs/cub.git'
        'submodule-eigen'::'git+https://github.com/RLovelett/eigen.git'
        'submodule-googletest'::'git+https://github.com/google/googletest.git'
        'submodule-nervanagpu'::'git+https://github.com/NervanaSystems/nervanagpu.git'
        'submodule-benchmark'::'git+https://github.com/google/benchmark.git'
        'submodule-protobuf'::'git+https://github.com/google/protobuf.git'
        'submodule-android-cmake'::'git+https://github.com/taka-no-me/android-cmake.git'
        'submodule-ios-cmake'::'git+https://github.com/Yangqing/ios-cmake.git'
        'submodule-NNPACK'::'git+https://github.com/Maratyszcza/NNPACK.git'
        'submodule-gloo'::'git+https://github.com/facebookincubator/gloo'
        'submodule-NNPACK_deps-pthreadpool'::'git+https://github.com/Maratyszcza/pthreadpool.git'
        'submodule-NNPACK_deps-FXdiv'::'git+https://github.com/Maratyszcza/FXdiv.git'
        'submodule-NNPACK_deps-FP16'::'git+https://github.com/Maratyszcza/FP16.git'
        'submodule-NNPACK_deps-psimd'::'git+https://github.com/Maratyszcza/psimd.git'
)
sha256sums=('SKIP'
            '1c94a1ecc0fe2a52c50c9d1a7bfca655d60c08d48995b27c73aa22b6c375da54'
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
)

prepare() {
    cd "$pkgname"
    local _submodule_list="pybind11 nccl cnmem cub eigen googletest nervanagpu benchmark \
                           protobuf android-cmake ios-cmake NNPACK gloo \
                           NNPACK_deps/pthreadpool NNPACK_deps/FXdiv NNPACK_deps/FP16 \
                           NNPACK_deps/psimd"
    git submodule init
    for _submodule in $_submodule_list
    do
        local _submodule_dir="submodule-$(printf "%s" "${_submodule}" | tr '/' '-')"
        git config --local "submodule.third_party/${_submodule}.url" "${srcdir}/${_submodule_dir}"
    done
    unset _submodule
    git submodule update
    
    # avoid compile errors with gloo if using '-march=native' in a cpu with AVX2
    # https://github.com/facebookincubator/gloo/issues/43
    cd third_party/gloo
    git checkout 21a5c8ea5e02edca03068790df3d7f7ba4e2d75b
    
    # avoid compile errors with nnpack if system library is found
    # https://github.com/caffe2/caffe2/pull/808
    cd "${srcdir}/${pkgname}"
    patch -Np1 -i "${srcdir}/external-nnpack-fix.patch"
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    mkdir -p build
    cd build
    
    cmake \
        -DBLAS:STRING=Eigen \
        \
        -DBUILD_BINARY:BOOL=ON \
        -DBUILD_PYTHON:BOOL=ON \
        -DBUILD_SHARED_LIBS:BOOL=ON \
        \
        -DBUILD_TEST:BOOL=OFF \
        \
        -DCAFFE2_CPU_FLAGS:BOOL=OFF \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DCMAKE_COLOR_MAKEFILE:BOOL=ON \
        -DCMAKE_CXX_COMPILER=/usr/bin/g++-5 \
        -DCMAKE_C_COMPILER=/usr/bin/gcc-5 \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH:BOOL=NO \
        -DCMAKE_SKIP_RPATH:BOOL=NO \
        -DCMAKE_VERBOSE_MAKEFILE:BOOL=FALSE \
        \
        -DCUDA_64_BIT_DEVICE_CODE:BOOL=ON \
        -DCUDA_ARCH_NAME:STRING=Auto \
        -DCUDA_ATTACH_VS_BUILD_RULE_TO_CUDA_FILE:BOOL=ON \
        -DCUDA_BUILD_CUBIN:BOOL=OFF \
        -DCUDA_BUILD_EMULATION:BOOL=OFF \
        -DCUDA_HOST_COMPILATION_CPP:BOOL=ON \
        -DCUDA_HOST_COMPILER:FILEPATH=/usr/bin/gcc-5 \
        -DCUDA_NVCC_EXECUTABLE:FILEPATH=/opt/cuda/bin/nvcc \
        -DCUDA_PROPAGATE_HOST_FLAGS:BOOL=ON \
        -DCUDA_SDK_ROOT_DIR:PATH=/opt/cuda \
        -DCUDA_SEPARABLE_COMPILATION:BOOL=OFF \
        -DCUDA_TOOLKIT_INCLUDE:PATH=/opt/cuda/include \
        -DCUDA_TOOLKIT_ROOT_DIR:PATH=/opt/cuda \
        -DCUDA_USE_STATIC_CUDA_RUNTIME:BOOL=OFF \
        -DCUDA_VERBOSE_BUILD:BOOL=OFF \
        -DCUDA_VERSION:STRING=8.0 \
        -DCUDNN_INCLUDE_DIR:PATH=/opt/cuda/include \
        -DCUDNN_ROOT_DIR:PATH=/opt/cuda \
        \
        -DGLOO_STATIC_OR_SHARED:STRING=STATIC \
        -DNCCL_INCLUDE_DIR:PATH=/opt/cuda/include \
        -DNCCL_LIBRARY:FILEPATH=/opt/cuda/lib64/libnccl.so \
        -DNCCL_ROOT_DIR:PATH=/opt/cuda \
        \
        -DOpenCV_DIR:PATH=/usr/share/OpenCV \
        \
        -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2.7 \
        -DPYTHON_INCLUDE_DIR:PATH=/usr/include/python2.7 \
        -DPYTHON_LIBRARY:FILEPATH=/usr/lib/libpython2.7.so \
        \
        -DUSE_CNMEM:BOOL=OFF \
        -DUSE_CUDA:BOOL=ON \
        -DUSE_GFLAGS:BOOL=ON \
        -DUSE_GLOG:BOOL=ON \
        -DUSE_GLOO:BOOL=ON \
        -DUSE_LEVELDB:BOOL=ON \
        -DUSE_LITE_PROTO:BOOL=OFF \
        -DUSE_LMDB:BOOL=ON \
        -DUSE_MPI:BOOL=ON \
        -DUSE_NCCL:BOOL=ON \
        -DUSE_NERVANA_GPU:BOOL=ON \
        -DUSE_NNPACK:BOOL=ON \
        -DUSE_OPENCV:BOOL=OFF \
        -DUSE_FFMPEG:BOOL=OFF \
        -DUSE_OPENMP:BOOL=ON \
        -DUSE_REDIS:BOOL=ON \
        -DUSE_ROCKSDB:BOOL=OFF \
        -DUSE_THREADS:BOOL=ON \
        -DUSE_ZMQ:BOOL=ON \
        \
        -Wno-dev \
        ..
        
    # NOTE:
    # The recommended approach of running make in build() and make install in
    # package() produces two compilations (being the second one unnecessary).
    # A workaround is to suppress make in build() and run only make install
    # in package().
    
    #make
}

package() {
    cd "${pkgname}/build"
    make DESTDIR="$pkgdir" install
    
    # directories creation
    mkdir -p "${pkgdir}/usr/lib/python2.7/site-packages"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # move/rename folders to the right location
    mv -f "${pkgdir}/usr/caffe"    "${pkgdir}/usr/lib/python2.7/site-packages"
    mv -f "${pkgdir}/usr/caffe2"   "${pkgdir}/usr/lib/python2.7/site-packages"
    
    # license
    cd "${srcdir}/${pkgname}"
    install -D -m644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 'PATENTS' "${pkgdir}/usr/share/licenses/${pkgname}/PATENTS"
}
