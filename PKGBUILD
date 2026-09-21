# Maintainer: Smoolak <smoolak@gmail.com>

_pkgname=udapi
pkgname="python-${_pkgname}"
pkgver=0.5.2
pkgrel=2
pkgdesc="Python framework for processing Universal Dependencies data"
arch=('any')
url="https://github.com/udapi/udapi-python"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-colorama'
    'python-regex'
    'python-termcolor'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
)
_archive="udapi-python-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7b8f21bfed3bc62a576838251c210ff9de0623c0c51bcee19a3090579c04e947')

build() {
    cd "$_archive"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_archive"
    local _checkroot="$srcdir/_check" _site
    rm -rf "$_checkroot"
    python -m installer --destdir="$_checkroot" dist/*.whl
    _site=$(python -c 'import site; print(site.getsitepackages()[0])')
    cp -a udapi/core/tests "$_checkroot/tests"
    mkdir -p "$_checkroot$_site/udapi/core/tests"
    cp -a udapi/core/tests/data "$_checkroot$_site/udapi/core/tests/"

    # Run the complete upstream core suite against the staged wheel.
    cd "$_checkroot"
    PYTHONPATH="$_checkroot$_site" pytest -ra --import-mode=importlib \
        tests

    # Upstream's CLI round-trip regression script is kept separately from
    # pytest. It parses and serializes real CoNLL-U trees byte-for-byte.
    cd "$_checkroot/tests"
    PATH="$_checkroot/usr/bin:$PATH" PYTHONPATH="$_checkroot$_site" \
        bash external_tests.sh
}

package() {
    cd "$_archive"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # Upstream's broad package discovery includes its Sphinx configuration as
    # a generic top-level `docs` Python package. It is not part of Udapi's API
    # and conflicts with other Python projects making the same mistake.
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/docs
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
