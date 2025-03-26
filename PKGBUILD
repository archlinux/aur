# Maintainer: redponike <proton dot me>

pkgname=python-highspy
_pkgname=${pkgname#python-}
pkgver=1.10.0
pkgrel=1
pkgdesc="Thin python wrapper to HiGHS, a linear optimization software"
arch=('any')
url="https://www.highs.dev"
license=('MIT')
depends=('python>=3.8' 'python-numpy')
makedepends=('cmake' 'ninja' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('65f9e0ea6dbe7256b790570c4f6b908b3f734cbc8cf5b2d5ebeadb28a4fe2486')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"

    # Create a virtual environment - the tests need to import highspy
    python -m venv --system-site-packages test-env
    source test-env/bin/activate

    # Install the wheel we just built
    test-env/bin/pip install dist/*.whl

    # Run tests in a an isolated directory outside the source tree
    _temp_dir=$(mktemp -d)

    # Copy the tests directory
    cp -r "${srcdir}/${_pkgname}-${pkgver}/tests" "$_temp_dir/"
    cd "$_temp_dir/tests"

    # Now run the tests in the isolated env
    PYTHONPATH="$_temp_dir/tests" python -m pytest -vv --import-mode=importlib .

    # Cleanup
    cd ../..
    rm -rf "$_temp_dir"
    deactivate

}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
