# Maintainer: getzze <getzze at gmail dot com>

pkgname=python-bump-my-version
_name=$( echo ${pkgname#python-} | tr '-' '_' )
pkgver=1.0.2
pkgrel=1
pkgdesc='A small command line tool to simplify releasing software by updating all version strings'
arch=(any)
url=https://github.com/callowayproject/bump-my-version
license=(MIT)
depends=(
    python
    python-click
    python-pydantic
    python-pydantic-settings
    python-questionary
    python-rich
    python-rich-click
    python-tomlkit
    python-wcmatch
    python-httpx
)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest python-uv python-freezegun python-pytest-localserver python-pytest-mock python-pytest-xdist)
source=(https://github.com/callowayproject/bump-my-version/releases/download/${pkgver}/${_name}-${pkgver}.tar.gz)
sha256sums=('2f156877d2cdcda69afcb257ae4564c26e70f2fd5e5b15f2c7f26ab9e91502da')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"

    # Use pytest-xdist to speed up the tests, although it is not used upstream
    uv run pytest --no-cov -n auto tests/
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
