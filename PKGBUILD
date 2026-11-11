# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkgname=srsly
pkgname=python-${_pkgname}
pkgver=3.0.1
pkgrel=1
pkgdesc='Modern high-performance serialization utilities for Python'
arch=('any')
url='https://github.com/explosion/srsly'
license=('MIT')
# install_requires caps ujson <6 and ruamel.yaml <1; Arch ships newer versions
# of both, so check() is what holds the shipped combination honest.
depends=('python' 'python-cloudpickle' 'python-msgpack' 'python-ruamel-yaml' 'python-ujson')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-numpy' 'python-pytest')
optdepends=('python-numpy: numpy array support in msgpack')
# Upstream tagged releases release-vX.Y.Z up to 2.5.5 and vX.Y.Z from 3.0.0.
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('304f6b2b0338666e69c5c79e786e7a79994e38bc37ea1ff6146c28517cf82a10')

latestver() {
    curl -fsSL 'https://api.github.com/repos/explosion/srsly/releases/latest' |
    jq -r '.tag_name // empty' | sed -E 's/^(release-)?v//'
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}-${pkgver}"
    python -m pytest srsly/tests -q
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    # MANIFEST.in's `recursive-include srsly *.py` puts the test suite into the
    # wheel as package data regardless of find_packages(); it is build input
    # only, and shipping it advertises pytest as a runtime dependency.
    rm -rf "${pkgdir}/usr/lib/python"*/site-packages/srsly/tests
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
