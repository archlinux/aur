# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=nvidia-vpf
pkgver=2.0.0
pkgrel=2
pkgdesc='NVIDIA Video Processing Framework'
arch=('x86_64')
url='https://github.com/NVIDIA/VideoProcessingFramework/'
license=('Apache-2.0')
depends=('cuda' 'nvidia-utils' 'ffmpeg' 'python' 'python-numpy')
optdepends=('python-pytorch-cuda: for Torch extension (PytorchNvCodec)')
makedepends=('cmake' 'python-build' 'python-scikit-build' 'python-installer'
             'python-pytorch-cuda' 'python-setuptools' 'python-wheel')
source=("https://github.com/NVIDIA/VideoProcessingFramework/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-nvidia-vpf-remove-unwanted-pip-build-deps.patch')
sha256sums=('09f50b12413caa0941c116bd507bb1bd5c0716d46138db7aff941226966bd6d0'
            '1188222edb0534e9385059a31c3c4f669223435b2a400ceadd28beadab0da3c5')

prepare() {
    patch -d "VideoProcessingFramework-${pkgver}" -Np1 -i "${srcdir}/010-nvidia-vpf-remove-unwanted-pip-build-deps.patch"
}

build() {
    export CMAKE_GENERATOR='Unix Makefiles'
    
    cd "VideoProcessingFramework-${pkgver}"
    python -m build --wheel --no-isolation

    cd src/PytorchNvCodec
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" "VideoProcessingFramework-${pkgver}/dist"/*.whl
    python -m installer --destdir="$pkgdir" "VideoProcessingFramework-${pkgver}/src/PytorchNvCodec/dist"/*.whl
}
