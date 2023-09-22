# Maintainer: piernov <piernov@piernov.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Chih-Hsuan Yen <yan12125 at gmail dot com>

pkgname=python-plaster
_pkg="${pkgname#python-}"
pkgver=1.1.2
pkgrel=1
pkgdesc="Loader interface for multiple config file formats"
arch=('any')
url="https://github.com/pylons/plaster"
license=('MIT')
depends=('python')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
	'python-sphinx'
	'python-pylons-sphinx-themes')
checkdepends=('python-pytest')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('f8befc54bf8c1147c10ab40297ec84c2676fa2d4ea5d6f524d9436a80074ef98')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	PYTHONPATH="$PWD/src" make -C docs man
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD/src" pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dvm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 "docs/_build/man/$_pkg.1" -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
