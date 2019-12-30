# Maintainer: JunYoung Gwak <aur@jgwak.com>

pkgname=python-minkowskiengine
_pkgname=MinkowskiEngine
pkgver=0.3.2
pkgrel=1
pkgdesc="Auto-diff library for generalized sparse convolutions"
url="https://github.com/StanfordVL/MinkowskiEngine"
depends=('python' 'python-pytorch-cuda' 'python-numpy' 'cuda' 'cudnn' 'cblas')
optdepends=(
    'python-torchvision: Sample code dependency'
    'python-open3d: Sample code dependency'
)
makedepends=('python-setuptools')
license=('MIT')
arch=('x86_64')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('95560dd215c75c5a127ce250d1a1fde81059d10d89955ac91d80e8b176338e93db8ff3d6c1dc705e175c4aedb248fcc4fcd26f7cdc43eba63877838c2675f1d8')

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
