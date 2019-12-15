# Maintainer: JunYoung Gwak <aur@jgwak.com>

pkgname=python-minkowskiengine
_pkgname=MinkowskiEngine
pkgver=0.3.0
pkgrel=1
pkgdesc="Auto-diff library for generalized sparse convolutions"
url="https://github.com/StanfordVL/MinkowskiEngine"
depends=('python' 'python-pytorch-cuda' 'python-numpy' 'cuda' 'cudnn' 'cblas' 'intel-tbb')
optdepends=(
    'python-torchvision: Sample code dependency'
)
makedepends=('python-setuptools')
license=('MIT')
arch=('x86_64')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('7a5b1cfae709937b86c844d8ce6b340ff3fc2fc044d495099f16b4e592180da071122ed5fb87a662dbb78ef1c7af9887312a66a77630e8b1402f96770668073b')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    export CUDA_HOME=/opt/cuda
    # Use cblas, which is included in the community package.
    # You may comment or change the following two lines to use other blas.
    sed -i "s/BLAS := open/BLAS := cblas/g" Makefile
    sed -i "s/openblas/cblas/g" setup.py
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    # Build isolation doesn't work in this library.
    python setup.py install --root="$pkgdir/" --optimize=1
}
