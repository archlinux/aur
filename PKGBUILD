# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrew Chen <xor.tux@gmail.com>

pkgname=python-cstruct
pkgver=5.0
pkgrel=1
pkgdesc="C-style structs for Python"
url="https://github.com/andreax79/python-cstruct"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
changelog=changelog.txt
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7e929b879b9ebdac49bce16e170499180a7273bf381393da27a46bcdefea3fc7')

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
