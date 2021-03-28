# Maintainer : Daniel Bermond <dbermond@archlinux.org>

# select the desired cuda architecture(s)
# default is to build for all (takes a very long time to build)
_cuda_archs='5.2;5.3;6.0;6.1;6.2;7.0;7.0+PTX;7.2;7.2+PTX;7.5;7.5+PTX;8.0;8.0+PTX;8.6;8.6+PTX'

pkgbase=caffe2-git
pkgname=('caffe2-git' 'caffe2-cuda-git')
pkgver=0.8.2.r34802.g01b15570145
pkgrel=1
epoch=1
pkgdesc='A new lightweight, modular, and scalable deep learning framework'
arch=('x86_64')
url='https://caffe2.ai/'
license=('BSD')
depends=('google-glog' 'protobuf' 'openmp' 'python' 'python-numpy' 'python-protobuf'
         'python-typing_extensions' 'python-yaml' 'blas' 'lapack' 'gflags' 'numactl'
         'intel-mkl' 'opencv' 'libuv')
optdepends=('python-flask' 'graphviz' 'python-hypothesis' 'python-matplotlib'
            'python-pydot' 'python-nvd3' 'python-yaml' 'python-requests'
            'python-scikit-image' 'python-scipy' 'python-setuptools'
            'python-future' 'python-tornado' 'python-six' 'python-lmdb')
makedepends=('git' 'cmake' 'gtest' 'snappy' 'cuda' 'cudnn' 'nccl' 'pybind11' 'qt5-base')
conflicts=('python-pytorch')
options=('!emptydirs')
source=('git+https://github.com/pytorch/pytorch.git'
        'git+https://github.com/pybind/pybind11.git'
        'cub-nvlabs'::'git+https://github.com/NVlabs/cub.git'
        'git+https://github.com/eigenteam/eigen-git-mirror.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/google/benchmark.git'
        'protobuf-protocolbuffers'::'git+https://github.com/protocolbuffers/protobuf.git'
        'git+https://github.com/Yangqing/ios-cmake.git'
        'git+https://github.com/Maratyszcza/NNPACK.git'
        'git+https://github.com/facebookincubator/gloo.git'
        'git+https://github.com/Maratyszcza/pthreadpool.git'
        'git+https://github.com/Maratyszcza/FXdiv.git'
        'git+https://github.com/Maratyszcza/FP16.git'
        'git+https://github.com/Maratyszcza/psimd.git'
        'git+https://github.com/facebook/zstd.git'
        'cpuinfo-pytorch'::'git+https://github.com/pytorch/cpuinfo.git'
        'git+https://github.com/PeachPy/enum34.git'
        'git+https://github.com/Maratyszcza/PeachPy.git'
        'git+https://github.com/benjaminp/six.git'
        'git+https://github.com/onnx/onnx.git'
        'git+https://github.com/onnx/onnx-tensorrt.git'
        'git+https://github.com/shibatch/sleef.git'
        'git+https://github.com/intel/ideep.git'
        'git+https://github.com/NVIDIA/nccl.git'
        'git+https://github.com/google/gemmlowp.git'
        'git+https://github.com/pytorch/QNNPACK.git'
        'git+https://github.com/intel/ARM_NEON_2_x86_SSE.git'
        'git+https://github.com/pytorch/fbgemm.git'
        'git+https://github.com/houseroad/foxi.git'
        'git+https://github.com/01org/tbb.git'
        'git+https://github.com/facebookincubator/fbjni.git'
        'git+https://github.com/google/XNNPACK.git'
        'git+https://github.com/fmtlib/fmt.git'
        'git+https://github.com/pytorch/tensorpipe.git'
        'git+https://github.com/pytorch/kineto.git'
        'git+https://github.com/asmjit/asmjit.git'
        'git+https://github.com/01org/mkl-dnn.git'
        'git+https://github.com/emil-e/rapidcheck.git'
        'git+https://github.com/libuv/libuv.git'
        'git+https://github.com/google/libnop.git'
        '010-caffe2-fix-include-system-path.patch'
        '020-caffe2-use-system-libuv.patch'
        '030-caffe2-disable-non-x86_64.patch')
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
            'd926cdacdbddf2334ac8b49602d9e1b12afb01c63a7dd0fb303dbc5d987c0ead'
            '497225e56a88a2c2f65eac4d6240297e42abb298654ad843a70c3c5a10d7170c'
            '7385ac0742f00245c3bd7560e33648566a25b950964806c55b6c3eaee25981ac')

