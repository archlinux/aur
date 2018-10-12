# Maintainer: Andrew Anderson <aanderso at t c d dot ie>
pkgname=caffe-opencl-slim-git
_srcname=caffe
pkgver=1.0
pkgrel=3
pkgdesc="A slimmed-down build of Caffe based on caffe-opencl-git"
arch=('x86_64')
url="http://caffe.berkeleyvision.org/"
license=('BSD')
depends=(
        'boost-libs' 'protobuf' 'google-glog' 'gflags'
        'python' 'boost' 'cython' 'python-numpy' 'python-scipy'
        'python-matplotlib' 'ipython' 'python-networkx' 'python-nose'
        'python-pandas' 'python-dateutil' 'python-protobuf' 'python-gflags'
        'python-yaml' 'python-pillow' 'python-six' 'opencl-driver'
        'openblas-lapack' 'python-scikit-image' 'viennacl'
)
makedepends=('cmake')
provides=('caffe')
conflicts=('caffe' 'caffe-git' 'caffe-cpu-git' 'caffe-dr-git' 'caffe-mnc-dr-git' 'caffe-cpu'
           'caffe2' 'caffe2-git' 'caffe2-cpu' 'caffe2-cpu-git' 'caffe-opencl-git')
source=("${_srcname}"::"git+https://github.com/BVLC/${_srcname}#branch=opencl"
        'dependencies.patch')
sha256sums=('SKIP'
            '7ddb59109d7df3889641eaa4769e6b9e82f96f623b200ecfd8ade7ecfe04f95f')

prepare() {
    cd "${_srcname}"

    # This patch makes cmake find libboost_python3 (it normally only looks for libboost_python_py3 etc.)
    patch cmake/Dependencies.cmake < ../dependencies.patch

    mkdir -p build
    cd build
    CMAKE_PARALLEL_LEVEL=`grep processor /proc/cpuinfo | wc -l` cmake -DBUILD_docs=OFF -DUSE_LIBDNN=OFF -DUSE_CUDNN=OFF -DUSE_OPENCV=OFF -DUSE_LEVELDB=OFF -DUSE_LMDB=OFF -DUSE_HDF5=OFF -DBLAS=Open -D python_version=3 -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr -DCMAKE_INSTALL_LIBDIR=lib ..
}

build() {
    cd "${_srcname}/build"
    make -j`grep processor /proc/cpuinfo | wc -l` clean all
}

package() {
    cd "${_srcname}/build"
    make install
    install -m644 ../LICENSE ${pkgdir}/usr/share/Caffe
}
