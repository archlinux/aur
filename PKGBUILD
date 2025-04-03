# Maintainer: redponike <proton (dot) me>
# Contributor: xantares

pkgname=python-anyqt
_pkgname=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="PyQt/PySide compatibility layer (PyQt4/PyQt5/PyQt6/PySide/PySide2)"
url="https://github.com/ales-erjavec/anyqt"
arch=('any')
license=('GPL-3.0')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python-pyqt5')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('a9ed7c5169691a105ef2cea9114d6f8d439875b807d7258a2107f55cb56483f6')

build() {
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_pkgname-$pkgver
    # Create the virtual environment
    python -m venv --system-site-packages test-env
    source test-env/bin/activate
    
    # Install the wheel we just built
    test-env/bin/pip install dist/*.whl
    
    # Run tests in a an isolated directory outside the source tree
    _temp_dir=$(mktemp -d)
    cp -r "${srcdir}/${_pkgname}-${pkgver}/tests" "$_temp_dir/"
    cd "$_temp_dir/tests"
    
    # Force offscreen so that checks pass in a headless clean chroot as well
    QT_QPA_PLATFORM="offscreen" PYTHONPATH="$_temp_dir/tests" python -m pytest -vv --import-mode=importlib --ignore=devel/external .
    
    # Cleanup
    cd ../..
    rm -rf "$_temp_dir"
    deactivate
}

package() {
    cd $_pkgname-$pkgver
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: set ts=4 sw=4 et:
