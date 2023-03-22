# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pyetrade
_pkg="${pkgname#python-}"
pkgver=1.4.1
pkgrel=1
pkgdesc="Python E-Trade API wrapper"
arch=('any')
url="https://github.com/jessecooper/pyetrade"
license=('GPL3')
depends=(
	'python-dateutil'
	'python-jxmlease'
	'python-requests'
	'python-requests-oauthlib'
	'python-xmltodict')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-sphinx' 'python-wheel')
checkdepends=('python-pytest-runner' 'python-pytest-mock')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f55db6f5545ed105863f237209ebc3be15d658c9416e67a0d76fe47ac8c65ee5')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	make -C docs man
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	install -Dm644 docs/_build/man/pyetrade.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
