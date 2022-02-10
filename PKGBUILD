# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Hamelink <me@johnhame.link>

pkgname=python-tidalapi
pkgver=0.6.10
pkgrel=1
pkgdesc='Unofficial API for TIDAL music streaming service.'
arch=('any')
url='https://github.com/tamland/python-tidal'
license=('LGPL3')
depends=('python-requests')
makedepends=(
	'git'
	'python-build'
	'python-install'
	'python-wheel'
	'python-sphinx'
	'python-setuptools')
changelog=HISTORY.rst
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('E09E6FC5E0472F735B7599C4BBEDD0C513635C9F')

build() {
	cd "$pkgname"
	python -m build --wheel --skip-dependency-check --no-isolation
	cd docs
	sphinx-build -b man . _build/man
}

## tests require an active Tidal session

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/_build/man/tidalapi.1 -t "$pkgdir/usr/share/man/man1/"
}
