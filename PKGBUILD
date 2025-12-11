# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bitsandbytes
_name=${pkgname#python-}
pkgver=0.49.0
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
sha256sums=('6ca6c8f32dcdf05a602a22d12885282683b25f2d7b85b1252f5f51467d617dd8')

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
