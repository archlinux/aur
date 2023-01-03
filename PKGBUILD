# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-thinc
_pkg="${pkgname#python-}"
pkgver=8.1.6
pkgrel=1
pkgdesc='Practical Machine Learning for NLP'
arch=('x86_64' 'aarch64')
url='https://github.com/explosion/thinc'
license=('MIT')
depends=(
	'python-blis'
	'python-catalogue'
	'python-cymem'
	'python-mock'
	'python-murmurhash'
	'python-numpy'
	'python-packaging'
	'python-plac'
	'python-preshed'
	'python-pydantic'
	'python-six'
	'python-srsly'
	'python-tqdm'
	'python-wasabi')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=('python-pytest' 'python-hypothesis' 'python-mock')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('9241c37761f004fe684e637d2b4d8b79addebabc64e343aa1cba144fad2c9b47')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '18c\PACKAGES = find_packages(exclude=["thinc.tests*"])' setup.py
	sed -i '5,6d' MANIFEST.in
	rm -rf "$_pkg.egg-info"
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation --skip-dependency-check
}

# check() {
# 	cd "$_pkg-$pkgver"
# 	local _py="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
# 	PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_py" pytest -x thinc
# }

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
