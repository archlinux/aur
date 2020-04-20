# Maintainer: Andrew Anderson <andrew.wja@gmail.com>
pkgname=intel-caffe-git
_srcname=intel-caffe
pkgver=1.1.6
pkgrel=36
pkgdesc="Intel® Distribution of Caffe"
arch=('x86_64')
url="https://github.com/intel/caffe"
license=('BSD')
depends=(
        'boost-libs' 'protobuf' 'google-glog' 'gflags' 'hdf5'
        'boost' 'openexr' 'opencv>=4.0.0' 'gtk3' 'openmp'
)
optdepends=('openblas: Use OpenBLAS for backend linear algebra ops',
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
    sed -i 's/\${NCORE}//g' cmake/MKLDNN.cmake
    sed -i 's/                      GIT_TAG/                      UPDATE_COMMAND \/bin\/true\n                      GIT_TAG/' cmake/MKLDNN.cmake
    sed -i 's/ -Werror/ -lrt -lmpi/' CMakeLists.txt
    sed -i 's/set(BUILD_SHARED_LIBS on)//' CMakeLists.txt
    sed -i 's/set(BUILD_SHARED_LIBS off)//' CMakeLists.txt
    sed -i 's/set(LIBDIR lib64)/set(LIBDIR lib)/g' cmake/Dependencies.cmake

    sed -i 's/CV_LOAD_IMAGE_COLOR/cv::IMREAD_COLOR/g' src/caffe/layers/*.cpp src/caffe/test/*.cpp src/caffe/util/*.cpp
    sed -i 's/CV_LOAD_IMAGE_GRAYSCALE/cv::IMREAD_GRAYSCALE/g' src/caffe/test/*.cpp src/caffe/util/*.cpp
    sed -i 's/CV_IMWRITE_JPEG_QUALITY/cv::IMWRITE_JPEG_QUALITY/g' src/caffe/util/*.cpp
    sed -i 's/CV_CAP_PROP_FRAME_COUNT/cv::CAP_PROP_FRAME_COUNT/g' src/caffe/layers/*.cpp
    sed -i 's/CV_CAP_PROP_POS_FRAMES/cv::CAP_PROP_POS_FRAMES/g' src/caffe/layers/*.cpp
    sed -i 's/CV_FILLED/cv::FILLED/g' src/caffe/util/*.cpp
    sed -i 's/CV_FOURCC/cv::VideoWriter::fourcc/g' src/caffe/util/*.cpp
    sed -i 's/CV_BGR2RGB/cv::COLOR_BGR2RGB/g' src/caffe/layers/*.cpp
    sed -i 's/CV_BGR2GRAY/cv::COLOR_BGR2GRAY/g' src/caffe/util/*.cpp
    sed -i 's/CV_GRAY2BGR/cv::COLOR_GRAY2BGR/g' src/caffe/util/*.cpp
    sed -i 's/CV_BGR2YCrCb/cv::COLOR_BGR2YCrCb/g' src/caffe/util/*.cpp
    sed -i 's/CV_YCrCb2BGR/cv::COLOR_YCrCb2BGR/g' src/caffe/util/*.cpp
    sed -i 's/CV_BGR2HSV/cv::COLOR_BGR2HSV/g' src/caffe/util/*.cpp
    sed -i 's/CV_BGR2Lab/cv::COLOR_BGR2Lab/g' src/caffe/util/*.cpp
    sed -i 's/CV_HSV2BGR/cv::COLOR_HSV2BGR/g' src/caffe/util/*.cpp
    sed -i 's/CV_THRESH_BINARY_INV/cv::THRESH_BINARY_INV/g' src/caffe/util/*.cpp
    sed -i 's/CV_THRESH_OTSU/cv::THRESH_OTSU/g' src/caffe/util/*.cpp

    cd -

    mkdir -p build
    cd build
    CMAKE_BUILD_TYPE="Release" \
    cmake \
    -DCPU_ONLY=ON \
    -DUSE_OPENCV=ON \
    -DUSE_OPENMP=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_python=OFF \
    -DBUILD_matlab=OFF \
    -DBUILD_docs=OFF \
    -DBUILD_python_layer=OFF \
    -DUSE_LEVELDB=OFF \
    -DUSE_LMDB=OFF \
    -DALLOW_LMDB_NOLOCK=OFF \
    -D python_version=3 \
    -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr \
    ../"${_srcname}"
}

build() {
    cd build
    make -j $((($(nproc) / 2) + 1)) caffeproto caffe
    cp ${srcdir}/${_srcname}/LICENSE .
    cp ${srcdir}/${_srcname}/external/mkldnn/install/lib*/lib*.so* lib/
    cp ${srcdir}/${_srcname}/external/mlsl/*/*/lib*/lib*.so* lib/
    cp ${srcdir}/${_srcname}/external/mkl/*/lib*/lib*.so* lib/
}

package() {
    cd build
    make install
    install -m644 LICENSE ${pkgdir}/usr/share/Caffe
    cp lib/lib*.so ${pkgdir}/usr/lib/
}
