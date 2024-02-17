# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=nvidia-vpf-git
pkgver=2.0.0.r12.g82b51e7
pkgrel=1
pkgdesc='NVIDIA Video Processing Framework (git version)'
arch=('x86_64')
url='https://github.com/NVIDIA/VideoProcessingFramework/'
license=('Apache-2.0')
depends=('cuda' 'nvidia-utils' 'ffmpeg' 'python' 'python-numpy')
optdepends=('python-pytorch-cuda: for Torch extension (PytorchNvCodec)')
makedepends=('git' 'cmake' 'python-build' 'python-scikit-build' 'python-fsspec'
             'python-installer' 'python-pytorch-cuda' 'python-setuptools' 'python-wheel')
provides=('nvidia-vpf')
conflicts=('nvidia-vpf')
source=('git+https://github.com/NVIDIA/VideoProcessingFramework.git'
        '010-nvidia-vpf-remove-unwanted-pip-build-deps.patch')
sha256sums=('SKIP'
            'ad1dcb990b59946f699c1fcfd201c995c0ff8b5800557710e874a0bae2fbfa85')

prepare() {
    patch -d VideoProcessingFramework -Np1 -i "${srcdir}/010-nvidia-vpf-remove-unwanted-pip-build-deps.patch"
}

pkgver() {
    git -C VideoProcessingFramework describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^ver_//;s/^v//'
}

build() {
    export CMAKE_GENERATOR='Unix Makefiles'
    
    cd VideoProcessingFramework
    python -m build --wheel --no-isolation

    cd src/PytorchNvCodec
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" VideoProcessingFramework/dist/*.whl
    python -m installer --destdir="$pkgdir" VideoProcessingFramework/src/PytorchNvCodec/dist/*.whl
}
