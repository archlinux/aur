# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-enaml
_pkg=enaml
pkgver=0.18.0
pkgrel=1
pkgdesc='Declarative DSL for building rich user interfaces in Python'
arch=('x86_64')
url=https://github.com/nucleic/enaml
license=('BSD')
depends=('python>=3.8' 'python-ply' 'python-atom' 'python-bytecode' 'python-kiwisolver')
makedepends=(
	'python-build'
	'python-cppy'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
	'python-sphinx'
	'python-wheel')
optdepends=('python-pyqt5' 'pyside2' 'python-pyqt6' 'pyside6')
checkdepends=('python-pytest'
              'python-pytest-qt')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/e/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('4c584f7abc0bdf1746c087eb8ea1989e6322da22a7208462fe9579e31690c03e')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '/sphinx.ext.graphviz/d;152d' docs/source/conf.py
        rm tests/core/test_looper.py
        rm tests/core/test_storage.py
        rm tests/core/test_zipimporter.py
        rm tests/test_*.py
        rm -r tests/qt
        rm -r tests/widgets
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	local python_version="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" make -C docs man
}

check() {
	cd "$_pkg-$pkgver"
	local python_version="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 docs/build/man/enaml.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
