# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-nokap
_pkgname=nokap
pkgver=0.1.0
pkgrel=1
pkgdesc="Capture screenshots and PDFs from web pages using headless Chrome via CDP"
arch=('any')
url="https://github.com/posit-dev/nokap"
license=('MIT')
depends=(
    'python'
    'python-click'
    'python-websockets'
)
optdepends=(
    'python-pillow: image processing helpers'
    'chromium: headless browser backend'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools-scm'
    'python-wheel'
)
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('63071cf5e7c4f0487532f6281c6ea85d90673d5cd835ffe5e64c913989742eb9')

build() {
    cd "$_pkgname-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    # test_integration.py launches a real Chrome instance and calls find_chrome()
    # at import time (fails collection when Chrome is absent), so skip the module.
    # The two deselected tests only pass when a browser is on PATH (they catch
    # RuntimeError, but find_chrome() raises the unrelated ChromeNotFoundError).
    PYTHONPATH=. pytest --ignore=tests/test_integration.py \
        --deselect tests/test_browser.py::test_find_chrome_env_var_missing_file \
        --deselect tests/test_browser.py::test_find_chrome_no_env_var
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
