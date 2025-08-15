# Maintainer: getzze <getzze at gmail dot com>

pkgname=python-bump-my-version
_name=$( echo ${pkgname#python-} | tr '-' '_' )
pkgver=1.2.1
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
makedepends=(python-build python-installer python-wheel python-hatch)
checkdepends=(
    git
    mercurial
    python-pytest
    python-uv
    python-freezegun
    python-pytest-cov
    python-pytest-localserver
    python-pytest-mock
    python-pytest-xdist
)
source=(https://github.com/callowayproject/bump-my-version/releases/download/${pkgver}/${_name}-${pkgver}.tar.gz)
sha256sums=('96c48f880c149c299312f983d06b50e0277ffc566e64797bf3a6c240bce2dfcc')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"

    # Use pytest-xdist to speed up the tests, although it is not used upstream
    GIT_AUTHOR_NAME="Your Name" EMAIL="you@example.com" uv run pytest --no-cov -n auto tests/
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

}
