# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=nvidia-vpf
pkgver=2.0.0
pkgrel=1
pkgdesc='NVIDIA Video Processing Framework'
arch=('x86_64')
url='https://github.com/NVIDIA/VideoProcessingFramework/'
license=('Apache')
depends=('cuda' 'nvidia-utils' 'ffmpeg' 'python' 'python-numpy')
optdepends=('python-pytorch-cuda: for Torch extension (PytorchNvCodec)')
makedepends=('cmake' 'ninja' 'python-build' 'python-scikit-build' 'python-installer'
             'python-ninja' 'python-pytorch-cuda' 'python-setuptools' 'python-wheel')
source=("https://github.com/NVIDIA/VideoProcessingFramework/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-nvidia-vpf-remove-unwanted-pip-build-deps.patch')
sha256sums=('09f50b12413caa0941c116bd507bb1bd5c0716d46138db7aff941226966bd6d0'
            '334a11a45d2085b89a0780510ff2e26c6a57afc78fab7299ba1fee3e826b66a1')

prepare() {
    patch -d "VideoProcessingFramework-${pkgver}" -Np1 -i "${srcdir}/010-nvidia-vpf-remove-unwanted-pip-build-deps.patch"
}

build() {
    cd "VideoProcessingFramework-${pkgver}"
    python -m build --wheel --no-isolation

    cd src/PytorchNvCodec
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" "VideoProcessingFramework-${pkgver}/dist"/*.whl
    python -m installer --destdir="$pkgdir" "VideoProcessingFramework-${pkgver}/src/PytorchNvCodec/dist"/*.whl
}
