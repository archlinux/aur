# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

## GitHub tarball does not build due to requiring itself for setup

pkgname=python-m2r2
_pkg="${pkgname#python-}"
pkgver=0.3.3
pkgrel=1
pkgdesc="Markdown to reStructuredText converter, forked from m2r"
arch=('any')
url="https://github.com/crossnox/m2r2"
license=('MIT')
depends=('python-mistune1' 'python-docutils' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-six' 'python-sphinx')
provides=('python-m2r')
changelog=CHANGES.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('f9b6e9efbc2b6987dbd43d2fd15a6d115ba837d8158ae73295542635b4086e75')

build() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD" python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
