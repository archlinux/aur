# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-daft
pkgver=0.1.2
pkgrel=2
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
	# 'python-jupytext'
)
checkdepends=('python-pytest')
changelog=HISTORY.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/d/daft/daft-$pkgver.tar.gz")
sha256sums=('3e77e0389ca539a5741a906bcdcaae462b68261d06b960b0c04498b695d312e5')

build() {
	cd "daft-$pkgver"
	python -m build --wheel --no-isolation
}

## examples fail with Arch's python-matplotlib; exclude them
check() {
	cd "daft-$pkgver"
	PYTHONPATH="$PWD" pytest -x --disable-warnings test/test_daft.py
}

package() {
	export PYTHONHASHSEED=0
	cd "daft-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/daft-$pkgver.dist-info/LICENSE.rst" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
