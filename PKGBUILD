# Maintainer: JunYoung Gwak <aur@jgwak.com>

pkgname=python-minkowskiengine
_pkgname=MinkowskiEngine
pkgver=0.4.2
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
sha512sums=('1dd25bd137a81ca00609346c8223fdc58fd19c31e34b157bfe29bb39690c48e1b3797a53f3e6f1b752da583f4d8ad1db2c18c8b5ad7c4821c5e79385f78e478d')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    export CUDA_HOME=/opt/cuda
    # Use cblas, which is included in the community package.
    # You may comment or change the following two lines to use other blas.
    sed -i "s/openblas/cblas/g" Makefile
    sed -i "s/openblas/cblas/g" setup.py
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    # Build isolation doesn't work in this library.
    python setup.py install --blas=cblas --root="$pkgdir/" --optimize=1
}
