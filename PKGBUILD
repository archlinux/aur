# Maintainer: Gin <ginnokami8@gmail.com>
pkgname=waifu2x-caffe
pkgver=v1.1
pkgrel=1
pkgdesc="Image rescaling and noise reduction using the power of convolutional neural networks. Rewritten from the original Waifu2x using Caffe. Compiled with CUDA & cuDNN enabled flags."
arch=('x86_64')
url="https://github.com/Gin-no-kami/waifu2x-caffe"
license=('MIT')
groups=()
depends=(
    'cudnn'
    'cuda'
    'openblas'
    'opencv'
    'google-glog'
    'protobuf'
    'boost'
    'gflags'
    'hdf5'
    'leveldb'
    'python-numpy'
)
makedepends=(
    'git'
    'cmake'
)
optdepends=()
provides=('waifu2x-caffe')
conflicts=('waifu2x-caffe')
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "git://github.com/Gin-no-kami/waifu2x-caffe.git#tag=${pkgver}"
    "git://github.com/Gin-no-kami/caffe.git#tag=v1.0"
)
noextract=()
md5sums=(
    'SKIP'
    'SKIP'
)

prepare() {
    mkdir -p build

    # Caffe setup
    cd "${srcdir}/caffe"
    cp Makefile.config.example Makefile.config

    # waifu2x-caffe setup
    cd "${srcdir}/waifu2x-caffe"
    git submodule update --init --recursive

    # Change Source.cpp to update the model file location
    sed -i 's+models/cunet+/usr/share/waifu2x-caffe/models/cunet+g' waifu2x-caffe/Source.cpp
    
    # create symlink to caffe
    ln -sf ../caffe ./caffe
    ln -sf ../caffe ./libcaffe

    cd ${srcdir}/build
    cmake "${srcdir}/waifu2x-caffe" -DCUDA_NVCC_FLAGS="-D_FORCE_INLINES  -gencode arch=compute_86,code=sm_86 "
    # Fix issue with the compile failing. These flags need to be removed from the CUDA_FLAGS, but I can't find which CMakeFile is generating this line. So just remove it with sed.
    sed -i 's/-Xcudafe --diag_suppress=set_but_not_used -DBOOST_ALL_NO_LIB;-DUSE_LMDB;-DUSE_LEVELDB;-DUSE_CUDNN;-DUSE_OPENCV;-DWITH_PYTHON_LAYER//g' libcaffe/src/caffe/CMakeFiles/caffe.dir/flags.make
}

build() {
    # Build caffe
    cd "${srcdir}/caffe"
    make -j$(nproc)

    cd "${srcdir}/build"
    make -j$(nproc)
}

package() {
    install -Dm 755 "${srcdir}/build/waifu2x-caffe" "${pkgdir}/usr/bin/waifu2x-caffe"
    install -Dm 644 "${srcdir}/build/libcaffe/lib/libcaffe.so.1.0.0" "${pkgdir}/usr/lib/libcaffe.so.1.0.0"

    install -Dm 644 "${srcdir}/waifu2x-caffe/README-EN.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 "${srcdir}/waifu2x-caffe/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Move the model files.
    cd "${srcdir}/waifu2x-caffe/bin/models"
    for folder in *; do
        for file in "$folder"/*; do
            install -Dm 664 "$file" "${pkgdir}/usr/share/${pkgname}/models/$file"
        done
    done
}
