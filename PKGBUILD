# Maintainer: a821 at (nospam) mail de
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Hamelink <me@johnhame.link>

pkgname=python-tidalapi
_name=${pkgname#python-}
pkgver=0.8.10
pkgrel=1
pkgdesc='Unofficial API for TIDAL music streaming service.'
arch=('any')
url='https://github.com/tamland/python-tidal'
license=('LGPL-3.0-or-later')
depends=(
    'python'
    'python-requests'
    'python-dateutil'
    'python-isodate'
    'python-mpegdash'
    'python-pyaes'
    'python-typing_extensions'
)
makedepends=('python-poetry')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f5b7d6ab19cfd40907941200a91d491f16d1b68b0323af9b0660bb739e0aab80')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	## tests require an active Tidal session
	## just check we can import tidalapi
	cd "$_name-$pkgver"
	python -c 'import tidalapi'
}

package() {
	export PYTHONHASHSEED=0
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst HISTORY.rst -t "$pkgdir/usr/share/doc/$pkgname"
}
