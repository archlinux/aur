# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

## GPG key available on keyserver.ubuntu.com

pkgname=python-hydra
_pkgname=Hydra
pkgver=2.5
pkgrel=2
pkgdesc='High performance bloom filter'
arch=('x86_64')
url='https://github.com/crankycoder/hydra'
license=('MIT')
depends=('python')
makedepends=('cython' 'git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-nose')
changelog=CHANGES.rst
source=("$pkgname::git+$url#tag=$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('B20AA292706B1BA7850F6FC2B0741CAE9BB2D357') ## Hanno Schlichting

build() {
	cd "$pkgname"
	cythonize src/_hydra.pyx
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname"
	local _py="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-cpython-$CARCH-$_py" python setup.py test || true
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
