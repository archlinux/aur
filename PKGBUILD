# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-randomfiletree
_pkg=RandomFileTree
pkgver=1.2.0
pkgrel=4
pkgdesc="Creates a random file and directory tree/structure for testing"
arch=('any')
url="https://github.com/klieret/randomfiletree"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-sphinx' 'python-wheel')
provides=('randomfiletree')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a48098b75412b9ec36fc8fdc5624cb1051f424e871153e7ef190ec0b23aaa404')

build() {
  cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	make -C doc man
}

package() {
  cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 doc/build/man/randomfiletree.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
