# Maintainer: Dylan Delgado <dylan1496@live.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Francois Boulogne <fboulogne at april dot org>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-sigtools
_pkg="${pkgname#python-}"
pkgver=4.0.1
pkgrel=2
pkgdesc='Utilities for working with inspect.Signature objects'
url="https://pypi.python.org/pypi/sigtools"
arch=('any')
license=('MIT')
depends=('python-attrs')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz"
        'remove-tests.patch')
sha256sums=('4b8e135a9cd4d2ea00da670c093372d74e672ba3abb87f4c98d8e73dea54445c'
            'c42b7d2ed37ee0ae11e8b1c3f1323cb824ef2243792f12573189c8e1ef84f7c3')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < remove-tests.patch
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
		"$_site/$_pkg-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
