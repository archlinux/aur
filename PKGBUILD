# Maintainer: Maks Verver <maksverver@geocities.com>

pkgname=python-fairscale
pkgver=0.4.13
pkgrel=2
pkgdesc='PyTorch extensions for high performance and large scale training.'
arch=('any')
url='https://github.com/facebookresearch/fairscale'
license=('BSD')
source=(
    "fairscale-$pkgver.tar.gz::https://github.com/facebookresearch/fairscale/archive/refs/tags/v$pkgver.tar.gz"
    'test_single_node_adascale.patch'
    'test-failures-caused-by-warns-None.patch'
    'failure-in-test_checkpoint_activations_norm.py.patch'
)
sha512sums=('e80793c55629c04205651ab16b6d86bf5a264eaafd45a6789504fe77e53d88419fb46ad722dc505a26e078fb57f22ca9da3d45a2615295b157c27de14bc561cd'
            '477e29a756a5b6dcc1decb8f3e170e5f8ea8925eeab6719c5ae095ebf0a05bcc1eefce105ef76182d62305f308ba00b01f96fc9e0ae7c576fcd1b87d97c7e66c'
            '8afd176a85a4164b4f576c3c8e7c6d3124085d0f75a2e0f8170f42424b0bcbeaf1c87554aa298247196dd300ed458551cb4849c23005faf0b1d760dbee551d1e'
            'fe6b8ddf1e1c28572eb4de907522ebf0c0fab95ae12b8dd34cf4f4b3b14d9e91df95ffac976c2f5d21455a41852349ca0ca27a7d1272e97e229bbca5ac712507')
makedepends=(
    'python-parameterized'
    'python-pip'
    'python-setuptools'
    'python-scikit-learn'
)
depends=(
    'python-importlib-metadata'
    'python-numpy'
    'python-pytest'
    'python-pytorch'
    'python-torchvision'
)
optdepends=(
    'python-pgzip: experimental wgit support'
    'python-pygit2: experimental wgit support'
)

prepare() {
    cd fairscale-$pkgver
    patch --forward --strip=1 --input="${srcdir}/test_single_node_adascale.patch"
    patch --forward --strip=1 --input="${srcdir}/test-failures-caused-by-warns-None.patch"
    patch --forward --strip=1 --input="${srcdir}/failure-in-test_checkpoint_activations_norm.py.patch"
}

build() {
    cd fairscale-$pkgver
    python setup.py build
}

check() {
    cd fairscale-$pkgver

    # wgit requires python-pgzip, which doesn't work with Python >= 3.12.
    pytest --ignore tests/experimental/wgit
}

package() {
    cd fairscale-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
