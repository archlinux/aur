# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=caffe-cpu
_srcname=caffe
pkgver=rc5
pkgrel=1
pkgdesc="A deep learning framework made with expression, speed, and modularity in mind (cpu only)"
arch=('i686' 'x86_64')
url="http://caffe.berkeleyvision.org/"
license=('BSD')
depends=( # binary repositories:
          'boost-libs' 'protobuf' 'google-glog' 'gflags' 'hdf5' 'opencv' 'leveldb'
          'lmdb' 'python2' 'boost' 'cython2' 'python2-h5py' 'ipython2'
          'python2-matplotlib' 'python2-networkx' 'python2-nose' 'python2-numpy'
          'python2-pandas' 'python2-protobuf' 'python2-gflags' 'python2-scikit-learn'
          'python2-scipy' 'python2-pydot'
          # AUR:
          'openblas-lapack' 'python2-leveldb' 'python2-scikit-image')
makedepends=('gcc5' 'doxygen' 'texlive-core')
provides=('caffe')
conflicts=('caffe' 'caffe-git' 'caffe-cpu-git' 'caffe-dr-git' 'caffe-mnc-dr-git')
source=("${_srcname}-${pkgver}.tar.gz"::"https://github.com/BVLC/${_srcname}/archive/rc.tar.gz")
noextract=("${_srcname}-${pkgver}.tar.gz")
sha256sums=('7da46e2802c5d85e41aeda79bf27e907fc317fb1ecf96800403f4a57f1cd0dfb')

prepare() {
    # extract source file to a directory in the format $_srcname-$pkgver
    mkdir -p "${_srcname}-${pkgver}"
    cd "${_srcname}-${pkgver}"
    tar xf ../"${_srcname}-${pkgver}.tar.gz" --strip 1
    
    # compile fix: add 'opencv_imgcodecs' library to Makefile
    sed -i '/opencv_imgproc/s/$/ opencv_imgcodecs/' Makefile
    
    # prepare to configure options in Makefile.config
    cp -f Makefile.config.example Makefile.config
    
    # enable CPU-only build
    sed -i '/CPU_ONLY/s/^#[[:space:]]//g' Makefile.config
    
    # use gcc5 (gcc6 do not work)
    sed -i '/CUSTOM_CXX/s/^#[[:space:]]//;/CUSTOM_CXX/s/$/-5/' Makefile.config
    
    # set OpenBLAS as the BLAS provider and adjust its directories
    sed -i '/BLAS[[:space:]]\:=[[:space:]]atlas/s/atlas/open/'                Makefile.config
    sed -i 's/.*BLAS_INCLUDE[[:space:]]\:=.*/BLAS_INCLUDE := \/usr\/include/' Makefile.config
    sed -i 's/.*BLAS_LIB[[:space:]]\:=.*/BLAS_LIB := \/usr\/lib/'             Makefile.config
    
    # python2 settings
    _pyinc_line="$(sed -n '/PYTHON_INCLUDE[[:space:]]\:=[[:space:]]\/usr/=' Makefile.config)"
    sed -i "$((_pyinc_line+1))s/dist/site/" Makefile.config
    
    # python3 settings
    #     if you want to try python3 _instead_ of python2 (currently not working):
    #         - uncomment this block
    #         - comment the python2 block
    #         - change python2 depends and optdepends to python3
    #         - NOTE: do not enable both python2 and python3 blocks. choose only one.
    #_pyinc_line="$(sed -n '/PYTHON_INCLUDE[[:space:]]\:=[[:space:]]\/usr/=' Makefile.config)"
    #sed -i "$((_pyinc_line))s/2\.7/3.6m/"                                 Makefile.config
    #sed -i "$((_pyinc_line+1))s/2\.7/3.6/;$((_pyinc_line+1))s/dist/site/" Makefile.config
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

package() {
    # directories creation
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/include/caffe/"{proto,test,util}
    mkdir -p "${pkgdir}/usr/lib/python2.7/site-packages/caffe/"{imagenet,proto}
    mkdir -p "${pkgdir}/usr/share/"{doc/"${pkgname}"/search,licenses/"${pkgname}"}
    
    cd "${_srcname}-${pkgver}/distribute"
    
    # binaries
    cd bin
    install -D -m755 * "${pkgdir}/usr/bin"
    
    # libraries
    cd ../lib
    install -D -m755 *.so "${pkgdir}/usr/lib"
    
    # includes
    cd ../include/caffe
    install -D -m644 *.hpp "${pkgdir}/usr/include/caffe"
    for _dir in proto test util
    do
        cd "${srcdir}/${_srcname}-${pkgver}/distribute/include/caffe/${_dir}"
        install -D -m644 * "${pkgdir}/usr/include/caffe/${_dir}"
    done
    
    # python
    cd ../../../python
    install -D -m755 *.py "${pkgdir}/usr/bin"
    rm -rf python # remove duplicated 'python' folder
    
    cd caffe
    for _file in *
    do
        [ -d "$_file" ] && continue # skip directories
        _mode="$(stat --format '%a' "$_file")"
        install -D -m"$_mode" "$_file" "${pkgdir}/usr/lib/python2.7/site-packages/caffe"
    done
    
    # python 'site-packages/caffe/imagenet' and 'site-packages/caffe/proto'
    for _dir in imagenet proto
    do
        cd "${srcdir}/${_srcname}-${pkgver}/distribute/python/caffe/$_dir"
        for _file in *
        do
            _mode="$(stat --format '%a' "$_file")"
            install -D -m"$_mode" "$_file" "${pkgdir}/usr/lib/python2.7/site-packages/caffe/${_dir}"
        done
    done
    
    # docs
    cd ../../../../doxygen/html
    for _file in *
    do
        [ -d "$_file" ] && continue # skip directories
        install -D -m644 "$_file" "${pkgdir}/usr/share/doc/${pkgname}"
    done
    cd search
    install -D -m644 * "${pkgdir}/usr/share/doc/${pkgname}/search"
    
    # license
    cd "${srcdir}/${_srcname}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
