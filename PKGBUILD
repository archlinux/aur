# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-ax-platform
_pkg=ax_platform
pkgver=1.1.1
pkgrel=1
pkgdesc='Adaptive Experimentation Platform'
arch=('any')
url='https://github.com/facebook/ax'
license=('MIT')
depends=(
	'ipython'
	'python'
	'python-botorch'
	'python-gpytorch'
	'python-jinja'
	'python-markdown'
	'python-numpy'
	'python-pandas'
	'python-plotly'
	'python-pyre_extensions'
	'python-pyro-ppl'
	'python-pytorch'
	'python-scikit-learn'
	'python-scipy'
	'python-sympy'
	'python-typing_extensions'
	'python-yaml')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
	'python-sphinx'
	'python-sphinx_rtd_theme'
	'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('683f09cda8ec1406c562e1acb4e73057262c5c7f78a9bc834904a7e9d456f70d')

build() {
	cd "$_pkg-$pkgver"
	SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
	make -C sphinx man
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 sphinx/build/man/ax.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/${_pkg/-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