prepare() {
    # submodules which clone dir coincides with the submodule name
    local _submodule_list=('pybind11'
                           'googletest'
                           'benchmark'
                           'protobuf'
                           'ios-cmake'
                           'NNPACK'
                           'gloo'
                           'zstd'
                           'onnx'
                           'onnx-tensorrt'
                           'sleef'
                           'ideep'
                           'QNNPACK'
                           'fbgemm'
                           'foxi'
                           'tbb'
                           'XNNPACK'
                           'fmt'
                           'tensorpipe'
                           'kineto')
    
    git -C pytorch submodule init
    
    local _submodule
    for _submodule in "${_submodule_list[@]}"
    do
        git -C pytorch config --local "submodule.third_party/${_submodule}.url" "${srcdir}/${_submodule}"
    done
    
    # submodules which clone dir does not coincide with the submodule name
    git -C pytorch config --local submodule.third_party/cub.url "${srcdir}/cub-nvlabs"
    git -C pytorch config --local submodule.third_party/eigen.url "${srcdir}/eigen-git-mirror"
    git -C pytorch config --local submodule.third_party/protobuf.url "${srcdir}/protobuf-protocolbuffers"
    git -C pytorch config --local submodule.third_party/NNPACK_deps/pthreadpool.url "${srcdir}/pthreadpool"
    git -C pytorch config --local submodule.third_party/NNPACK_deps/FXdiv.url "${srcdir}/FXdiv"
    git -C pytorch config --local submodule.third_party/NNPACK_deps/FP16.url "${srcdir}/FP16"
    git -C pytorch config --local submodule.third_party/NNPACK_deps/psimd.url "${srcdir}/psimd"
    git -C pytorch config --local submodule.third_party/cpuinfo.url "${srcdir}/cpuinfo-pytorch"
    git -C pytorch config --local submodule.third_party/python-enum.url "${srcdir}/enum34"
    git -C pytorch config --local submodule.third_party/python-peachpy.url "${srcdir}/PeachPy"
    git -C pytorch config --local submodule.third_party/python-six.url "${srcdir}/six"
    git -C pytorch config --local submodule.third_party/neon2sse.url "${srcdir}/ARM_NEON_2_x86_SSE"
    git -C pytorch config --local submodule.third_party/nccl/nccl.url "${srcdir}/nccl"
    git -C pytorch config --local submodule.third_party/gemmlowp/gemmlowp.url "${srcdir}/gemmlowp"
    git -C pytorch config --local submodule.android/libs/fbjni.url "${srcdir}/fbjni"
    
    git -C pytorch submodule update
    
    # fbgemm submodules
    git -C pytorch/third_party/fbgemm submodule init
    git -C pytorch/third_party/fbgemm config --local submodule.third_party/asmjit.url "${srcdir}/asmjit"
    git -C pytorch/third_party/fbgemm config --local submodule.third_party/cpuinfo.url "${srcdir}/cpuinfo-pytorch"
    git -C pytorch/third_party/fbgemm config --local submodule.third_party/googletest.url "${srcdir}/googletest"
    git -C pytorch/third_party/fbgemm submodule update
    
    # ideep submodules
    git -C pytorch/third_party/ideep submodule init
    git -C pytorch/third_party/ideep config --local submodule.mkl-dnn.url "${srcdir}/mkl-dnn"
    git -C pytorch/third_party/ideep config --local submodule.tests/googletest.url "${srcdir}/googletest"
    git -C pytorch/third_party/ideep config --local submodule.tests/rapidcheck.url "${srcdir}/rapidcheck"
    git -C pytorch/third_party/ideep submodule update
    
    # tensorpipe submodules
    git -C pytorch/third_party/tensorpipe submodule init
    git -C pytorch/third_party/tensorpipe config --local submodule.third_party/pybind11.url "${srcdir}/pybind11"
    git -C pytorch/third_party/tensorpipe config --local submodule.third_party/libuv.url "${srcdir}/libuv"
    git -C pytorch/third_party/tensorpipe config --local submodule.third_party/googletest.url "${srcdir}/googletest"
    git -C pytorch/third_party/tensorpipe config --local submodule.third_party/libnop.url "${srcdir}/libnop"
    git -C pytorch/third_party/tensorpipe submodule update
    
    patch -d pytorch -Np1 -i "${srcdir}/010-caffe2-fix-include-system-path.patch"
    patch -d pytorch -Np1 -i "${srcdir}/020-caffe2-use-system-libuv.patch"
    patch -d pytorch -Np1 -i "${srcdir}/030-caffe2-disable-non-x86_64.patch"
}

