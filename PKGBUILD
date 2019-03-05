# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=caffe2-cuda-git
_srcname=pytorch
pkgver=0.8.2.r16592.g079093a662
pkgrel=1
pkgdesc='A new lightweight, modular, and scalable deep learning framework (with cuda, git version)'
arch=('x86_64')
url='https://caffe2.ai/'
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
            'rdma-core'
        # python:
            'python-nvd3' 'python-scikit-image' 'python-glog' 'python-leveldb'
            'python-lmdb'
)
makedepends=('git' 'cmake' 'gcc7')
provides=('caffe2' 'caffe2-git' 'caffe2-cuda')
conflicts=('caffe2' 'python-pytorch')
options=('!emptydirs')
source=(
    # main source:
        'git+https://github.com/pytorch/pytorch.git'
    # git submodules:
        'git+https://github.com/pybind/pybind11.git'
        'git+https://github.com/NVlabs/cub.git'
        'git+https://github.com/eigenteam/eigen-git-mirror.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/google/benchmark.git'
        'git+https://github.com/google/protobuf.git'
        'git+https://github.com/Yangqing/ios-cmake.git'
        'git+https://github.com/Maratyszcza/NNPACK.git'
        'git+https://github.com/facebookincubator/gloo.git'
        'git+https://github.com/Maratyszcza/pthreadpool.git'
        'git+https://github.com/Maratyszcza/FXdiv.git'
        'git+https://github.com/Maratyszcza/FP16.git'
        'git+https://github.com/Maratyszcza/psimd.git'
        'git+https://github.com/facebook/zstd.git'
        'git+https://github.com/Maratyszcza/cpuinfo.git'
        'git+https://github.com/PeachPy/enum34.git'
        'git+https://github.com/Maratyszcza/PeachPy.git'
        'git+https://github.com/benjaminp/six.git'
        'git+https://github.com/ARM-software/ComputeLibrary.git'
        'git+https://github.com/onnx/onnx.git'
        'git+https://github.com/bddppq/onnx-tensorrt.git'
        'git+https://github.com/zdevito/sleef.git'
        'git+https://github.com/intel/ideep.git'
        'git+https://github.com/NVIDIA/nccl.git'
        'git+https://github.com/google/gemmlowp.git'
        'git+https://github.com/pytorch/QNNPACK.git'
        'git+https://github.com/intel/ARM_NEON_2_x86_SSE.git'
        'git+https://github.com/pytorch/fbgemm.git'
        'git+https://github.com/houseroad/foxi.git'
    # others:
        'git+https://github.com/asmjit/asmjit.git'
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
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$_srcname"
    
    local _submodule
    local _submodule_list="pybind11 cub googletest benchmark protobuf ios-cmake \
                           NNPACK gloo zstd ComputeLibrary onnx onnx-tensorrt \
                           sleef ideep QNNPACK fbgemm foxi"
                           
    git submodule init
    
    # submodules which clone dir does not coincide with the submodule name
    git config --local "submodule.third_party/eigen.url" "${srcdir}/eigen-git-mirror"
    git config --local "submodule.third_party/NNPACK_deps/pthreadpool.url" "${srcdir}/pthreadpool"
    git config --local "submodule.third_party/NNPACK_deps/FXdiv.url" "${srcdir}/FXdiv"
    git config --local "submodule.third_party/NNPACK_deps/FP16.url" "${srcdir}/FP16"
    git config --local "submodule.third_party/NNPACK_deps/psimd.url" "${srcdir}/psimd"
    git config --local "submodule.third_party/python-enum.url" "${srcdir}/enum34"
    git config --local "submodule.third_party/python-peachpy.url" "${srcdir}/PeachPy"
    git config --local "submodule.third_party/python-six.url" "${srcdir}/six"
    git config --local "submodule.third_party/neon2sse.url" "${srcdir}/ARM_NEON_2_x86_SSE"
    git config --local "submodule.third_party/nccl/nccl.url" "${srcdir}/nccl"
    git config --local "submodule.third_party/gemmlowp/gemmlowp.url" "${srcdir}/gemmlowp"
    
    # submodules which clone dir coincide with the submodule name
    for _submodule in $_submodule_list
    do
        git config --local "submodule.third_party/${_submodule}.url" "${srcdir}/${_submodule}"
    done
    
    # special case (upstream uses third.party instead of third_party)
    git config --local 'submodule.third-party/cpuinfo.url' "${srcdir}/cpuinfo"
    
    git submodule update
}

