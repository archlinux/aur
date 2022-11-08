# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-hupper
_pkg="${pkgname#python-}"
pkgver=1.10.3
pkgrel=5
pkgdesc="Integrated process monitor for developing servers"
arch=('any')
url="https://github.com/pylons/hupper"
license=('MIT')
depends=('python')
optdepends=('python-watchdog')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-watchdog')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/h/$_pkg/$_pkg-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/h/$_pkg/$_pkg-$pkgver.tar.gz.asc")
sha256sums=('cd6f51b72c7587bc9bce8a65ecd025a1e95f1b03284519bfe91284d010316cd9'
            'SKIP')
validpgpkeys=('CC1A48C957AC6ABEF05B2C596BC977B056B829E5')

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
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
