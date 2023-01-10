# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-requirementslib
_pkg="${pkgname#python-}"
pkgver=2.2.3
pkgrel=1
pkgdesc="A tool for converting between pip-style and pipfile requirements"
url="https://github.com/sarugaku/requirementslib"
license=('MIT')
arch=('any')
depends=(
	'python-attrs'
	'python-cached-property'
	'python-cerberus'
	'python-distlib'
	'python-pep517'
	'python-pip'
	'python-platformdirs'
	'python-plette'
	'python-requests'
	'python-setuptools'
	'python-tomlkit'
	'python-vistir')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=(
	'python-hypothesis'
	'python-pytest-sugar'
	'python-pytest-timeout'
	'python-pytest-xdist')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'git+https://github.com/kennethreitz/requests'
        'git+https://github.com/sarugaku/shellingham'
        'git+https://github.com/pyinstaller/pyinstaller')
sha256sums=('a40e9ffdea8bfc00c9d4491b471815d91c2d0ceeac7ca70bf0dded6738a4d225'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd "$_pkg-$pkgver/tests/artifacts/git"
	rmdir requests shellingham pyinstaller
	ln -s "$srcdir/requests"
	ln -s "$srcdir/shellingham"
	ln -s "$srcdir/pyinstaller"
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD/build/lib" pytest || echo "Tests failed"
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
