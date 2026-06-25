# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: coloursofnoise <coloursofthenoise at google mail>

pkgname=python-dnfile
pkgver=0.18.0
pkgrel=1
pkgdesc="Python .NET executable parsing module"
url="https://github.com/malwarefrank/dnfile"
arch=(any)
license=(MIT)
depends=(python python-pefile)
makedepends=(git python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "test-data::git+https://github.com/malwarefrank/dnfile-testfiles")
sha256sums=('a71ad659b97dbd6bec52b0e97e5299986a970aa70b7ad35cd23f07442c05ddfb'
            'SKIP')

prepare() {
    cd "dnfile-$pkgver"
    cp -a "$srcdir/test-data/"* tests/data
}

build() {
    cd "dnfile-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "dnfile-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -x
}

package() {
    cd "dnfile-$pkgver"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site/dnfile-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
