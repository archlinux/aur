# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=pdbufr
pkgname=python-${_name}
pkgver=0.16.0
pkgrel=1
pkgdesc="High-level BUFR interface for ecCodes"
arch=(any)
url=https://github.com/earthobservations/wetterdienst
license=(Apache-2.0)
depends=(
    python-attrs
    python-eccodes
    python-pandas
    python-pint
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-setuptools-scm
)
checkdepends=(
    python-pytest
    python-requests
)
source=($_name::git+https://github.com/ecmwf/$_name.git#tag=$pkgver)
b2sums=('283dc6c7083889df45b1dec974cd40826d8bef04700710340e5f2247478b6c68bdcb3d814eae948e6a6d8b28548473ad3cd2e2f793e3b07b31cd1fa948fc0d09')

build() {
    cd $_name
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf src
    test-env/bin/python -P -m pytest -o addopts=""
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
