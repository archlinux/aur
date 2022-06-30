# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pgmpy
_pkg="${pkgname#python-}"
pkgver=0.1.19
pkgrel=1
pkgdesc="Probabilistic Graphical Model library"
arch=('any')
url="https://github.com/pgmpy/pgmpy"
license=('MIT')
depends=(
	'python>=3.7'
	'python-joblib'
	'python-networkx'
	'python-numpy'
	'python-pandas'
	'python-pyparsing'
	'python-scipy'
	'python-scikit-learn'
	'python-statsmodels'
	'python-pytorch'
	'python-tqdm')
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx'
	'python-nbsphinx'
	'python-sphinx_rtd_theme')
checkdepends=('python-pytest' 'python-mock' 'python-daft')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8f642f15c478d08fae07ac499531862acea5b2c11ace0dd7a629d2682826a71b')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '/"tests"/s/tests/*tests*/' setup.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	make -C docs man BUILDDIR=_build
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/_build/man/pgmpy.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/pgmpy-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
