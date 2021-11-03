# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=nvidia-vpf-git
pkgver=1.1.r14.g5e951e4
pkgrel=1
pkgdesc='NVIDIA Video Processing Framework (git version)'
arch=('x86_64')
url='https://github.com/NVIDIA/VideoProcessingFramework/'
license=('Apache')
depends=('cuda' 'nvidia-utils' 'ffmpeg' 'python' 'python-pytorch-cuda')
makedepends=('git' 'cmake' 'nvidia-sdk' 'python-setuptools')
provides=('nvidia-vpf')
conflicts=('nvidia-vpf')
options=('!emptydirs')
source=('git+https://github.com/NVIDIA/VideoProcessingFramework.git')
sha256sums=('SKIP')

pkgver() {
    git -C VideoProcessingFramework describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CUDA_HOME='/opt/cuda'
    export CXXFLAGS+=' -I/opt/cuda/include'
    export  LDFLAGS+=' -L/opt/cuda/lib64'
    cmake -B build -S VideoProcessingFramework \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_CUDA_COMPILER:FILEPATH='/opt/cuda/bin/nvcc' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -DGENERATE_PYTHON_BINDINGS:BOOL='TRUE' \
        -DGENERATE_PYTORCH_EXTENSION:BOOL='TRUE' \
        -DVIDEO_CODEC_SDK_INCLUDE_DIR:PATH='/usr/include/nvidia-sdk' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    
    local _sitepkg
    _sitepkg="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d -m755 "$pkgdir"{"$_sitepkg",/usr/share/nvidia-vpf/samples}
    mv "${pkgdir}/usr/bin"/Py{,torch}NvCodec"$(python-config --extension-suffix)" "${pkgdir}${_sitepkg}"
    mv "${pkgdir}/usr/bin"/*.so* "${pkgdir}/usr/lib"
    mv "${pkgdir}/usr/bin"/*.py "${pkgdir}/usr/share/nvidia-vpf/samples"
    chmod a+x "${pkgdir}/usr/share/nvidia-vpf/samples"/*.py
}
