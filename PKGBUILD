# Maintainer: Skylar Chan <schance995 at proton dot me>
_pkgname=pennylane
pkgname=python-${_pkgname}
pkgver='0.39.0'
pkgrel=1
pkgdesc="Python library for quantum computing, quantum machine learning, and quantum chemistry."
url="https://github.com/PennyLaneAI/pennylane"
arch=(any)
license=(Apache-2.0)
depends=(
    python-numpy
    python-scipy
    python-networkx
    python-rustworkx
    python-autograd
    python-toml
    python-appdirs
    python-autoray
    python-cachetools
    python-requests
    python-typing_extensions
    python-packaging
)
makedepends=(
    python-build
    python-installer
    python-wheel
)
checkdepends=(
    python-pytest
    python-pytest-benchmark
    python-pytest-cov
    python-pytest-mock
    python-pytest-xdist
    python-pytest-split
    python-flaky
    python-tensorflow
    # python-pytorch
    # python-jax
)
optdepends=(
    'python-tensorflow: tensorflow backend'
    'python-pytorch: pytorch backend'
    'python-jax: jax backend'
    # 'python-pennylane-lightning-qubit: lightning.qubit device'
    # 'python-quimb: default.tensor device'
)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b1d5b6a5e541fe0bfe1014670213f9e7ec906c9ffdd41717bab449d54ff64bab')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

# The full test suite require several extra dependencies
# Instead test the standard devices available
check() {
    cd "${_pkgname}-${pkgver}"
    # pytest -v tests -rxXs
    pl-device-test --device default.qubit
    pl-device-test --device default.mixed
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
    install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
