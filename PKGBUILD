# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrew Chen <xor.tux@gmail.com>

pkgname=python-cstruct
pkgver=2.3
pkgrel=1
pkgdesc="C-style structs for Python"
url="https://github.com/andreax79/python-cstruct"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
changelog=changelog.txt
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'exclude-tests.patch')
sha256sums=('d5a5bbafd3e9b77a8f9e30b9c05c1f9b206719fcaa3d1c6821fab997d2034fb4'
            '50c62f343cdb71381bf5f5e9e71fe75bab9f5b1a4d810855265f3a4c35036569')

prepare() {
	patch -p1 -d "$pkgname-$pkgver" < exclude-tests.patch
}

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname-$pkgver"
	pytest -x
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/cstruct-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
