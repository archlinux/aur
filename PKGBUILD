# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-selectolax
_pkg="${pkgname#python-}"
pkgver=0.3.12
pkgrel=1
pkgdesc="HTML5 parser with CSS selectors"
arch=('x86_64')
url="https://github.com/rushter/selectolax"
license=('MIT')
depends=('python')
makedepends=(
	'cython'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
checkdepends=('python-pytest')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('e90473656f9c0e3f760712b965e1f2398109afd0faf416be52d2afbad3fe5791')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

## FIXME: cannot run due to circular imports
# check() {
# 	cd "selectolax-$pkgver"
# 	local _version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
# 	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_version" pytest -x
# }

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
