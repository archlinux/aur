# Maintainer: Kai Jia <jia.kai66@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Simone Riva <simone.rva@gmail.com>

pkgname=python-rawpy
_pkg="${pkgname#python-}"
pkgver=0.18.1
pkgrel=1
pkgdesc="Python wrapper for the libraw library"
arch=('x86_64')
license=('MIT')
url="https://github.com/letmaik/rawpy"
depends=('libraw' 'python-numpy')
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
sha256sums=('a2d9b50697dc0bffc741d92c70dcf3b7ef3bdd4815b37a8377040b6ed21239e9')

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
}

# vim: ft=sh
