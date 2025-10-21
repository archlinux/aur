# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bitsandbytes
_name=${pkgname#python-}
pkgver=0.48.1
pkgrel=3
epoch=
pkgdesc="k-bit optimizers and matrix multiplication routines."
arch=($CARCH)
url="https://github.com/bitsandbytes-foundation/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    gcc-libs
    glibc
    python
    python-numpy
    python-scipy
    python-pytorch
    python-triton
    python-trove-classifiers
    python-typing_extensions
)
makedepends=(
    cmake
    cuda
    git
    python-scikit-build
    python-scikit-build-core
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip')
source=("${_name}::git+${url}.git#tag=$pkgver")
noextract=()
sha256sums=('3e93390e0e6cdff988e6c97bfb3b2f8359eef5daec3aba81358efd2ce32b698e')

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
