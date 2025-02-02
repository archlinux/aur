# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrew Chen <xor.tux@gmail.com>

pkgname=python-cstruct
pkgver=6.0
pkgrel=1
pkgdesc="C-style structs for Python"
url="https://github.com/andreax79/python-cstruct"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d5a7cb840e22d0d41f00ca3abed7ed2f1a291d2fa49dffa6e63519d86d13c5e2')

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
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/cstruct-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
