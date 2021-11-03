# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=nvidia-vpf
pkgver=1.1
pkgrel=2
pkgdesc='NVIDIA Video Processing Framework'
arch=('x86_64')
url='https://github.com/NVIDIA/VideoProcessingFramework/'
license=('Apache')
depends=('cuda' 'nvidia-utils' 'ffmpeg' 'python' 'python-pytorch-cuda')
makedepends=('cmake' 'nvidia-sdk' 'python-setuptools')
options=('!emptydirs')
source=("https://github.com/NVIDIA/VideoProcessingFramework/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-nvidia-vpf-add-missing-header.patch'::'https://github.com/NVIDIA/VideoProcessingFramework/commit/abba228ab1fe7c446efd52ed9949410ae2224fde.patch'
        '020-nvidia-vpf-fix-a-type-initialization.patch'::'https://github.com/NVIDIA/VideoProcessingFramework/commit/4c817ab63038bbfba9de2ec4c22bfca3ef8828d0.patch'
        '030-nvidia-vpf-fix-pytorch-extension.patch'::'https://github.com/NVIDIA/VideoProcessingFramework/commit/d56e4b98e80346f8c99a3c9ba3b1bfdab8ca0fbd.patch'
        '040-nvidia-vpf-use-sysconfig-for-ext-suffix.patch'::'https://github.com/NVIDIA/VideoProcessingFramework/commit/5e951e48502e9c08080ed928453efaf998aad391.patch')
sha256sums=('b844d58bb4345b8622624c9ee5c83b141ac4e8d7fbeb6e541717fefa485d9325'
            'b350a5aa8d275ceddc8b712d34ed765ec60469a1a2cf7d1baf597cecabf36abe'
            '570da8accabaeaabd2897c5a95f648afd6bfa68811ec03756a048fb1c8e65351'
            '6bfa031cb81f6cd96ffff770c4474519529897a5e25dbad74c3872918fcc2172'
            '4e378272e4110651ceb07224e91f581197c515a56e59f7e024a68b26a8162084')

prepare() {
    patch -d "VideoProcessingFramework-${pkgver}" -Np1 -i "${srcdir}/010-nvidia-vpf-add-missing-header.patch"
    patch -d "VideoProcessingFramework-${pkgver}" -Np1 -i "${srcdir}/020-nvidia-vpf-fix-a-type-initialization.patch"
    patch -d "VideoProcessingFramework-${pkgver}" -Np1 -i "${srcdir}/030-nvidia-vpf-fix-pytorch-extension.patch"
    patch -d "VideoProcessingFramework-${pkgver}" -Np1 -i "${srcdir}/040-nvidia-vpf-use-sysconfig-for-ext-suffix.patch"
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
    chmod a+x "${pkgdir}/usr/share/nvidia-vpf/samples"/*.py
}
