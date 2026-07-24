# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-liboqs
_name=liboqs-python
pkgver=0.16.0
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
source=($_name::git+https://github.com/open-quantum-safe/$_name.git#commit=35eceb69d2b363cb0421085cf1ae1c682dee1acc)
b2sums=('2bb2ae70ffbba0c916e19fa166ddc3c6a2946ef5e94802a48ad6fab2f90efce2f0c7a0ff30f1cdf6627efbd9560a280e792028d2a971de01a2de710a8c1626f9')

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
