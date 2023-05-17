# Maintainer: Cezary Drożak <cezary at drozak dot net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Hamelink <me@johnhame.link>

_pkgname=python-tidalapi
pkgname=$_pkgname-git
pkgver=v0.7.0.r4.g24de7af
pkgrel=1
pkgdesc='Unofficial API for TIDAL music streaming service.'
arch=('any')
url='https://github.com/tamland/python-tidal'
license=('LGPL3')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('python-requests' 'python-dateutil')
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx'
	'python-setuptools')
changelog=HISTORY.rst
source=("$_pkgname::git+$url")
sha256sums=('SKIP')
validpgpkeys=('E09E6FC5E0472F735B7599C4BBEDD0C513635C9F')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
	cd docs
	sphinx-build -b man . _build/man
}

package() {
	export PYTHONHASHSEED=0
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/_build/man/tidalapi.1 -t "$pkgdir/usr/share/man/man1/"
}
