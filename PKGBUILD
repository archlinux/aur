# Maintainer: Nicholas Wilkins <nickwilkins5757@gmail.com>
pkgname=gladiator
pkgver=0.1.0
pkgrel=1
pkgdesc="Evolutionary chess engine trainer with CPU heuristic and neural network variants"
arch=('any')
url="https://github.com/Nicholas-Wilkins/Gladiator"
license=('MIT')
depends=(
    'python>=3.11'
    'python-chess'
    'python-numpy'
    'python-rich'
    'python-textual'
)
optdepends=(
    'python-pytorch: required for the NN engine (GPU users: run install.py instead)'
    'cuda: NVIDIA GPU acceleration'
    'rocm-core: AMD GPU acceleration'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nicholas-Wilkins/Gladiator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('20c5838f604f3f2ae55c515655fd16d4b0ccc1bb364b155aa9b033b2a0aa71be')

build() {
    cd "Gladiator-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "Gladiator-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install the data directory (default DB location, example configs)
    install -d "$pkgdir/usr/share/$pkgname"

    # install.py for GPU-specific torch setup
    install -Dm755 install.py "$pkgdir/usr/share/$pkgname/install.py"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