pkgver() {
    cd "$_srcname"
    
    local _version
    local _revision
    local _shorthash
    
    _version="$(head -n1 caffe2/VERSION_NUMBER)"
    _revision="$( git rev-list  --count HEAD)"
    _shorthash="$(git rev-parse --short HEAD)"
    
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    cd "$_srcname"
    
    export TORCH_CUDA_ARCH_LIST='Auto'
    local _pythonver
    _pythonver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    
    mkdir -p build
    cd build
    
    # NOTE:
    # skip install rpath to remove unneeded insecure rpath
    
    cmake \
        -DBLAS:STRING='Eigen' \
        \
        -DBUILD_BINARY:BOOL='ON' \
        -DBUILD_DOCS:BOOL='OFF' \
        -DBUILD_PYTHON:BOOL='ON' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        \
        -DCMAKE_CXX_COMPILER='/usr/bin/g++-7' \
        -DCMAKE_C_COMPILER='/usr/bin/gcc-7' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        \
        -DCMAKE_SKIP_INSTALL_RPATH:BOOL='YES' \
        \
        -DCUDA_HOST_COMPILER:FILEPATH='/usr/bin/gcc-7' \
        -DCUDA_NVCC_EXECUTABLE:FILEPATH='/opt/cuda/bin/nvcc' \
        -DCUDA_SDK_ROOT_DIR:PATH='/opt/cuda' \
        -DCUDA_TOOLKIT_INCLUDE:PATH='/opt/cuda/include' \
        -DCUDA_TOOLKIT_ROOT_DIR:PATH='/opt/cuda' \
        -DCUDA_USE_STATIC_CUDA_RUNTIME:BOOL='OFF' \
        -DCUDNN_ROOT_DIR:PATH='/opt/cuda' \
        \
        -DGLOO_STATIC_OR_SHARED:STRING='STATIC' \
        \
        -DOpenCV_DIR:PATH='/usr/share/OpenCV' \
        -DASMJIT_SRC_DIR:STRING="${srcdir}/asmjit" \
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
        -DUSE_FBGEMM:BOOL='ON' \
        -DUSE_FFMPEG:BOOL='ON' \
        -DUSE_GFLAGS:BOOL='ON' \
        -DUSE_GLOG:BOOL='ON' \
        -DUSE_GLOO:BOOL='ON' \
        -DUSE_GLOO_IBVERBS:BOOL='ON' \
        -DUSE_IBVERBS:BOOL='ON' \
        -DUSE_LEVELDB:BOOL='ON' \
        -DUSE_LITE_PROTO:BOOL='OFF' \
        -DUSE_LMDB:BOOL='ON' \
        -DUSE_METAL:BOOL='OFF' \
        -DUSE_MKLDNN:BOOL='OFF' \
        -DUSE_MPI:BOOL='ON' \
        -DUSE_NCCL:BOOL='ON' \
        -DUSE_NNAPI:BOOL='ON' \
        -DUSE_NNPACK:BOOL='ON' \
        -DUSE_NUMA:BOOL='ON' \
        -DUSE_NUMPY:BOOL='ON' \
        -DUSE_NVRTC:BOOL='ON' \
        -DUSE_OBSERVERS:BOOL='ON' \
        -DUSE_OPENCL:BOOL='OFF' \
        -DUSE_OPENCV:BOOL='OFF' \
        -DUSE_OPENMP:BOOL='ON' \
        -DUSE_PROF:BOOL='OFF' \
        -DUSE_QNNPACK:BOOL='ON' \
        -DUSE_REDIS:BOOL='ON' \
        -DUSE_ROCKSDB:BOOL='OFF' \
        -DUSE_ROCM:BOOL='OFF' \
        -DUSE_SNPE:BOOL='OFF' \
        -DUSE_SYSTEM_EIGEN_INSTALL:BOOL='OFF' \
        -DUSE_SYSTEM_NCCL:BOOL='OFF' \
        -DUSE_TENSORRT:BOOL='OFF' \
        -DUSE_ZMQ:BOOL='ON' \
        -DUSE_ZSTD:BOOL='ON' \
        -DWITH_OPENMP:BOOL='ON' \
        \
        -Wno-dev \
        ..
        
    # fix: avoid a second compilation in package()
    sed -i 's/^preinstall:[[:space:]]all/preinstall:/' Makefile
    
    make
}

package() {
    cd "${_srcname}/build"
    
    make DESTDIR="$pkgdir" install
    
    # remove unneeded files
    local _entry
    local _exclude_dirs
    mapfile -t -d '' _exclude_dirs < <(find "${pkgdir}/usr/include" -mindepth 1 -maxdepth 1 -type d ! -name 'caffe*' -print0)
    rm    "$pkgdir"/usr/bin/{protoc,unzstd,zstd{cat,mt,}}
    rm    "$pkgdir"/usr/include/*.h
    rm    "$pkgdir"/usr/lib/*.a
    rm    "$pkgdir"/usr/lib/lib{foxi,onnxifi,zstd}*
    rm -r "$pkgdir"/usr/lib/cmake/protobuf
    rm    "$pkgdir"/usr/lib/pkgconfig/{protobuf-lite,protobuf}.pc
    rm    "$pkgdir"/usr/share/pkgconfig/libzstd.pc
    rm -r "$pkgdir"/usr/share/{ATen,cmake/{ATen,ONNX,Gloo}}
    rm    "$pkgdir"/usr/share/man/man1/{unzstd,zstd{cat,}}.1
    for _entry in "${_exclude_dirs[@]}"
    do
        rm -rf "$_entry"
    done
    
    # license
    cd "${srcdir}/${_srcname}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 NOTICE  -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
