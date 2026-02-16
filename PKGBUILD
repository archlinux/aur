# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bitsandbytes
_name=${pkgname#python-}
pkgver=0.49.2
pkgrel=1
epoch=
pkgdesc="k-bit optimizers and matrix multiplication routines."
arch=($CARCH)
url="https://github.com/bitsandbytes-foundation/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    cuda
    glibc
    libgcc
    libgomp
    libstdc++
    python
    python-numpy
    python-scipy
    python-packaging
    python-pytorch
    python-triton
    python-typing_extensions
    # AUR
    python-nvidia-ml-py
)
makedepends=(
    cmake
    git
    python-scikit-build
    python-scikit-build-core
    python-build
    python-installer
    python-wheel
    python-setuptools
    python-trove-classifiers
)
optdepends=()
options=('!strip')
source=("${_name}::git+${url}.git#tag=$pkgver")
noextract=()
sha256sums=('702bddb7a5f6c6fbe7ac214453e2f8ab78117fc1c44ff95e7de86c37f4e8e528')

build() {
    cd "${srcdir}/${_name}"
    cmake -DCOMPUTE_BACKEND=cuda -S .
    make
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
