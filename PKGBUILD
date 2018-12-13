# Maintainer : jerry73204 < jerry73204 at gmail dot com >

# NOTE:
# In order to build with NCCL support, uncomment the NCCL
# lines in 'depends' and 'preprare()'.

pkgname=caffe-ssd
_srcname=caffe
pkgver=ssdv1.0.r0.g4817bf8b
pkgrel=3
pkgdesc="weiliu89's caffe"
arch=('x86_64')
url="http://caffe.berkeleyvision.org/"
license=('BSD')
depends=(
    # official repositories:
        'boost-libs' 'protobuf' 'google-glog' 'gflags' 'hdf5' 'opencv' 'leveldb'
        'lmdb' 'cuda' 'cudnn' 'python' 'boost' 'cython' 'python-numpy' 'python-scipy'
        'python-matplotlib' 'ipython' 'python-h5py' 'python-networkx' 'python-nose'
        'python-pandas' 'python-dateutil' 'python-protobuf' 'python-gflags'
        'python-yaml' 'python-pillow' 'python-six'
    # AUR:
        # required:
            'openblas-lapack'
        # not required:
            # 'nccl'
        #python:
            'python-leveldb' 'python-scikit-image' 'python-pydotplus'
    # NOTE:
    # python-pydotplus (or python-pydot) is required by python executable draw_net.py
    # https://github.com/BVLC/caffe/blob/691febcb83d6a3147be8e9583c77aefaac9945f8/python/caffe/draw.py#L7-L22
)
makedepends=('git' 'gcc6' 'doxygen' 'texlive-core' 'findutils')
provides=('caffe')
conflicts=('caffe' 'caffe-cpu' 'caffe-cpu-git' 'caffe-dr-git' 'caffe-mnc-dr-git'
           'caffe2' 'caffe2-git' 'caffe2-cpu' 'caffe2-cpu-git' 'caffe-git' 'caffe-ssd-cpu')
source=("${pkgname}"::"git+https://github.com/weiliu89/caffe.git#branch=ssd")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"

    # prepare to configure options in Makefile.config
    cp -f Makefile.config.example Makefile.config

    # enable cuDNN acceleration switch
    sed -i '/USE_CUDNN/s/^#[[:space:]]//g' Makefile.config

    # enable NCCL acceleration switch
    # sed -i '/USE_NCCL/s/^#[[:space:]]//g' Makefile.config

    # fix compatibility OpenCV 4
    sed -i '/INCLUDE_DIRS += $(BUILD_INCLUDE_DIR) .\/src .\/include/a\INCLUDE_DIRS += /usr/include/opencv4' Makefile
    sed -i 's|COMMON_FLAGS += \$(foreach includedir,\$(INCLUDE_DIRS),-isystem \$(includedir))|COMMON_FLAGS += \$(foreach includedir,\$(INCLUDE_DIRS),-I \$(includedir))|' Makefile

    find -name '*.cpp' -exec \
         sed -i -e 's/CV_LOAD_IMAGE_COLOR/cv::IMREAD_COLOR/g' \
         -e 's/CV_LOAD_IMAGE_GRAYSCALE/cv::IMREAD_GRAYSCALE/g' \
         -e 's/CV_CAP_PROP_FRAME_COUNT/cv::CAP_PROP_FRAME_COUNT/g' \
         -e 's/CV_CAP_PROP_POS_FRAMES/cv::CAP_PROP_POS_FRAMES/g' \
         -e 's/CV_HSV2BGR/cv::COLOR_HSV2BGR/g' \
         -e 's/CV_BGR2HSV/cv::COLOR_BGR2HSV/g' \
         -e 's/CV_BGR2Lab/cv::COLOR_BGR2Lab/g' \
         -e 's/CV_BGR2YCrCb/cv::COLOR_BGR2YCrCb/g' \
         -e 's/CV_YCrCb2BGR/cv::COLOR_YCrCb2BGR/g' \
         -e 's/CV_GRAY2BGR/cv::COLOR_GRAY2BGR/g' \
         -e 's/CV_BGR2GRAY/cv::COLOR_BGR2GRAY/g' \
         -e 's/CV_THRESH_BINARY_INV/cv::THRESH_BINARY_INV/g' \
         -e 's/CV_THRESH_OTSU/cv::THRESH_OTSU/g' \
         -e 's/CV_IMWRITE_JPEG_QUALITY/cv::IMWRITE_JPEG_QUALITY/g' \
         -e 's/CV_FOURCC/cv::VideoWriter::fourcc/g' \
         -e 's/CV_FILLED/cv::FILLED/g' \
         {} ';'

    # strictly enable I/O dependencies
    sed -i '/USE_OPENCV/s/^#[[:space:]]//;/USE_OPENCV/s/0/1/'   Makefile.config
    sed -i '/USE_LEVELDB/s/^#[[:space:]]//;/USE_LEVELDB/s/0/1/' Makefile.config
    sed -i '/USE_LMDB/s/^#[[:space:]]//;/USE_LMDB/s/0/1/'       Makefile.config
    sed -i '/OPENCV_VERSION/s/^#[[:space:]]//g'                 Makefile.config

    # use gcc6 (CUDA 9.0 code requires gcc6)
    sed -i '/CUSTOM_CXX/s/^#[[:space:]]//;/CUSTOM_CXX/s/$/-6/' Makefile.config

    # set CUDA directory
    sed -i '/CUDA_DIR/s/\/usr\/local\/cuda/\/opt\/cuda/' Makefile.config

    # remove gpu architectures not supported by CUDA 9.0
    sed -i 's/-gencode[[:space:]]arch=compute_20,code=sm_20//' Makefile.config
    sed -i 's/-gencode[[:space:]]arch=compute_20,code=sm_21//' Makefile.config

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
    sed -i "$((_py3libs_line))s/5/7/"             Makefile.config # change version in PYTHON_LIBRARIES
    sed -i "$((_py3inc_line))s/5/7/"              Makefile.config # change version in python3 PYTHON_INCLUDE
    sed -i "$((_py3inc_line+1))s/5/7/;$((_py3inc_line+1))s/dist/site/" Makefile.config

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

