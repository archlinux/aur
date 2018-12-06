# Maintainer: Andrew Anderson <aanderso at t c d dot ie>
pkgname=caffe-opencl-slim-git
_srcname=caffe
pkgver=1.0
pkgrel=33
pkgdesc="A slimmed-down build of Caffe based on caffe-opencl-git"
arch=('x86_64')
url="http://caffe.berkeleyvision.org/"
license=('BSD')
depends=(
        'boost-libs' 'protobuf' 'google-glog' 'gflags' 'hdf5'
        'python' 'boost' 'cython' 'python-numpy' 'python-scipy'
        'python-matplotlib' 'ipython' 'python-networkx' 'python-nose'
        'python-pandas' 'python-dateutil' 'python-protobuf' 'python-gflags'
        'python-yaml' 'python-pillow' 'python-six' 'opencl-driver' 'ocl-icd' 'opencl-headers'
        'openblas-lapack' 'opencv>=4.0.0' 'viennacl'
)
makedepends=('cmake')
provides=('caffe')
conflicts=('caffe' 'caffe-git' 'caffe-cpu-git' 'caffe-dr-git' 'caffe-mnc-dr-git' 'caffe-cpu'
           'caffe2' 'caffe2-git' 'caffe2-cpu' 'caffe2-cpu-git' 'caffe-opencl-git')
source=("${_srcname}"::"git+https://github.com/andrew-wja/${_srcname}"
        'dependencies.patch')
sha256sums=('SKIP'
            '7ddb59109d7df3889641eaa4769e6b9e82f96f623b200ecfd8ade7ecfe04f95f')

prepare() {
    cd "${_srcname}"

    git checkout opencl

    # This patch makes cmake find libboost_python3 (it normally only looks for libboost_python_py3 etc.)
    patch cmake/Dependencies.cmake < ../dependencies.patch

    mkdir -p build
    cd build

    CMAKE_PARALLEL_LEVEL=`grep processor /proc/cpuinfo | wc -l` \
    cmake \
    -DCMAKE_CXX_FLAGS="-Os" \
    -DCPU_ONLY=OFF \
    -DUSE_INDEX_64=OFF \
    -DUSE_HALF=OFF \
    -DUSE_SINGLE=ON \
    -DUSE_DOUBLE=OFF \
    -DUSE_INT_QUANT_8=OFF \
    -DUSE_INT_QUANT_16=OFF \
    -DUSE_INT_QUANT_32=OFF \
    -DUSE_INT_QUANT_64=OFF \
    -DUSE_CUDA=OFF \
    -DUSE_OPENCL=ON \
    -DUSE_HSA=OFF \
    -DUSE_HIP=OFF \
    -DFORCE_COMPILE_CU_AS_CPP=OFF \
    -DDISABLE_DEVICE_HOST_UNIFIED_MEMORY=OFF \
    -DUSE_LIBDNN=OFF \
    -DUSE_CLBLAS=OFF \
    -DUSE_CLBLAST=OFF \
    -DUSE_ISAAC=OFF \
    -DUSE_CUDNN=OFF \
    -DUSE_NCCL=OFF \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_python=ON \
    -DBUILD_matlab=OFF \
    -DBUILD_docs=OFF \
    -DBUILD_python_layer=ON \
    -DUSE_OPENCV=ON \
    -DUSE_LEVELDB=OFF \
    -DUSE_LMDB=OFF \
    -DUSE_HDF5=ON \
    -DALLOW_LMDB_NOLOCK=OFF \
    -DUSE_OPENMP=ON \
    -DUSE_FFT=OFF \
    -DUSE_SQLITE=OFF \
    -DUSE_GEMMLOWP=OFF \
    -DUSE_NATIVE_MARCH=ON \
    -DUSE_ARM_CROSS_COMPILE=OFF \
    -DBLAS=Open \
    -D python_version=3 \
    -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..
}

build() {
    cd "${_srcname}/build"
    make -j`grep processor /proc/cpuinfo | wc -l` clean all pycaffe
}

package() {
    cd "${_srcname}/build"
    make install
    install -m644 ../LICENSE ${pkgdir}/usr/share/Caffe
}
