# Maintainer: a821
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Hamelink <me@johnhame.link>

pkgname=python-tidalapi
_name=${pkgname#python-}
pkgver=0.7.1
pkgrel=1
pkgdesc='Unofficial API for TIDAL music streaming service.'
arch=('any')
url='https://github.com/tamland/python-tidal'
license=('LGPL3')
depends=('python-requests' 'python-dateutil')
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx'
	'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b6d3a3c3a557477e902ff1944178e93d6ac4eb5ec199db74a6252c0383b95bf8')

prepare() {
	cd "$_name-$pkgver"
	# fix identation warning
	sed -i 's/^ \+Addi/    Addi/' tidalapi/session.py
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
	cd docs
	sphinx-build -b man . _build/man
}

## tests require an active Tidal session

package() {
	export PYTHONHASHSEED=0
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/_build/man/tidalapi.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dm644 README.rst HISTORY.rst -t "$pkgdir/usr/share/doc/$pkgname"
}
