# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname=python-loro
_name=${pkgname#python-}
pkgver=1.10.3
pkgrel=2
pkgdesc="Python bindings for Loro CRDT"
arch=(any)
url='https://github.com/loro-dev/loro-py'
license=('MIT')
options=(!debug)

makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatch'

    'python-maturin'
)

checkdepends=(
    'python-pytest'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/loro-dev/loro-py/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9d1adfc3c6e678b3b1a3ec86c4e1f40d06e026bc9c9375ff3f94eb47fbacb319')


build() {
    cd "$_name-py-$pkgver" || exit
    maturin build --find-interpreter --release -o dist
}

check() {
    # Delete old venv
    rm -rf test_venv

    # Prepare test env
    python -m venv --system-site-packages test_venv
    test_venv/bin/python -m installer "$_name-py-$pkgver/dist/"*.whl

    # Test
    test_venv/bin/python -m pytest "$_name-py-$pkgver/tests"
}

package() {
    cd "$_name-py-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
