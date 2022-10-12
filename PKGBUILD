# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-codetiming
_pkg="${pkgname#python-}"
pkgver=1.3.2
pkgrel=1
pkgdesc="Flexible, customizable timer for your Python code"
license=('MIT')
arch=('any')
url='https://github.com/realpython/codetiming'
depends=('python')
makedepends=('python-flit-core' 'python-build' 'python-installer')
checkdepends=('python-pytest')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('f8a4ed71042a571e9863022573b76036d3efed726f2bb99a3536e56c201da49c')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD" pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md AUTHORS.md -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
