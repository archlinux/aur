# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=python-fmf
_pkg="${pkgname#python-}"
pkgver=1.2.0
pkgrel=1
arch=('any')
license=('GPL2')
pkgdesc='Flexible Metadata Format'
url='https://github.com/psss/fmf'
depends=('python-filelock' 'python-jsonschema' 'python-ruamel-yaml')
makedepends=('python-build' 'python-docutils' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'git')
provides=("$_pkg")
conflicts=("$_pkg")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('854f0c0044e02f44204ee555912cce9e90ff8c31dbd095fe1414df9bf16c0d47')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation

	local _tmp=$(mktemp -d)
	cp docs/header.txt "$_tmp/man.rst"
	tail -n+7 README.rst >> "$_tmp/man.rst"
	rst2man "$_tmp/man.rst" > fmf.1
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD" pytest -x
}

package_python-fmf() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 fmf.1 -t "$pkgdir/usr/share/man/man1/"
}
