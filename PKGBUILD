# Maintainer : Thomas Ivesdal-Tronstad < lyse-net: thotro >

pkgname=caffe-opencl-git
_srcname=caffe
pkgver=1.0
pkgrel=2
pkgdesc="A deep learning framework made with expression, speed, and modularity in mind (Experimental, OpenCL)"
arch=('i686' 'x86_64')
url="http://caffe.berkeleyvision.org/"
license=('BSD')
depends=(
    # official repositories:
        'boost-libs' 'protobuf' 'google-glog' 'gflags' 'hdf5' 'opencv' 'leveldb'
        'lmdb' 'python' 'boost' 'cython' 'python-numpy' 'python-scipy'
        'python-matplotlib' 'ipython' 'python-h5py' 'python-networkx' 'python-nose'
        'python-pandas' 'python-dateutil' 'python-protobuf' 'python-gflags'
        'python-yaml' 'python-pillow' 'python-six' 'opencl-driver'
    # AUR:
        'openblas-lapack' 'python-leveldb' 'python-scikit-image' 'python-pydotplus' 'viennacl'
    # NOTE:
    # python-pydotplus (or python-pydot) is required by python executable draw_net.py
    # https://github.com/BVLC/caffe/blob/eeebdab16155d34ff8f5f42137da7df4d1c7eab0/python/caffe/draw.py#L7-L22
)
makedepends=('doxygen' 'texlive-core' 'cmake')
provides=('caffe')
conflicts=('caffe' 'caffe-git' 'caffe-cpu-git' 'caffe-dr-git' 'caffe-mnc-dr-git' 'caffe-cpu'
           'caffe2' 'caffe2-git' 'caffe2-cpu' 'caffe2-cpu-git')
source=("${_srcname}"::"git+https://github.com/BVLC/${_srcname}#branch=opencl"
        'dependencies.patch'
        'python_CMakeLists.patch'
	'src_caffe_CMakeLists.patch')
sha256sums=('SKIP'
            '7ddb59109d7df3889641eaa4769e6b9e82f96f623b200ecfd8ade7ecfe04f95f'
            'd2974a35b695cfa176da7c26c860d18941de5b85870c42cb104034fec400599c'
            'd1012a6248f10303b56aba04c5dead93988f5ab2e9488dc885f79be4d14b936c')

prepare() {
    cd "${_srcname}"

    # This patch makes cmake find libboost_python3 (it normally only looks for libboost_python_py3 etc.)
    patch cmake/Dependencies.cmake < ../dependencies.patch

    # Set install path of python stuff to the correct place
    patch python/CMakeLists.txt < ../python_CMakeLists.patch

    # Set install path of python stuff to the correct place
    patch src/caffe/CMakeLists.txt < ../src_caffe_CMakeLists.patch
    mkdir build
    cd build
    cmake -D BLAS=Open -D python_version=3 -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_PYTHON_INSTALL_PATH=lib/python3.6/site-packages ..
}

build() {
    cd "${_srcname}/build"
    make -j8 all
}

# uncomment this block if you want to run the checks/tests
#check() {
#    cd "${_srcname}/build"
#    msg2 "Building target 'test'..."
#    make runtest
#}

package() {
    cd "${_srcname}/build"
    make install

    # Copy license file
    install -m644 ../LICENSE ${pkgdir}/usr/share/Caffe
}
