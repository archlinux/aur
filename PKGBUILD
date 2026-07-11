# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname=python-loro
_name=${pkgname#python-}
pkgver=1.13.1
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
b2sums=('d41bfe37520be6ff7b4d3124ceea0806b60fa3d0283c17eedbc6a41e885c8a3107635cba164ab753bef253d0fa21455ac903adde85ada64eaa0e6fc4d158efa1')


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
