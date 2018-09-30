# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=caffe2-cuda-git
pkgver=0.8.2.r13650.g93ecf4d72a
pkgrel=1
pkgdesc='A new lightweight, modular, and scalable deep learning framework (with cuda, git version)'
arch=('x86_64')
url='http://caffe2.ai/'
license=('BSD')
depends=(
    # official repositories:
        # required:
            'google-glog' 'protobuf' 'lapack' 'python' 'python-numpy' 'python-protobuf'
            'cuda' 'cudnn'
        # not required but enabled in build:
            'gflags' 'gtest' 'openmp' 'leveldb' 'lmdb' 'numactl' 'openmpi' 'snappy'
            'zeromq' 'hiredis' 'ffmpeg'
        # python:
            'python-flask' 'python-future' 'graphviz' 'python-hypothesis'
            'python-jupyter_core' 'python-matplotlib' 'python-pydot' 'python-yaml'
            'python-requests' 'python-scipy' 'python-setuptools' 'python-six'
            'python-tornado' 'python-gflags' 'python-pyzmq'
    # AUR:
        # not required but enabled in build:
            'libibverbs'
        # python:
            'python-nvd3' 'python-scikit-image' 'python-glog' 'python-leveldb'
            'python-lmdb'
)
makedepends=('git' 'cmake' 'gcc7')
provides=('caffe2' 'caffe2-git' 'caffe2-cuda')
conflicts=('caffe2' 'caffe2-git' 'caffe2-cuda' 'caffe2-cpu' 'caffe2-cpu-git')
options=('!emptydirs')
source=(
    # main source:
        'pytorch-git'::'git+https://github.com/pytorch/pytorch.git'
    # git submodules:
        'caffe2-submodule-catch'::'git+https://github.com/catchorg/Catch2.git'
        'caffe2-submodule-pybind11'::'git+https://github.com/pybind/pybind11.git'
        'caffe2-submodule-cub'::'git+https://github.com/NVlabs/cub.git'
        'caffe2-submodule-eigen'::'git+https://github.com/eigenteam/eigen-git-mirror.git'
        'caffe2-submodule-googletest'::'git+https://github.com/google/googletest.git'
        'caffe2-submodule-nervanagpu'::'git+https://github.com/NervanaSystems/nervanagpu.git'
        'caffe2-submodule-benchmark'::'git+https://github.com/google/benchmark.git'
        'caffe2-submodule-protobuf'::'git+https://github.com/google/protobuf.git'
        'caffe2-submodule-ios-cmake'::'git+https://github.com/Yangqing/ios-cmake.git'
        'caffe2-submodule-NNPACK'::'git+https://github.com/Maratyszcza/NNPACK.git'
        'caffe2-submodule-gloo'::'git+https://github.com/facebookincubator/gloo'
        'caffe2-submodule-NNPACK_deps-pthreadpool'::'git+https://github.com/Maratyszcza/pthreadpool.git'
        'caffe2-submodule-NNPACK_deps-FXdiv'::'git+https://github.com/Maratyszcza/FXdiv.git'
        'caffe2-submodule-NNPACK_deps-FP16'::'git+https://github.com/Maratyszcza/FP16.git'
        'caffe2-submodule-NNPACK_deps-psimd'::'git+https://github.com/Maratyszcza/psimd.git'
        'caffe2-submodule-zstd'::'git+https://github.com/facebook/zstd.git'
        'caffe2-submodule-cpuinfo'::'git+https://github.com/Maratyszcza/cpuinfo.git'
        'caffe2-submodule-python-enum'::'git+https://github.com/PeachPy/enum34.git'
        'caffe2-submodule-python-peachpy'::'git+https://github.com/Maratyszcza/PeachPy.git'
        'caffe2-submodule-python-six'::'git+https://github.com/benjaminp/six.git'
        'caffe2-submodule-ComputeLibrary'::'git+https://github.com/ARM-software/ComputeLibrary.git'
        'caffe2-submodule-onnx'::'git+https://github.com/onnx/onnx.git'
        'caffe2-submodule-cereal'::'git+https://github.com/USCiLab/cereal'
        'caffe2-submodule-onnx-tensorrt'::'git+https://github.com/onnx/onnx-tensorrt'
        'caffe2-submodule-sleef'::'git+https://github.com/shibatch/sleef'
        'caffe2-submodule-ideep'::'git+https://github.com/intel/ideep'
)
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
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd pytorch-git
    
    local _submodule
    local _submodule_dir
    
    local _submodule_list="catch pybind11 cub eigen googletest nervanagpu benchmark \
                           protobuf ios-cmake NNPACK gloo NNPACK_deps/pthreadpool \
                           NNPACK_deps/FXdiv NNPACK_deps/FP16 NNPACK_deps/psimd zstd \
                           python-enum python-peachpy python-six ComputeLibrary onnx
                           cereal onnx-tensorrt sleef ideep"
                           
    git submodule init
    
    git config --local 'submodule.third-party/cpuinfo.url' "${srcdir}/caffe2-submodule-cpuinfo"
    
    for _submodule in $_submodule_list
    do
        _submodule_dir="caffe2-submodule-${_submodule/\//-}"
        git config --local "submodule.third_party/${_submodule}.url" "${srcdir}/${_submodule_dir}"
    done
    
    git submodule update
}

