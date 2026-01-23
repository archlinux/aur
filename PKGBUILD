# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=twisterl
pkgname=python-$_pkgname
pkgver=0.5.0
pkgrel=2
pkgdesc="PoC of a Reinforcement Learning framework"
arch=(x86_64)
url=https://github.com/AI4quantum/twisteRL
license=(Apache-2.0)
depends=(
    python-huggingface-hub
    python-loguru
    python-numpy
    python-pytorch
    python-safetensors
    tensorboard
)
makedepends=(
    git
    python-build
    python-installer
    python-maturin
)
checkdepends=(
    python-pytest
    python-pytest-mock
)
source=($_pkgname::git+https://github.com/AI4quantum/$_pkgname#tag=$pkgver)
b2sums=('0e09fb9d8de144a620127c5b2d6a20213b9d15353f967ba7be60c90dff54ad942a77726089537739f6b56bbaa71fd4dab851ec1b2f6f0e8681452b155f919a0e')

build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

check() {
    cd $_pkgname
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf src
    test-env/bin/python -P -m pytest -o addopts="" -v tests
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
