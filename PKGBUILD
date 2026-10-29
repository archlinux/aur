# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-liboqs
_name=liboqs-python
pkgver=0.16.0.2
pkgrel=1
pkgdesc="Python 3 bindings for liboqs"
arch=(any)
url=https://github.com/open-quantum-safe/liboqs-python
license=(MIT)
depends=(
    liboqs
    python
)
makedepends=(
    git
    python-build
    python-hatchling
    python-installer
)
checkdepends=(
    python-nose2
    python-pyasn1
    python-pyasn1-alt-modules
)
source=($_name::git+https://github.com/open-quantum-safe/$_name.git#tag=$pkgver)
b2sums=('3f8b2d006c2c091cc01671a99ede1762bc00a728d1171b583dd5206a162b5bff3067f6b06d420dc2c33f8528d099f33b06e22c9f52dd0eafa0597625fdeac246')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    PYOQS_ENABLE_FAULTHANDLER=1 test-env/bin/python -P -m nose2 --verbose
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
