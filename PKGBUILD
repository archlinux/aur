# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-fastecdsa
_pkg="${pkgname#python-}"
pkgver=2.2.3
pkgrel=2
pkgdesc="Python library for fast elliptic curve crypto"
arch=('x86_64')
url="https://github.com/antonkueltz/fastecdsa"
license=('Unlicense')
depends=('python' 'gmp')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-sphinx' 'python-wheel')
changelog=CHANGELOG.md
source=(
	"$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz.asc")
sha256sums=('269bdb0f618b38f8f6aec9d23d23db518046c3cee01a954fa6aa7322a1a7db8f'
            'SKIP')
validpgpkeys=('67C1C1178894F9017D47AC0E15AB0E7C8A4019BF')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '/packages=/s/find_packages()/find_packages(exclude=["fastecdsa.tests*"])/' setup.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	python setup.py test
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
