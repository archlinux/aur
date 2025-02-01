# Maintainer : Kai Jia <jia.kai66@gmail.com>

pkgname=python-lensfunpy
_pkg="${pkgname#python-}"
pkgver=1.16.0
pkgrel=1
pkgdesc="Python wrapper for the lensfun library"
arch=('x86_64')
license=('MIT')
url="https://github.com/letmaik/lensfunpy"
depends=('lensfun' 'python-numpy' 'python-scipy')
makedepends=(
    'cython'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-sphinx'
    'python-sphinx_rtd_theme'
    'python-wheel')
optdepends=(
    'python-opencv: faster image remap'
)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=(
    '75b9d006b11f82bec1619b947d170c8b260c37f62f63377603dc5008ebb0c03cac11bb094dd425cb92d59cc7c997f347db880b8f0d9afce4deaf0b9ff4cb8a15')

build() {
    cd "$_pkg-$pkgver"
    python -m build --wheel --no-isolation
    _py="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_py" sphinx-build -b man docs _build
}

check() {
    cd "$_pkg-$pkgver"
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_py" \
        pytest --disable-warnings
}

package() {
    cd "$_pkg-$pkgver"
    PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "_build/lensfunpy.1" "$pkgdir/usr/share/man/man1/lensfunpy.1"
}

# vim: ft=sh
