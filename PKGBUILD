# Maintainer : Kai Jia <jia.kai66@gmail.com>

pkgname=python-lensfunpy
_pkg="${pkgname#python-}"
pkgver=1.18.0
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
    '5b2d7befc96fdd3e8267b3fbf9740ecc8b07712b491b3c7b5086b5510e039efdf5ab615f3880a6f6481fc355375fa5181a42e02c1941fa3ec0f20a708ece334c')

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
