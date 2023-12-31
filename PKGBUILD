# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >
# Maintainer: daskol (Daniel Bershatsky) < bepshatsky at yandex dot ru >

pkgname='python-datasets'
pkgver=2.16.1
pkgrel=1
pkgdesc='The largest hub of ready-to-use datasets for ML models with fast, easy-to-use and efficient data manipulation tools'
arch=('x86_64')
url='https://github.com/huggingface/datasets'
license=('Apache')
depends=(
    'python-aiohttp'
    'python-dill'
    'python-fsspec>=2023.9.0'
    'python-huggingface-hub>=0.20.0'
    'python-multiprocess'
    'python-numpy'
    'python-packaging'
    'python-pandas'
    'python-pyarrow>=14.0.1'
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
        'python-datasets.diff')
sha256sums=('3eb90a9eae27f00c3c2256d0a81ca27cd5f81e9e584e7b4ad09bb8fd24c9f460'
            'SKIP')

prepare() {
    cd ${srcdir}/datasets-${pkgver}
    patch -p1 -i ../python-datasets.diff
}

build() {
    python -m build -nw ${srcdir}/datasets-${pkgver}
}

check() {
    # Sanity check: import package.
    cd ${srcdir}/datasets-${pkgver}/src
    python -c "import datasets"
}

package() {
    cd ${srcdir}/datasets-${pkgver}
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --compile-bytecode 1 --destdir $pkgdir dist/*.whl
}
