# Maintainer: Andrew Anderson <aanderso at t c d dot ie>
pkgname=trinnity-caffe-git
_srcname=trinnity-caffe
pkgver=1.0
pkgrel=23
pkgdesc="Caffe 1.0 with triNNity extensions"
arch=('x86_64')
url="https://bitbucket.org/STG-TCD/trinnity-caffe"
license=('BSD')
depends=(
        'boost-libs' 'protobuf' 'google-glog' 'gflags' 'hdf5'
        'python' 'boost' 'cython' 'python-numpy' 'python-scipy'
        'python-matplotlib' 'ipython' 'python-networkx' 'python-nose'
        'python-pandas' 'python-dateutil' 'python-protobuf' 'python-gflags'
        'python-yaml' 'python-pillow' 'python-six' 'python-scikit-image'
        'opencv>=4.0.0' 'gtk3' 'openmp'
)
optdepends=('openblas: OpenBLAS for backend linear algebra ops',
            'cblas: Use CBLAS for  backend linear algebra ops'
)
makedepends=('cmake')
provides=('caffe')
conflicts=('trinnity-caffe-cuda-git' 'trinnity-caffe-cudnn-git')
source=("${_srcname}"::"git+https://bitbucket.org/STG-TCD/trinnity-caffe.git")
sha256sums=('SKIP')

prepare() {
    cd "${_srcname}"
    git checkout master
    cd -

    mkdir -p build
    cd build
    CMAKE_BUILD_TYPE="Release" \
    CMAKE_PARALLEL_LEVEL=`grep processor /proc/cpuinfo | wc -l` \
    cmake \
    -DCPU_ONLY=ON \
    -DUSE_NCCL=OFF \
    -DBUILD_tools=ON \
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
    -DBLAS=CBLAS \
    -D python_version=3 \
    -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ../"${_srcname}"
}

build() {
    cd build
    make -j`grep processor /proc/cpuinfo | wc -l` clean caffe caffeproto pycaffe python
    cp ${srcdir}/${_srcname}/LICENSE .
}

package() {
    cd build
    make install
    install -m644 LICENSE ${pkgdir}/usr/share/Caffe
}
