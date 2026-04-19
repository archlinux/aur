# vim:cms=#\ %s
# Maintainer: awh (https://aur.archlinux.org/account/awh)

pkgname=babbletrainer
# real tag has hyphens not underscores, but makepkg doesn't allow so remap later
pkgver=1.3.8_linux_paths
pkgrel=3
pkgdesc="On-device B.A.B.A.L.L.S. trainer"
arch=('x86_64' 'aarch64')
url="https://github.com/Project-Babble/BabbleTrainer"
license=('LicenseRef-Babble Software Distribution License 1.0')

# seems to be broken with `main` not being default branch
# pkgver() {
#     cd "$pkgname"
#     git describe --tags --abbrev=0 main | tr '-' '_'
# }
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-setuptools
)
depends=(
    python
    opencv
    python-pytorch
    python-numpy
    python-opencv
    python-pillow
    python-onnx
    python-onnxscript
    python-tqdm
)
optdepends=(
    'python-pytorch-opt: with AVX2 CPU optimizations for training'
    'python-pytorch-cuda: with CUDA for training'
    'python-pytorch-opt-cuda: with CUDA and AVX2 CPU optimizations for training'
    'python-pytorch-rocm: with ROCm for training'
    'python-pytorch-opt-rocm: with ROCm and AVX2 CPU optimizations for training'
)
source=(
    "${pkgname}::git+${url}.git#tag=${pkgver//_/-}"
    "babbletrainer.sh"
    "LICENSE"
)
sha256sums=('SKIP'
            '4e5e9a3f5131edb30c3e5b95cb43ed652a2cceb1af841909c3eba981075f3280'
            '88bec1dde0ff33748c5fe396905e8db3ca7f6c6788c27b070147d18d5af94c99')
build() {
    cd "${pkgname}/babble_data"
    python -m build --wheel --no-isolation
}
package() {
    cd "${pkgname}"
    python -m installer --destdir="$pkgdir" babble_data/dist/*.whl
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "${srcdir}/${pkgname}/"*.py "${pkgdir}/opt/${pkgname}/"
    install -Dm755 "${srcdir}/babbletrainer.sh" "${pkgdir}/opt/${pkgname}/babbletrainer.sh"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
