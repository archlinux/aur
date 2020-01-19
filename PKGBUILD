# Maintainer: JunYoung Gwak <aur@jgwak.com>

pkgname=python-minkowskiengine
_pkgname=MinkowskiEngine
pkgver=0.3.3
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
sha512sums=('eff585b6e054e52f236bdfd7930abe987a57ca68a737bf81d85e18996132570895460aa02ed496e5e034001a640749bf1322fdfc9848acc7dec555976c47f995')

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
