# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname=python-loro
_name=${pkgname#python-}
pkgver=1.13.2
pkgrel=1
pkgdesc="Python bindings for Loro CRDT"
arch=(any)
url='https://github.com/loro-dev/loro-py'
license=('MIT')
options=(!debug)

makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-maturin'
)

checkdepends=(
    'python-pytest'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/loro-dev/loro-py/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d8a4551e4a87bf00ef90041756d8b1650d668f983b8794e218a215313936b41c2bfbb9ee3841c951be3e18ffe3daf8ac580be46816dd72023278ffef50d8d5a1')


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