pkgver() {
    cd "$pkgname"

    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"

    export CC=gcc-6
    export CXX=g++-6

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
#    cd "$pkgname"
#    msg2 "Building target 'test'..."
#    make test
#    msg2 "Making target 'runtest'..."
#    make runtest
#}

package() {
    # directories creation
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/include/caffe/"{layers,proto,test,util}
    mkdir -p "${pkgdir}/usr/lib/python3.7/site-packages/caffe/"{imagenet,proto,test}
    mkdir -p "${pkgdir}/usr/share/"{caffe,doc/"${_srcname}"/search,licenses/"${pkgname}"}

    # binaries
    cd "${pkgname}/distribute/bin"
    install -D -m755 * "${pkgdir}/usr/bin"

    # libraries
    cd "${srcdir}/${pkgname}/distribute/lib"
    install -D -m755 *.so "${pkgdir}/usr/lib"

    # includes
    cd "${srcdir}/${pkgname}/distribute/include/caffe"
    install -D -m644 *.hpp "${pkgdir}/usr/include/caffe"
    for _dir in layers proto test util
    do
        cd "${srcdir}/${pkgname}/distribute/include/caffe/${_dir}"
        install -D -m644 * "${pkgdir}/usr/include/caffe/${_dir}"
    done

    # python
    cd "${srcdir}/${pkgname}/distribute/python"
    install -D -m755 *.py "${pkgdir}/usr/bin"
    rm -rf python # remove duplicated 'python' folder

    cd caffe
    for _file in *
    do
        [ -d "$_file" ] && continue # skip directories
        _mode="$(stat --format '%a' "$_file")"
        install -D -m"$_mode" "$_file" "${pkgdir}/usr/lib/python3.7/site-packages/caffe"
    done

    for _dir in imagenet proto test
    do
        cd "${srcdir}/${pkgname}/distribute/python/caffe/${_dir}"
        for _file in *
        do
            _mode="$(stat --format '%a' "$_file")"
            install -D -m"$_mode" "$_file" "${pkgdir}/usr/lib/python3.7/site-packages/caffe/${_dir}"
        done
    done

    # proto
    cd "${srcdir}/${pkgname}/distribute/proto"
    install -D -m644 * "${pkgdir}/usr/share/caffe"

    # docs
    cd "${srcdir}/${pkgname}/doxygen/html"
    for _file in *
    do
        [ -d "$_file" ] && continue # skip directories
        install -D -m644 "$_file" "${pkgdir}/usr/share/doc/${_srcname}"
    done
    cd search
    install -D -m644 * "${pkgdir}/usr/share/doc/${_srcname}/search"

    # license
    cd "${srcdir}/${pkgname}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
