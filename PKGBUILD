# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-bugsnag
pkgver=4.9.2
pkgrel=2
pkgdesc='Automatic error monitoring for Django, Flask, Tornado, and more'
arch=(any)
url='https://github.com/bugsnag/bugsnag-python'
license=(MIT)
depends=(python-webob)
optdepends=(
    'python-flask: Flask integration'
    'python-blinker: Flask integration')
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(
    python-bottle
    python-blinker
    python-django
    python-httpx
    python-pytest
    python-starlette
    python-typing_extensions
    python-webtest
)
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a1bb7c1abaa0981ae390a6889c3038ce58652e10d80dd7dbc24bf7417c18ba93')

build() {
    cd "bugsnag-python-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "bugsnag-python-$pkgver"
    pytest -x --ignore=tests/integrations -o addopts=""
}

package() {
    cd "bugsnag-python-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s \
        "$_site/bugsnag-$pkgver.dist-info/licenses/LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
