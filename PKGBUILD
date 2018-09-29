# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=caffe-cuda
_srcname=caffe
pkgver=1.0
pkgrel=3
pkgdesc='A deep learning framework made with expression, speed, and modularity in mind (with cuda)'
arch=('x86_64')
url='http://caffe.berkeleyvision.org/'
license=('BSD')
depends=(
    # official repositories:
        'openblas' 'lapack' 'boost-libs' 'protobuf' 'google-glog' 'gflags'
        'hdf5' 'opencv' 'leveldb' 'lmdb' 'cuda' 'cudnn' 'nccl' 'python'
        'cython' 'python-numpy' 'python-scipy' 'python-matplotlib' 'ipython'
        'python-h5py' 'python-networkx' 'python-nose' 'python-pandas'
        'python-dateutil' 'python-protobuf' 'python-gflags' 'python-yaml'
        'python-pillow' 'python-six'
    # AUR:
        'python-leveldb' 'python-scikit-image' 'python-pydotplus'
    # NOTE:
    # python-pydotplus (or python-pydot) is required by python executable 'draw_net.py'
    # https://github.com/BVLC/caffe/blob/1.0/python/caffe/draw.py#L7-L22
)
makedepends=('gcc7' 'boost' 'doxygen' 'texlive-core')
provides=('caffe')
conflicts=('caffe' 'caffe-git' 'caffe-cuda-git' 'caffe-cpu' 'caffe-cpu-git'
           'caffe2' 'caffe2-cuda')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/BVLC/caffe/archive/${pkgver}.tar.gz"
        'Makefile.config')
sha256sums=('71d3c9eb8a183150f965a465824d01fe82826c22505f7aa314f700ace03fa77f'
            'c61207ffea4ade927ce66a980f44732c1c2f9b82c500d51e687f5bcf773a4465')

prepare() {
    cd "${_srcname}-${pkgver}"
    
    local _pythonver
    local _pythonmaj
    local _opencvmaj
    
    _pythonver="$(python --version | awk '{ print $2 }' | grep -o '^[0-9]*\.[0-9]*')"
    _pythonmaj="$(python --version | awk '{ print $2 }' | awk -F'.' '{ print $1 }')"
    _opencvmaj="$(opencv_version | awk -F'.' '{ print $1 }')"
    
    # copy configuration options
    cp -af "${srcdir}/Makefile.config" .
    
    # make sure to use the correct versions of python and opencv
    
    if ! grep -q "python${_pythonver}" Makefile.config
    then
        sed -i "s/python[0-9]*\.[0-9]*/python${_pythonver}/" Makefile.config
    fi
    
    if ! grep -q "boost_python${_pythonmaj}" Makefile.config
    then
        sed -i "/boost_python[0-9]/s/[0-9]/${_pythonmaj}/" Makefile.config
    fi
    
    if ! grep -q "OPENCV_VERSION[[:space:]]:=[[:space:]]${_opencvmaj}" Makefile.config
    then
        sed -i "/OPENCV_VERSION/s/[0-9]*$/${_opencvmaj}/" Makefile.config
    fi
}

build() {
    cd "${_srcname}-${pkgver}"
    
    msg2 "Building target 'all'..."
    make all
    
    msg2 "Building target 'pycaffe'..."
    make pycaffe
    
    msg2 "Building target 'docs'..."
    rm -rf doxygen
    make docs
    
    msg2 "Building target 'distribute'..."
    make distribute
}

# uncomment this block if you want to run the checks/tests
#check() {
#    cd "${_srcname}-${pkgver}"
#    msg2 "Building target 'test'..."
#    make test
#    msg2 "Making target 'runtest'..."
#    make runtest
#}

package() {
    local _pythonver
    _pythonver="$(python --version | awk '{ print $2 }' | grep -o '^[0-9]*\.[0-9]*')"
    
    mkdir -p "$pkgdir"/usr/{bin,include,lib/python"$_pythonver"/site-packages,share/doc}
    
    cd "${_srcname}-${pkgver}/distribute"
    
    # binaries
    install -m755 bin/* "${pkgdir}/usr/bin"
    
    # library
    cp -af lib/libcaffe.so* "${pkgdir}/usr/lib"
    chmod 755 "${pkgdir}/usr/lib"/libcaffe.so.*.*.*
    
    # headers
    cp -af include "${pkgdir}/usr"
    
    # python
    install -m755 python/*.py "${pkgdir}/usr/bin"
    cp -af python/caffe "${pkgdir}/usr/lib/python${_pythonver}/site-packages"
    
    # proto
    install -D -m644 proto/caffe.proto -t "${pkgdir}/usr/share/caffe"
    
    cd "${srcdir}/${_srcname}-${pkgver}"
    
    # docs
    cp -af doxygen/html "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
