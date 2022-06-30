# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-daft
_pkg="${pkgname#python-}"
pkgver=0.1.2
pkgrel=3
pkgdesc="Render probabilistic graphical models using matplotlib"
arch=('any')
url='https://github.com/daft-dev/daft'
license=('MIT')
depends=('python-numpy' 'python-matplotlib')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
	'python-wheel'
	# 'python-sphinx'
	# 'python-myst-nb'
	# 'python-myst-parser'
	# 'python-jupytext'
)
checkdepends=('python-pytest')
changelog=HISTORY.rst
# source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ab1873bd2409d7ca88f88a9534d9c82b1f0885e7d5c018bf33e0a9c8228c7282')

build() {
	cd "$_pkg-$pkgver"
	SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
	## FIXME: requires python-myst-parser=0.18
	# PYTHONPATH="$PWD" make -C docs man
}

## examples fail with Arch's python-matplotlib; exclude them
check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD" pytest -x --disable-warnings test/test_daft.py
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/daft-$pkgver.dist-info/LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
