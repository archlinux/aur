# Maintainer: redponike
# Contributor:: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: GI Jack <GI_Jack@hackermail.com>\

pkgname=python-rich-click
_pkgname=${pkgname#python-}
pkgver=1.8.8
pkgrel=2
pkgdesc="Python module to format click help output nicely with Rich."
arch=('any')
url="https://github.com/ewels/rich-click"
license=('MIT')
depends=(
  python
  python-click
  python-rich
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b07798a0ba49346a143983573faaf8ca349c52a94709f373a0d4617c04943c72')


build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}-${pkgver}"
    
    # Create the virtual environment and install the wheel
    python -m venv --system-site-packages test-env
    source test-env/bin/activate
    test-env/bin/pip install dist/*.whl
    
    # Copy and run the tests
    _temp_dir=$(mktemp -d)
    cp -r "$srcdir/${_pkgname}-${pkgver}/tests" "$_temp_dir/"
    PYTHONPATH="$_temp_dir/tests" python -m pytest -vv --import-mode=importlib --ignore=devel/external .
    
    # Cleanup
    cd ../..
    rm -rf "$_temp_dir"
    deactivate
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
