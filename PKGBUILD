# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=nvidia-vpf
pkgver=1.1
pkgrel=1
pkgdesc='NVIDIA Video Processing Framework'
arch=('x86_64')
url='https://github.com/NVIDIA/VideoProcessingFramework/'
license=('Apache')
depends=('cuda' 'nvidia-utils' 'ffmpeg' 'python')
makedepends=('cmake' 'nvidia-sdk')
options=('!emptydirs')
source=("https://github.com/NVIDIA/VideoProcessingFramework/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-nvidia-vpf-add-missing-header.patch'::'https://github.com/NVIDIA/VideoProcessingFramework/commit/abba228ab1fe7c446efd52ed9949410ae2224fde.patch'
        '020-nvidia-vpf-fix-a-type-initialization.patch'::'https://github.com/NVIDIA/VideoProcessingFramework/commit/4c817ab63038bbfba9de2ec4c22bfca3ef8828d0.patch')
sha256sums=('b844d58bb4345b8622624c9ee5c83b141ac4e8d7fbeb6e541717fefa485d9325'
            'b350a5aa8d275ceddc8b712d34ed765ec60469a1a2cf7d1baf597cecabf36abe'
            '570da8accabaeaabd2897c5a95f648afd6bfa68811ec03756a048fb1c8e65351')

prepare() {
    patch -d "VideoProcessingFramework-${pkgver}" -Np1 -i "${srcdir}/010-nvidia-vpf-add-missing-header.patch"
    patch -d "VideoProcessingFramework-${pkgver}" -Np1 -i "${srcdir}/020-nvidia-vpf-fix-a-type-initialization.patch"
}

build() {
    export CUDAToolkit_ROOT='/opt/cuda'
    export CXXFLAGS+=' -I/opt/cuda/include'
    export  LDFLAGS+=' -L/opt/cuda/lib64'
    cmake -B build -S "VideoProcessingFramework-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_CUDA_COMPILER:FILEPATH='/opt/cuda/bin/nvcc' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -DGENERATE_PYTHON_BINDINGS:BOOL='TRUE' \
        -DVIDEO_CODEC_SDK_INCLUDE_DIR:PATH='/usr/include/nvidia-sdk' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    install -d -m755 "${pkgdir}/usr"/{"lib/python${_pyver}/site-packages",share/nvidia-vpf/samples}
    mv "${pkgdir}/usr/bin"/PyNvCodec.cpython*.so "${pkgdir}/usr/lib/python${_pyver}/site-packages"
    mv "${pkgdir}/usr/bin"/*.so* "${pkgdir}/usr/lib"
    mv "${pkgdir}/usr/bin"/*.py "${pkgdir}/usr/share/nvidia-vpf/samples"
    chmod a+x "${pkgdir}/usr/share/nvidia-vpf/samples"/*.py
}
