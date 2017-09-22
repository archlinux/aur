# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=caffe-cpu
_srcname=caffe
pkgver=1.0
pkgrel=4
pkgdesc="A deep learning framework made with expression, speed, and modularity in mind (cpu only)"
arch=('i686' 'x86_64')
url="http://caffe.berkeleyvision.org/"
license=('BSD')
depends=(
    # official repositories:
        'boost-libs' 'protobuf' 'google-glog' 'gflags' 'hdf5' 'opencv' 'leveldb'
        'lmdb' 'python' 'boost' 'cython' 'python-numpy' 'python-scipy'
        'python-matplotlib' 'ipython' 'python-h5py' 'python-networkx' 'python-nose'
        'python-pandas' 'python-dateutil' 'python-protobuf' 'python-gflags'
        'python-yaml' 'python-pillow' 'python-six'
    # AUR:
        'openblas-lapack' 'python-leveldb' 'python-scikit-image' 'python-pydotplus'
    # NOTE:
    # python-pydotplus (or python-pydot) is required by python executable draw_net.py
    # https://github.com/BVLC/caffe/blob/eeebdab16155d34ff8f5f42137da7df4d1c7eab0/python/caffe/draw.py#L7-L22
)
makedepends=('doxygen' 'texlive-core')
conflicts=('caffe' 'caffe-git' 'caffe-cpu-git' 'caffe-dr-git' 'caffe-mnc-dr-git'
           'caffe2' 'caffe2-git' 'caffe2-cpu' 'caffe2-cpu-git')
source=("${_srcname}-${pkgver}.tar.gz"::"https://github.com/BVLC/${_srcname}/archive/${pkgver}.tar.gz")
sha256sums=('71d3c9eb8a183150f965a465824d01fe82826c22505f7aa314f700ace03fa77f')

prepare() {
    cd "${_srcname}-${pkgver}"
    
    # prepare to configure options in Makefile.config
    cp -f Makefile.config.example Makefile.config
    
    # enable CPU-only build
    sed -i '/CPU_ONLY/s/^#[[:space:]]//g' Makefile.config
    
    # strictly enable I/O dependencies
    sed -i '/USE_OPENCV/s/^#[[:space:]]//;/USE_OPENCV/s/0/1/'   Makefile.config
    sed -i '/USE_LEVELDB/s/^#[[:space:]]//;/USE_LEVELDB/s/0/1/' Makefile.config
    sed -i '/USE_LMDB/s/^#[[:space:]]//;/USE_LMDB/s/0/1/'       Makefile.config
    sed -i '/OPENCV_VERSION/s/^#[[:space:]]//g'                 Makefile.config
    
    # set OpenBLAS as the BLAS provider and adjust its directories
    sed -i '/BLAS[[:space:]]\:=[[:space:]]atlas/s/atlas/open/'                                 Makefile.config
    sed -i 's/.*BLAS_INCLUDE[[:space:]]\:=[[:space:]]\/path.*/BLAS_INCLUDE := \/usr\/include/' Makefile.config
    sed -i 's/.*BLAS_LIB[[:space:]]\:=[[:space:]]\/path.*/BLAS_LIB := \/usr\/lib/'             Makefile.config
    
    # python3 settings
    _py2inc_line="$(sed -n '/PYTHON_INCLUDE[[:space:]]\:=[[:space:]]\/usr\/include\/python2\.7/='  Makefile.config)"
    _py3inc_line="$(sed -n '/PYTHON_INCLUDE[[:space:]]\:=[[:space:]]\/usr\/include\/python3\.5m/=' Makefile.config)"
    _py3libs_line="$(sed -n '/PYTHON_LIBRARIES/=' Makefile.config)"
    sed -i "$((_py2inc_line))s/^/# /"  Makefile.config # comment python2 lines
    sed -i "$((_py2inc_line+1))s/^/#/" Makefile.config
    sed -i "$((_py3inc_line))s/^#[[:space:]]//"   Makefile.config # uncomment python3 PYTHON_INCLUDE lines
    sed -i "$((_py3inc_line+1))s/^#//"            Makefile.config
    sed -i "$((_py3libs_line))s/^#[[:space:]]//"  Makefile.config # uncomment PYTHON_LIBRARIES line
    sed -i "$((_py3libs_line))s/5/6/"             Makefile.config # change version in PYTHON_LIBRARIES
    sed -i "$((_py3inc_line))s/5/6/"              Makefile.config # change version in python3 PYTHON_INCLUDE
    sed -i "$((_py3inc_line+1))s/5/6/;$((_py3inc_line+1))s/dist/site/" Makefile.config
    
    # use python layers
    sed -i '/WITH_PYTHON_LAYER/s/^#[[:space:]]//g' Makefile.config
    
    # if you want to use python2 _instead_ of python3:
    #     - uncomment this block
    #     - comment the python3 block
    #     - change python3 dependencies to python2
    #     - change python2 directories in package() to python3
    #     - NOTE: do not enable both python2 and python3 blocks. choose only one.
    #     - NOTE: python2 is the Caffe default but this package uses python3 by default
    # python2 settings
    #_py2inc_line="$(sed -n '/PYTHON_INCLUDE[[:space:]]\:=[[:space:]]\/usr\/include\/python2\.7/=' Makefile.config)"
    #sed -i "$((_py2inc_line+1))s/dist/site/" Makefile.config
}

