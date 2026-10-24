# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: pychuang at pm dot me
# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>

pkgname=globus-cli
pkgver=3.44.0
pkgrel=1
pkgdesc='A command line interface to Globus'
arch=(any)
url='https://github.com/globus/globus-cli'
license=(Apache-2.0)
depends=(
    python
    python-globus-sdk
    python-click
    python-jmespath
    python-packaging
    python-requests
)
makedepends=(
    python-build
    python-flit-core
    python-installer
    python-wheel
)
checkdepends=(
    python-pytest
    python-responses
    python-ruamel-yaml
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('324b9d35e2ececc2ac3a34fc18b5c5b01a1701424edfb285b41df93761271de3')


build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -o addopts="" -k "not test_list_runs_filter_by_flow_id and not test_list_runs_paginated_response"
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir "$pkgdir" dist/*.whl
}
