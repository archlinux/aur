# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: jerry73204 <jerry73204 at google gmail>

pkgname=python-asn1
_pkg="${pkgname#python-}"
pkgver=2.6.0
pkgrel=1
pkgdesc='ASN.1 encoder/decoder'
arch=('any')
url='https://github.com/andrivet/python-asn1'
license=('MIT')
depends=('python-future')
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx'
	'python-sphinx_rtd_theme')
checkdepends=('python-pytest')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b54989be97f9c698fcda64302a0edd452b39f7199d648f7233064e8bde126727')

build() {
	cd "$pkgname-$pkgver"
	export PYTHONPATH="$PWD/src"
	python -m build --wheel --no-isolation
	sphinx-build -b man docs/ docs/_build/man
}

check() {
	cd "$pkgname-$pkgver"
	pytest -x tests
}

package_python-asn1() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 "docs/_build/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
