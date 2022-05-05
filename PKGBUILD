# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>

pkgname=python-ruffus
_pkg="${pkgname#python-}"
pkgver=2.8.4
pkgrel=2
pkgdesc="Lightweight Python library for computational pipelines"
arch=('any')
url='https://github.com/cgat-developers/ruffus'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('6cd3d96e459a1aedcc10341f14fddedfdc13664551757fcd429a241de63826aa')

prepare() {
	# test dir does not respect find_packages(exclude=[])
	rm -rf "$_pkg-$pkgver/$_pkg/test/"
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/LICENSE.TXT" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