pkgver() {
    printf '%s.r%s.g%s' "$(head -n1 pytorch/caffe2/VERSION_NUMBER)" \
                        "$(git -C pytorch rev-list --count HEAD)" \
                        "$(git -C pytorch rev-parse --short HEAD)"
}

build() {
    local _common_opts=('-DBUILD_BINARY:BOOL=ON'
                        '-DBUILD_CUSTOM_PROTOBUF:BOOL=OFF'
                        '-DBUILD_SHARED_LIBS:BOOL=ON'
                        '-DCMAKE_BUILD_TYPE:STRING=None'
                        '-DCMAKE_INSTALL_PREFIX:PATH=/usr'
                        '-DCMAKE_SKIP_INSTALL_RPATH:BOOL=YES'
                        '-DUSE_GFLAGS:BOOL=ON'
                        '-DUSE_GLOG:BOOL=ON'
                        '-DUSE_OPENCV:BOOL=ON'
                        '-Wno-dev')
    
    # caffe2-cuda
    cmake -B build-cuda -S pytorch \
        "${_common_opts[@]}" \
        -DCMAKE_CXX_COMPILER:FILEPATH='/opt/cuda/bin/g++' \
        -DCMAKE_C_COMPILER:FILEPATH='/opt/cuda/bin/gcc' \
        -DCUDA_HOST_COMPILER:FILEPATH='/opt/cuda/bin/gcc' \
        -DCUDA_NVCC_FLAGS:STRING='-Xfatbin -compress-all' \
        -DTORCH_CUDA_ARCH_LIST="$_cuda_archs" \
        -DNCCL_INCLUDE_DIR:PATH='/usr/include' \
        -DUSE_CUDA:BOOL='ON' \
        -DUSE_CUDNN:BOOL='ON' \
        -DUSE_METAL:BOOL='OFF' \
        -DUSE_NCCL:BOOL='ON' \
        -DUSE_SYSTEM_NCCL:BOOL='ON'
    
    ## fix: avoid a second compilation in package()
    sed -i 's/^preinstall:[[:space:]]all/preinstall:/' build-cuda/Makefile
    make -C build-cuda
    
    # caffe2 (cpu only, without cuda support)
    cmake -B build-cpu-only -S pytorch "${_common_opts[@]}" -DUSE_CUDA:BOOL='OFF' -DUSE_NCCL:BOOL='OFF'
    make -C build-cpu-only
}

_package_common() {
    make -C "$1" DESTDIR="$pkgdir" install
    
    # remove unneeded files
    rm "$pkgdir"/usr/include/*.h*
    local _dir
    local _file
    while read -r -d '' _dir
    do
        rm -r "$_dir"
    done < <(find "${pkgdir}/usr"/{include,share/doc} -mindepth 1 -maxdepth 1 -type d ! -name 'ATen*' ! -name 'caffe*' \
                 ! -name 'c10*' ! -name 'TH*' ! -name '*torch*' -print0)
    while read -r -d '' _dir
    do
        rm -r "$_dir"
    done < <(find "${pkgdir}/usr"/{lib,share}/cmake -mindepth 1 -maxdepth 1 -type d ! -name 'ATen*' ! -name 'Caffe*' \
                 ! -name 'Torch*' -print0)
    while read -r -d '' _file
    do
        rm "$_file"
    done < <(find -L "${pkgdir}/usr/lib" -mindepth 1 -maxdepth 1 -type f ! -name '*c10*.so*' ! -name '*caffe*' \
                 ! -name '*shm*' ! -name '*torch*.so*' -print0)
    while read -r -d '' _file
    do
        rm "$_file"
    done < <(find -L "${pkgdir}/usr/lib/pkgconfig" -mindepth 1 -maxdepth 1 -type f ! -name '*c10*' ! -name '*caffe*' \
                 ! -name '*shm*' ! -name '*torch*' -print0)
    
    # license
    install -D -m644 pytorch/{LICENSE,NOTICE} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_caffe2-cuda-git() {
    pkgdesc+=' (with cuda support, git version)'
    depends+=('cuda' 'cudnn' 'nccl')
    provides=('caffe2' 'caffe2-git' 'caffe2-cuda')
    conflicts+=('caffe2')
    
    _package_common 'build-cuda'
}

package_caffe2-git() {
    pkgdesc+=' (cpu only, git version)'
    provides=('caffe2' 'caffe2-cpu-git')
    conflicts+=('caffe2' 'caffe2-cpu-git')
    replaces=('caffe2-cpu-git')
    
    _package_common 'build-cpu-only'
}
