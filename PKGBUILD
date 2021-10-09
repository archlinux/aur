# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=nvidia-vpf
pkgver=1.0
pkgrel=1
pkgdesc='NVIDIA Video Processing Framework'
arch=('x86_64')
url='https://github.com/NVIDIA/VideoProcessingFramework/'
license=('Apache')
depends=('cuda' 'nvidia-utils' 'ffmpeg' 'python')
makedepends=('cmake' 'nvidia-sdk')
options=('!emptydirs')
source=("https://github.com/NVIDIA/VideoProcessingFramework/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('849d98221abb8a7641600c2755367b92fba4a7b5bbc4661a71d43eec7a1d9aea')

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
