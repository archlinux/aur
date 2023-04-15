# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aditya Sirish <aditya@saky.in>

pkgname=shiv
pkgver=1.0.3
pkgrel=1
pkgdesc="CLI for building self-contained Python zipapps"
arch=('any')
url='https://github.com/linkedin/shiv'
license=('BSD')
depends=('python-click')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-sphinx'
	'python-sphinx-click'
	'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3c8e9ed893be7828b2ab1366e6d2cdc70b471fe88f5668b8ac713f8f8fd4fa58')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
	sphinx-build -b man docs/ _build/man
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dvm644 _build/man/shiv.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$pkgname-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
