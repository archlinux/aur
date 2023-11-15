# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >
# Maintainer: daskol (Daniel Bershatsky) < bepshatsky at yandex dot ru >

pkgname='python-datasets'
pkgver=2.14.7
pkgrel=1
pkgdesc='The largest hub of ready-to-use datasets for ML models with fast, easy-to-use and efficient data manipulation tools'
arch=('x86_64')
url='https://github.com/huggingface/datasets'
license=('Apache')
depends=(
    'python-aiohttp'
    'python-dill'
    'python-fsspec>=2023.9.0'
    'python-huggingface-hub'
    'python-multiprocess'
    'python-numpy'
    'python-packaging'
    'python-pandas'
    'python-pyarrow'
    'python-yaml'
    'python-requests'
    'python-tqdm'
    'python-xxhash'
)
makedepends=('python-build' 'python-hatchling' 'python-installer'
             'python-setuptools' 'python-wheel')
optdepends=(
    'python-librosa: Audio datasets'
    'python-pillow: Vision datasets'
    'python-tensorflow: TensorFlow support'
    'python-pytorch: PyTorch support'
)
groups=('huggingface')
source=("datasets-${pkgver}.tar.gz::https://github.com/huggingface/datasets/archive/refs/tags/${pkgver}.tar.gz"
        'pyarrow-hotfix-0.5.tar.gz::https://github.com/pitrou/pyarrow-hotfix/archive/refs/tags/v0.5.tar.gz')
sha256sums=('f3fb38bb48c3f8f0688089460e3ac7302fcbbad192cfe09cac714ba5c061b4c5'
            '0a2de981b1c3dba5b76360d9b77206c928103ca6d909c4ba436fbb68a8bb3825')

build() {
    python -m build -nw ${srcdir}/pyarrow-hotfix-0.5
    python -m build -nw ${srcdir}/datasets-${pkgver}
}

package() {
    cd ${srcdir}/pyarrow-hotfix-0.5
    python -m installer --compile-bytecode 1 --destdir $pkgdir dist/*.whl

    cd ${srcdir}/datasets-${pkgver}
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --compile-bytecode 1 --destdir $pkgdir dist/*.whl
}
