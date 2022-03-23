# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrew Chen <xor.tux@gmail.com>

pkgname=python-cstruct
pkgver=2.1
pkgrel=2
pkgdesc="C-style structs for Python"
url="https://github.com/andreax79/python-cstruct"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-nose')
changelog=changelog.txt
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bbdd3255f6bf3d82c7519b3f5bd48ac96f36ab5471da49bf86d6110b1ee88676')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname-$pkgver"
	nosetests
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/cstruct-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
