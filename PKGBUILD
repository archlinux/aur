# Maintainer: Michal Wojdyla <micwoj9292 at gmail dot com>

pkgname=python-txzmq
_pkg=txZMQ
pkgver=1.0.1
pkgrel=1
pkgdesc="Twisted bindings for ZeroMQ"
arch=('any')
url='https://github.com/smira/txzmq'
license=('MPL2')
depends=('python-twisted' 'python-pyzmq')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-sphinx'
	'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'setup.py.patch')
sha256sums=('b904411b4894ab4e1d2af65f632ceb3103e86cf38e490cd552ac7a12f78b5c38'
            '70b696fca4b06c0d90f78410e2f63796fd2c6a6d763c1d53f133a21a5cad30a5')

prepare() {
	cd "$_pkg-$pkgver"
	patch -p1 < "$srcdir/setup.py.patch"
	sed -i "s/'\$\$PKGVER\$\$'/'$pkgver'/" setup.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	make -C docs man
}

check() {
	cd "$_pkg-$pkgver"
	python -m unittest discover
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 docs/_build/man/txzmq.1 -t "$pkgdir/usr/share/man/man1/"
}
