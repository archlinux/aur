# Maintainer: Andrew Anderson <andrew.wja@gmail.com>
pkgname=intel-caffe-git
_srcname=intel-caffe
pkgver=1.1.6
pkgrel=16
pkgdesc="Intel® Distribution of Caffe"
arch=('x86_64')
url="https://github.com/intel/caffe"
license=('BSD')
depends=(
        'boost-libs' 'protobuf' 'google-glog' 'gflags' 'hdf5'
        'python' 'boost' 'cython' 'python-numpy' 'python-scipy'
        'python-matplotlib' 'ipython' 'python-networkx' 'python-nose'
        'python-pandas' 'python-dateutil' 'python-protobuf' 'python-gflags'
        'python-yaml' 'python-pillow' 'python-six' 'python-scikit-image'
        'openexr' 'opencv>=4.0.0' 'gtk3' 'openmp'
)
optdepends=('openblas: OpenBLAS for backend linear algebra ops',
            'cblas: Use CBLAS for backend linear algebra ops',
            'intel-mkl: Use Intel MKL for backend linear algebra ops'
)
makedepends=('cmake')
provides=('caffe')
conflicts=('caffe')
source=("${_srcname}"::"git+https://github.com/intel/caffe.git")
sha256sums=('SKIP')
options=( '!strip' '!emptydirs' 'staticlibs' )

prepare() {
    cd "${_srcname}"
    git checkout ${pkgver}
    echo 'rls-v0.19' > mkldnn.commit
    sed -i 's/git reset --hard/git checkout/' Makefile.mkldnn
    sed -i 's/https:\/\/github.com\/01org\/mkl-dnn.git/https:\/\/github.com\/oneapi-src\/oneDNN.git/g' Makefile.mkldnn
    sed -i 's/https:\/\/github.com\/intel\/mkl-dnn.git/https:\/\/github.com\/oneapi-src\/oneDNN.git/g' cmake/MKLDNN.cmake
    sed -i 's/                      GIT_TAG/                      UPDATE_COMMAND \/bin\/true\n                      GIT_TAG/' cmake/MKLDNN.cmake
    sed -i 's/ -Werror//' CMakeLists.txt
    sed -i 's/CV_BGR2RGB/cv::COLOR_BGR2RGB/g' src/caffe/layers/image_data_layer.cpp
    sed -i 's/CV_LOAD_IMAGE_COLOR/cv::IMREAD_COLOR/g' src/caffe/layers/window_data_layer.cpp
    sed -i 's/CV_LOAD_IMAGE_COLOR/cv::IMREAD_COLOR/g' src/caffe/test/test_io.cpp
    sed -i 's/CV_LOAD_IMAGE_GRAYSCALE/cv::IMREAD_GRAYSCALE/g' src/caffe/test/test_io.cpp
    sed -i 's/CV_LOAD_IMAGE_COLOR/cv::IMREAD_COLOR/g' src/caffe/util/io.cpp
    sed -i 's/CV_LOAD_IMAGE_GRAYSCALE/cv::IMREAD_GRAYSCALE/g' src/caffe/util/io.cpp
    cd -

    mkdir -p build
    cd build
    CMAKE_BUILD_TYPE="Release" \
    CMAKE_PARALLEL_LEVEL=`grep processor /proc/cpuinfo | wc -l` \
    cmake \
    -DCPU_ONLY=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_python=ON \
    -DBUILD_matlab=OFF \
    -DBUILD_docs=OFF \
    -DBUILD_python_layer=ON \
    -DUSE_OPENCV=ON \
    -DUSE_LEVELDB=OFF \
    -DUSE_LMDB=OFF \
    -DALLOW_LMDB_NOLOCK=OFF \
    -DUSE_OPENMP=ON \
    -D python_version=3 \
    -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr \
    ../"${_srcname}"
}

build() {
    cd build
    make -j`grep processor /proc/cpuinfo | wc -l` clean caffe caffeproto pycaffe python upgrade_net_proto_text upgrade_net_proto_binary
    cp ${srcdir}/${_srcname}/LICENSE .
}

package() {
    cd build
    make install
    install -m644 LICENSE ${pkgdir}/usr/share/Caffe
}
