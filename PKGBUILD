# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ben Oliver <ben@bfoliver.com>

pkgname=python-flask-api
_pkg=Flask-API
pkgver=3.0.post1
pkgrel=2
pkgdesc="Browsable web APIs for Flask"
license=('BSD')
arch=('any')
url="https://github.com/flask-api/flask-api"
depends=('python-flask')
optdepends=('python-markdown')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-nose' 'python-markdown')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz"
        'setup.py.patch')
sha256sums=('331889500433b0a5e71ae7910a00ee577c8999baba03ca685b3558ee93031cce'
            'f953e1bf26fa0a51a67a8dea8ae30c153e265b89f5340975a46a7a773dbf9948')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < setup.py.patch
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	nosetests
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/${_pkg/-/_}-$pkgver.dist-info/LICENSE.md" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
