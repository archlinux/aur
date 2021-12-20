# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=nvidia-vpf-git
pkgver=1.1.1.r1.g869316d
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
source=('git+https://github.com/NVIDIA/VideoProcessingFramework.git'
        '010-nvidia-vpf-fix-pytorch-extension.patch')
sha256sums=('SKIP'
            '65630bb49c2180c0c8a42baf56d5ca3af502c32cd49e83dabff3b54abfd870eb')

prepare() {
    patch -d VideoProcessingFramework -Np1 -i "${srcdir}/010-nvidia-vpf-fix-pytorch-extension.patch"
}

pkgver() {
    git -C VideoProcessingFramework describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^ver_//'
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
    rm "${pkgdir}/usr/bin"/*.mp4
    chmod a+x "${pkgdir}/usr/share/nvidia-vpf/samples"/*.py
}
