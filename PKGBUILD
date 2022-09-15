# Maintainer: Aditya Sirish <aditya@saky.in>
# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=shiv
pkgver=1.0.2
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
sha256sums=('7d4e87e8d2705d313d69bc3219a2dc334197f44b29641222ba0e3e636dd170d1')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
	sphinx-build -b man docs/ _build/man
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 _build/man/shiv.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$pkgname-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
