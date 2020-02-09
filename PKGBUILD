# Maintainer: JunYoung Gwak <aur@jgwak.com>

pkgname=python-minkowskiengine
_pkgname=MinkowskiEngine
pkgver=0.4.1
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
sha512sums=('50b5b6eada91f1735eae844ac8178abf9f851e7c83de4fc0a5e33d16621d5a3e450561386f5d28e28490d3fdd975050987155738bcbd24909686db4e88a85557')

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
