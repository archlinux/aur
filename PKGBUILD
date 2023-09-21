# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>

pkgname=python-murmurhash
_pkg="${pkgname#python-}"
pkgver=1.0.10
pkgrel=1
pkgdesc='Cython bindings for MurmurHash2'
arch=('x86_64')
url='https://github.com/explosion/murmurhash'
license=('MIT')
depends=('python')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('5282aab1317804c6ebd6dd7f69f15ba9075aee671c44a34be2bde0f1b11ef88a')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '/PACKAGES =/c\PACKAGES = ["murmurhash"]' setup.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "$_pkg-$pkgver"
# 	local _python_version="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
# 	PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${_python_version}" pytest -x --disable-warnings
# }

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
