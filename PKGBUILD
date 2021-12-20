# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=nvidia-vpf
pkgver=1.1.1
pkgrel=1
pkgdesc='NVIDIA Video Processing Framework'
arch=('x86_64')
url='https://github.com/NVIDIA/VideoProcessingFramework/'
license=('Apache')
depends=('cuda' 'nvidia-utils' 'ffmpeg' 'python' 'python-pytorch-cuda')
makedepends=('cmake' 'nvidia-sdk' 'python-setuptools')
options=('!emptydirs')
source=("https://github.com/NVIDIA/VideoProcessingFramework/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-nvidia-vpf-fix-pytorch-extension.patch')
sha256sums=('a41c03c2ba79e7b1d304d87453d8ce2182bad66b651566612de67cc8f0eb0dc5'
            'bd5435a70892f1b262275ccefb51a1e4871fc585c4267e85a0994f1c703f8fc2')

prepare() {
    patch -d "VideoProcessingFramework-${pkgver}" -Np1 -i "${srcdir}/010-nvidia-vpf-fix-pytorch-extension.patch"
}

build() {
    export CUDA_HOME='/opt/cuda'
    export CXXFLAGS+=' -I/opt/cuda/include'
    export  LDFLAGS+=' -L/opt/cuda/lib64'
    cmake -B build -S "VideoProcessingFramework-${pkgver}" \
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
