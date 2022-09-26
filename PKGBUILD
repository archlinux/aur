# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Leon <aur@adigitoleo.dissimulo.com>

pkgname=python-bytecode
_pkg=bytecode
pkgver=0.13.0
pkgrel=1
pkgdesc="Python module to modify bytecode"
arch=('any')
url="https://github.com/MatthieuDartiailh/bytecode"
license=('MIT')
depends=('python')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-sphinx'
	'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('6af3c2f0a31ce05dce41f7eea5cc380e33f5e8fbb7dcee3b52467a00acd52fcd')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '72c\"packages": ["bytecode"],' setup.py
	sed -i '/extensions/d;/html_theme/d' doc/conf.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	make -C doc man
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD" pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 doc/build/man/bytecode.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
