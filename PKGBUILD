# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bitsandbytes
_name=${pkgname#python-}
pkgver=0.50.2
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
sha256sums=('8d96a4ad50b62516a60389887f0b89e01beec8a85f7133c216ffdd4b138cea9e')

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
