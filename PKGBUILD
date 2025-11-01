# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bitsandbytes
_name=${pkgname#python-}
pkgver=0.48.2
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
    gcc-libs
    glibc
    python
    python-numpy
    python-scipy
    python-packaging
    python-pytorch
    python-triton
    python-trove-classifiers
    python-typing_extensions
    # AUR
    python-pynvml
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
)
optdepends=()
options=('!strip')
source=("${_name}::git+${url}.git#tag=$pkgver")
noextract=()
sha256sums=('f14a72982c1983fc46a92badeec2ea892b0f7805fc3545881d7cb4d20c3c0bf0')

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
