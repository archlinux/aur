# Maintainer: Kai Jia <jia.kai66@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Simone Riva <simone.rva@gmail.com>

pkgname=python-rawpy
_pkg="${pkgname#python-}"
pkgver=0.28.0
pkgrel=1
pkgdesc="Python wrapper for the libraw library"
arch=('x86_64')
license=('MIT')
url="https://github.com/letmaik/rawpy"
depends=('libraw' 'python-numpy')
optdepends=(
    'python-scikit-image: for rawpy.enhance'
    'python-opencv: for rawpy.enhance'
)
makedepends=(
    'cython'
    'cmake'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-sphinx'
    'python-sphinx_rtd_theme'
    'python-wheel')
checkdepends=('python-pytest' 'python-imageio' 'python-opencv')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=(
    'b943936e6698dec2c411fdd86bf37163bb34604ceaef74600603e29ed302c618ae69c1bebf70a9422e584b581b754fd78f3ace52cc68c6ec2cfe8e1afe339ab7')

build() {
    cd "$_pkg-$pkgver"
    RAWPY_USE_SYSTEM_LIBRAW=1 python -m build --wheel --no-isolation --skip-dependency-check
    _py="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_py" sphinx-build -b man docs _build
}

check() {
    cd "$_pkg-$pkgver"
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_py" \
        pytest --disable-warnings || true
}

package() {
    cd "$_pkg-$pkgver"
    PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ft=sh
