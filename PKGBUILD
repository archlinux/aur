# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-smda
pkgver=4.6.0
pkgrel=1
pkgdesc="Recursive diassembler optimized for CFG recovery from memory dumps"
arch=(any)
url="https://github.com/danielplohmann/smda"
license=(BSD-2-Clause)
depends=(python python-capstone python-dncil python-dnfile python-purepdb python-pycxxfilt lief)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-hypothesis python-pytest python-tqdm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c42bc6010407c00885c21b9047f2dbe5273332c7dfe5f19e8e2e76db8f7b570d')

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
    test-env/bin/python -P -m pytest -x
}

package() {
    cd "smda-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site/smda-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
