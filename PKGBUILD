# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=caffe-cuda-git
pkgver=1.0.r136.g9b8915401
pkgrel=1
pkgdesc='A deep learning framework made with expression, speed, and modularity in mind (with cuda support, git version)'
arch=('x86_64')
url='https://caffe.berkeleyvision.org/'
license=('BSD')
depends=('openblas' 'lapack' 'boost-libs' 'protobuf' 'google-glog' 'gflags'
         'hdf5' 'opencv' 'leveldb' 'lmdb' 'python' 'python-numpy' 'python-pandas'
         'cuda' 'nccl')
optdepends=(
    # official repositories:
        'cython' 'python-scipy' 'python-matplotlib' 'ipython' 'python-h5py'
        'python-networkx' 'python-nose' 'python-dateutil' 'python-protobuf'
        'python-gflags' 'python-yaml' 'python-pillow' 'python-six'
    # AUR:
        'python-leveldb' 'python-scikit-image' 'python-pydotplus'
    # NOTE:
    # python-pydotplus (or python-pydot) is required by python executable 'draw_net.py'
    # https://github.com/BVLC/caffe/blob/9b891540183ddc834a02b2bd81b31afae71b2153/python/caffe/draw.py#L7-L22
)
makedepends=('git' 'boost' 'doxygen' 'texlive-core' 'texlive-latexextra' 'ghostscript')
provides=('caffe' 'caffe-cuda')
conflicts=('caffe')
source=('git+https://github.com/BVLC/caffe.git'
        'Makefile.config'
        'caffe-opencv4-fix.patch'::'https://github.com/BVLC/caffe/pull/6625/commits/7f503bd9a19758a173064e299ab9d4cac65ed60f.patch')
sha256sums=('SKIP'
            'fa15c69970a6006512319944dc171e92b42b3eb0ea8d0e9e1fb9cf0e4833b04c'
            '2072c8ca1393b53ef280a15c43af940cc9bf1419ae32b3d8a6541b10b8cb50e9')

prepare() {
    cp -af Makefile.config caffe
    patch -d caffe -Np1 -i "${srcdir}/caffe-opencv4-fix.patch"
}

pkgver() {
    git -C caffe describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    make -C caffe all pycaffe test
    rm -rf  caffe/doxygen
    make -C caffe docs distribute
}

check() {
    make -C caffe runtest
}

package() {
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    
    mkdir -p "$pkgdir"/usr/{bin,include,lib/python"$_pyver"/site-packages,share/doc}
    
    # binaries
    install -m755 caffe/distribute/bin/* "${pkgdir}/usr/bin"
    
    # library
    cp -a caffe/distribute/lib/libcaffe.so* "${pkgdir}/usr/lib"
    chmod 755 "${pkgdir}/usr/lib"/libcaffe.so.*.*.*
    
    # headers
    cp -a caffe/distribute/include "${pkgdir}/usr"
    
    # python
    install -m755 caffe/distribute/python/*.py "${pkgdir}/usr/bin"
    cp -a caffe/distribute/python/caffe "${pkgdir}/usr/lib/python${_pyver}/site-packages"
    
    # proto
    install -D -m644 caffe/distribute/proto/caffe.proto -t "${pkgdir}/usr/share/caffe"
    
    # docs
    cp -a caffe/doxygen/html "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    install -D -m644 caffe/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
