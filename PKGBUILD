# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=python-fmf
_pkg="${pkgname#python-}"
pkgver=1.2.1
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
sha256sums=('f176f8b1ef0c1e5ac5e924728dae4fc9887672e036ffb94b4a6fcf05c4856b05')

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
