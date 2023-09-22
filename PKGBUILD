# Maintainer: piernov <piernov@piernov.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=python-plaster-pastedeploy
_pkg="${pkgname#python-}"
_pkg="${_pkg/-/_}"
pkgver=1.0.1
pkgrel=1
pkgdesc="A loader interface around multiple config file formats."
arch=('any')
url="https://github.com/pylons/plaster_pastedeploy"
license=('MIT')
depends=('python-plaster' 'python-pastedeploy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('be262e6d2e41a7264875daa2fe2850cbb0615728bcdc92828fdc72736e381412')

build(){
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check(){
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD/src" pytest -x
}

package(){
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dvm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv \
		"$_site/${_pkg/-/_}-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
