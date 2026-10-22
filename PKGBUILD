# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-smda
pkgver=5.0.1
pkgrel=1
pkgdesc="Recursive diassembler optimized for CFG recovery from memory dumps"
arch=(any)
url="https://github.com/danielplohmann/smda"
license=(BSD-2-Clause)
depends=(
    python
    python-capstone
    python-demangle
    python-dncil
    python-dnfile
    python-purepdb
    python-pycxxfilt
    lief
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
checkdepends=(
    python-hypothesis
    python-pytest
    python-tqdm
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e4cb9173d45b57b3647c2f2ead5401ec6601c3d55cd43e94d04dfe7aacd1b2e3')

prepare() {
    cd "smda-$pkgver"
    sed -i '/requires =/c\requires = ["setuptools", "wheel"]' pyproject.toml
}

build() {
    cd "smda-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "smda-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -x -k "not slow and not fuzz"
}

package() {
    cd "smda-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site/smda-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
