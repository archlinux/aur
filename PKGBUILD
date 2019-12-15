# Maintainer: JunYoung Gwak <aur@jgwak.com>

pkgname=python-minkowskiengine-git
_pkgname=MinkowskiEngine
pkgver=r188.e260dc4
pkgrel=1
pkgdesc="Auto-diff library for generalized sparse convolutions"
url="https://github.com/StanfordVL/MinkowskiEngine"
depends=('python' 'python-pytorch-cuda' 'python-numpy' 'cuda' 'cudnn' 'cblas' 'intel-tbb')
optdepends=(
    'python-torchvision: Sample code dependency'
)
makedepends=('python-setuptools' 'git')
license=('MIT')
arch=('x86_64')
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')
provides=('python-minkowskiengine')
conflicts=('python-minkowskiengine')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    export CUDA_HOME=/opt/cuda
    # Use cblas, which is included in the community package.
    # You may comment or change the following two lines to use other blas.
    sed -i "s/BLAS := open/BLAS := cblas/g" Makefile
    sed -i "s/openblas/cblas/g" setup.py
}

package() {
    cd "${srcdir}/${_pkgname}"
    # Build isolation doesn't work in this library.
    python setup.py install --root="$pkgdir/" --optimize=1
}
