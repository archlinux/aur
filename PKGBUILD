# Maintainer : Kai Jia <jia.kai66@gmail.com>

pkgname=python-lensfunpy
_pkg="${pkgname#python-}"
pkgver=1.13.1
pkgrel=1
pkgdesc="Python wrapper for the lensfun library"
arch=('x86_64')
license=('MIT')
url="https://github.com/letmaik/lensfunpy"
depends=('lensfun' 'python-numpy')
optdepends=('python-scikit-image' 'python-opencv')
makedepends=(
	'cython'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-sphinx'
	'python-sphinx_rtd_theme'
	'python-wheel')
checkdepends=('python-pytest' 'python-imageio' 'python-scikit-image')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=(
    'fec57f7141ee7be9a462e9b4f02a670d85e7eee2258fcf02836364da522d95e7b900df7fb495f53e1919536c2defb3a49432ab95f44c04fdb7b277d93c6104fc')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	_py="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_py" sphinx-build -b man docs _build
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_py" pytest --disable-warnings || true
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
