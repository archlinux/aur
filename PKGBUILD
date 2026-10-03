# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname=python-loro
_name=${pkgname#python-}
pkgver=1.16.2
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
b2sums=('83fee272d9e3b0a4578ebd82bfdeb69a5da91f2e7e7e9d718cc0db43e01898a395849924bc9ff1612182f37c608523fd17d31fe5a505ecf06402cbdfb96d50e2')


build() {
    cd "$_name-py-$pkgver" || exit

    rm -rf ./dist # Delete old dist folder if exist
    maturin build -i /usr/bin/python --release -o dist
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
