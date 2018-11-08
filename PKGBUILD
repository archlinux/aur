# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=caffe-cuda-git
pkgver=1.0.r132.g99bd99795
pkgrel=5
pkgdesc='A deep learning framework made with expression, speed, and modularity in mind (with cuda, git version)'
arch=('x86_64')
url='https://caffe.berkeleyvision.org/'
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
    # https://github.com/BVLC/caffe/blob/99bd99795dcdf0b1d3086a8d67ab1782a8a08383/python/caffe/draw.py#L7-L22
)
makedepends=('git' 'gcc7' 'boost' 'doxygen' 'texlive-core')
provides=('caffe' 'caffe-cuda')
conflicts=('caffe')
source=("$pkgname"::'git+https://github.com/BVLC/caffe.git'
        'Makefile.config')
sha256sums=('SKIP'
            '40d725152bc78326ed230ab9598dc0aec90764cc82b66631ed6d2594ea7d7ae5')

prepare() {
    cp -af "${srcdir}/Makefile.config" "${srcdir}/${pkgname}"
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    
    make all pycaffe
    rm -rf doxygen
    make docs distribute
}

check() {
    cd "$pkgname"
    make test runtest
}

package() {
    cd "${pkgname}/distribute"
    
    local _pythonver
    _pythonver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    
    mkdir -p "$pkgdir"/usr/{bin,include,lib/python"$_pythonver"/site-packages,share/doc}
    
    # binaries
    install -m755 bin/* "${pkgdir}/usr/bin"
    
    # library
    cp -a lib/libcaffe.so* "${pkgdir}/usr/lib"
    chmod 755 "${pkgdir}/usr/lib"/libcaffe.so.*.*.*
    
    # headers
    cp -a include "${pkgdir}/usr"
    
    # python
    install -m755 python/*.py "${pkgdir}/usr/bin"
    cp -a python/caffe "${pkgdir}/usr/lib/python${_pythonver}/site-packages"
    
    # proto
    install -D -m644 proto/caffe.proto -t "${pkgdir}/usr/share/caffe"
    
    cd "${srcdir}/${pkgname}"
    
    # docs
    cp -a doxygen/html "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
