# Maintainer : Kai Jia <jia.kai66@gmail.com>

pkgname=python-lensfunpy
_pkg="${pkgname#python-}"
pkgver=1.13.0
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "fix-test-np-import.patch")
sha512sums=(
    '2ce5cda73b6be0efdd6543d467b959aababdd3fcbc37c5075f5d5109c2274a26894cf298fd4826158fd1eecfccb5b6b1b9cda64efe663655a078ed2ef4e102bd'
    '4eabf53dddbc9d09fe4dd984170992170a9cfa656ee5eff638c6f6bdce2b8d5abc5cf8ea9d2e20408879cb6357d2f438729940e542d38a3462370409e50b890f')

prepare() {
    patch --directory="$_pkg-$pkgver" --forward --strip=1 \
        --input="${srcdir}/fix-test-np-import.patch"
}

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
