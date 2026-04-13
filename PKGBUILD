# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pyetrade
_pkg="${pkgname#python-}"
pkgver=2.2.0
pkgrel=1
pkgdesc="Python E-Trade API wrapper"
arch=('any')
url="https://github.com/jessecooper/pyetrade"
license=('GPL-3.0-or-later')
depends=(
	'python-dateutil'
	'python-jxmlease'
	'python-requests'
	'python-requests-oauthlib'
	'python-xmltodict'
    'python-urllib3')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-sphinx' 'python-wheel')
checkdepends=('python-pytest-mock')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1d65860340cdf139db3d96c9d3b6d92d0d6079a66b834be483669d017402f2d1')

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
	ln -sv "$_site/$_pkg-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