build() {
    cd "${_srcname}-${pkgver}"
    msg2 "Building target 'all'..."
    make all
    msg2 "Building target 'pycaffe'..."
    make pycaffe
    msg2 "Building target 'docs'..."
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
    # directories creation
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/include/caffe/"{layers,proto,test,util}
    mkdir -p "${pkgdir}/usr/lib/python3.6/site-packages/caffe/"{imagenet,proto,test}
    mkdir -p "${pkgdir}/usr/share/"{caffe,doc/"${_srcname}"/search,licenses/"${pkgname}"}
    
    # binaries
    cd "${srcdir}/${_srcname}-${pkgver}/distribute/bin"
    install -D -m755 * "${pkgdir}/usr/bin"
    
    # libraries
    cd "${srcdir}/${_srcname}-${pkgver}/distribute/lib"
    install -D -m755 *.so "${pkgdir}/usr/lib"
    
    # includes
    cd "${srcdir}/${_srcname}-${pkgver}/distribute/include/caffe"
    install -D -m644 *.hpp "${pkgdir}/usr/include/caffe"
    for _dir in layers proto test util
    do
        cd "${srcdir}/${_srcname}-${pkgver}/distribute/include/caffe/${_dir}"
        install -D -m644 * "${pkgdir}/usr/include/caffe/${_dir}"
    done
    
    # python
    cd "${srcdir}/${_srcname}-${pkgver}/distribute/python"
    install -D -m755 *.py "${pkgdir}/usr/bin"
    
    cd caffe
    for _file in *
    do
        [ -d "$_file" ] && continue # skip directories
        _mode="$(stat --format '%a' "$_file")"
        install -D -m"$_mode" "$_file" "${pkgdir}/usr/lib/python3.6/site-packages/caffe"
    done
    
    for _dir in imagenet proto test
    do
        cd "${srcdir}/${_srcname}-${pkgver}/distribute/python/caffe/${_dir}"
        for _file in *
        do
            _mode="$(stat --format '%a' "$_file")"
            install -D -m"$_mode" "$_file" "${pkgdir}/usr/lib/python3.6/site-packages/caffe/${_dir}"
        done
    done
    
    # proto
    cd "${srcdir}/${_srcname}-${pkgver}/distribute/proto"
    install -D -m644 * "${pkgdir}/usr/share/caffe"
    
    # docs
    cd "${srcdir}/${_srcname}-${pkgver}/doxygen/html"
    for _file in *
    do
        [ -d "$_file" ] && continue # skip directories
        install -D -m644 "$_file" "${pkgdir}/usr/share/doc/${_srcname}"
    done
    cd search
    install -D -m644 * "${pkgdir}/usr/share/doc/${_srcname}/search"
    
    # license
    cd "${srcdir}/${_srcname}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
