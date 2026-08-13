# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-smda
pkgver=4.4.7
pkgrel=1
pkgdesc="Recursive diassembler optimized for CFG recovery from memory dumps"
arch=(any)
url="https://github.com/danielplohmann/smda"
license=(BSD-2-Clause)
depends=(python python-capstone python-dncil python-dnfile lief)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/smda/smda-$pkgver.tar.gz")
sha256sums=('e4369270cac2bd6029d72fdc7fce2c9d33073077698eebeff325acdc49a38b9f')

prepare() {
    cd "smda-$pkgver"
    sed -i '/requires =/c\requires = ["setuptools", "wheel"]' pyproject.toml
}

build() {
    cd "smda-$pkgver"
    python -m build --wheel --no-isolation
}

## check()
# Upstream does not provide test data in their wheel packages. The only way
# to get them is to grab it from GitHub, but they don't provide releases
# there either.

package() {
    cd "smda-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site/smda-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
