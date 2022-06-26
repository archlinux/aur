# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-tinyrecord
_pkg="${pkgname#python-}"
pkgver=0.2.1
pkgrel=2
pkgdesc="Atomic transactions for TinyDB"
arch=('any')
url="https://github.com/eugene-eeo/tinyrecord"
license=('MIT')
depends=('python-tinydb')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
checkdepends=('python-pytest')
source=("$pkgname::git+$url#commit=6affc18?signed")
sha256sums=('SKIP')
validpgpkeys=('BB354D48E3A3B416AC1242CB517D153BDE152D17')

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname"
	pytest -x tests.py
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
