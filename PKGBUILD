# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Martin Diehl <https://martin-diehl.net>

pkgname=python-chaospy
pkgver=4.3.7
pkgrel=1
pkgdesc="Toolbox for performing uncertainty quantification"
arch=('any')
url="https://github.com/jonathf/chaospy"
license=('BSD')
depends=('python-numpoly' 'python-numpy' 'python-scipy')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
	'python-setuptools-scm-git-archive'
	'python-wheel')
checkdepends=('python-pytest' 'python-scikit-learn')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('07a419fafacc6bba463cb04e69087f43535c2f929022a9d7a9df46e63dd1a8f3')

build() {
	cd "chaospy-$pkgver"
	SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
	## FIXME: man pages require additional sphinx dependencies
	# PYTHONPATH="$PWD" make -C docs man
}

check() {
	cd "chaospy-$pkgver"
	pytest -x --disable-warnings
}

package() {
	export PYTHONHASHSEED=0
	cd "chaospy-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/chaospy-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