pkgver() {
    cd pytorch-git
    
    local _version
    local _revision
    local _shorthash
    
    _version="$(head -n1 caffe2/VERSION_NUMBER)"
    _revision="$( git rev-list  --count HEAD)"
    _shorthash="$(git rev-parse --short HEAD)"
    
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    cd pytorch-git
    
    export TORCH_CUDA_ARCH_LIST='Auto'
    local _pythonver
    _pythonver="$(python --version | awk '{ print $2 }' | grep -o '^[0-9]*\.[0-9]*')"
    
    mkdir -p build
    cd build
    
    cmake \
        -DBLAS:STRING='Eigen' \
        \
        -DBUILD_BINARY:BOOL='ON' \
        -DBUILD_DOCS:BOOL='OFF' \
        -DBUILD_PYTHON:BOOL='ON' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        \
        -DBUILD_TEST:BOOL='OFF' \
        \
        -DCMAKE_CXX_COMPILER='/usr/bin/g++-7' \
        -DCMAKE_C_COMPILER='/usr/bin/gcc-7' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        \
        -DCUDA_HOST_COMPILER:FILEPATH='/usr/bin/gcc-7' \
        -DCUDA_NVCC_EXECUTABLE:FILEPATH='/opt/cuda/bin/nvcc' \
        -DCUDA_SDK_ROOT_DIR:PATH='/opt/cuda' \
        -DCUDA_TOOLKIT_INCLUDE:PATH='/opt/cuda/include' \
        -DCUDA_TOOLKIT_ROOT_DIR:PATH='/opt/cuda' \
        -DCUDA_USE_STATIC_CUDA_RUNTIME:BOOL='OFF' \
        -DCUDNN_INCLUDE_DIR:PATH='/opt/cuda/include' \
        -DCUDNN_LIBRARY:FILEPATH='/opt/cuda/lib64/libcudnn.so' \
        -DCUDNN_ROOT_DIR:PATH='/opt/cuda' \
        \
        -DGLOO_STATIC_OR_SHARED:STRING='STATIC' \
        \
        -DOpenCV_DIR:PATH='/usr/share/OpenCV' \
        \
        -DPYTHON_EXECUTABLE:FILEPATH="/usr/bin/python${_pythonver}" \
        -DPYTHON_INCLUDE_DIR:PATH="/usr/include/python${_pythonver}m" \
        -DPYTHON_LIBRARY:FILEPATH="/usr/lib/libpython${_pythonver}m.so" \
        \
        -DUSE_ACL:BOOL='OFF' \
        -DUSE_ASAN:BOOL='OFF' \
        -DUSE_CUDA:BOOL='ON' \
        -DUSE_CUDNN:BOOL='ON' \
        -DUSE_DISTRIBUTED:BOOL='ON' \
        -DUSE_FFMPEG:BOOL='ON' \
        -DUSE_GFLAGS:BOOL='ON' \
        -DUSE_GLOG:BOOL='ON' \
        -DUSE_GLOO:BOOL='ON' \
        -DUSE_GLOO_IBVERBS:BOOL='ON' \
        -DUSE_IBVERBS:BOOL='ON' \
        -DUSE_IDEEP:BOOL='ON' \
        -DUSE_LEVELDB:BOOL='ON' \
        -DUSE_LITE_PROTO:BOOL='OFF' \
        -DUSE_LMDB:BOOL='ON' \
        -DUSE_METAL:BOOL='OFF' \
        -DUSE_MKLDNN:BOOL='OFF' \
        -DUSE_MKLML:BOOL='OFF' \
        -DUSE_MOBILE_OPENGL:BOOL='OFF' \
        -DUSE_MPI:BOOL='ON' \
        -DUSE_NCCL:BOOL='ON' \
        -DUSE_NERVANA_GPU:BOOL='OFF' \
        -DUSE_NNAPI:BOOL='OFF' \
        -DUSE_NNPACK:BOOL='ON' \
        -DUSE_NUMA:BOOL='ON' \
        -DUSE_NVRTC:BOOL='ON' \
        -DUSE_OBSERVERS:BOOL='ON' \
        -DUSE_OPENCL:BOOL='OFF' \
        -DUSE_OPENCV:BOOL='OFF' \
        -DUSE_OPENMP:BOOL='ON' \
        -DUSE_PROF:BOOL='OFF' \
        -DUSE_REDIS:BOOL='ON' \
        -DUSE_ROCKSDB:BOOL='OFF' \
        -DUSE_ROCM:BOOL='OFF' \
        -DUSE_SNPE:BOOL='OFF' \
        -DUSE_SYSTEM_EIGEN_INSTALL:BOOL='OFF' \
        -DUSE_SYSTEM_NCCL:BOOL='OFF' \
        -DUSE_TENSORRT:BOOL='OFF' \
        -DUSE_ZMQ:BOOL='ON' \
        -DUSE_ZSTD:BOOL='ON' \
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
    cd pytorch-git/build
    
    make DESTDIR="$pkgdir" install
    
    # remove unneeded files
    local _entry
    local _exclude_dirs
    local _exclude_libs
    _exclude_dirs=($(find "${pkgdir}/usr/include" -mindepth 1 -maxdepth 1 -type d ! -name 'caffe*'))
    _exclude_libs=($(find -L "${pkgdir}/usr/lib" -maxdepth 1 -type f ! -name 'libcaffe*'))
    rm -f  "$pkgdir"/usr/bin/{protoc,unzstd,zstd{cat,mt,}}
    rm -f  "$pkgdir"/usr/include/{*.h,*.py}
    rm -rf "$pkgdir"/usr/lib/cmake/protobuf
    rm -f  "$pkgdir"/usr/lib/pkgconfig/{protobuf-lite,protobuf}.pc
    rm -rf "$pkgdir"/usr/share/pkgconfig
    rm -rf "$pkgdir"/usr/share/{ATen,cmake/{ATen,ONNX}}
    rm -f  "$pkgdir"/usr/share/man/man1/{unzstd,zstd{cat,}}.1
    for _entry in ${_exclude_dirs[@]} ${_exclude_libs[@]}
    do
        rm -rf "$_entry"
    done
    
    # license
    cd "${srcdir}/pytorch-git"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 NOTICE  -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
