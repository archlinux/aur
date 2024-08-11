# Maintainer: piernov <piernov@piernov.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-hupper
_pkg="${pkgname#python-}"
pkgver=1.12.1
pkgrel=1
pkgdesc="Integrated process monitor for developing servers"
arch=('any')
url="https://github.com/pylons/hupper"
license=('MIT')
depends=('python')
optdepends=('python-watchdog')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-watchdog')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/h/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('06bf54170ff4ecf4c84ad5f188dee3901173ab449c2608ad05b9bfd6b13e32eb')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD/src" pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
