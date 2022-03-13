# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: pfm <vorticity at mail dot ru>

pkgname=python-eliot
pkgver=1.14.0
pkgrel=3
pkgdesc='Logging that tells you why it happened'
arch=('any')
url='https://github.com/itamarst/eliot'
license=('Apache')
depends=('python-six' 'python-zope-interface' 'python-pyrsistent' 'python-boltons')
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx')
checkdepends=('python-pytest' 'python-hypothesis' 'python-testtools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/e/eliot/eliot-$pkgver.tar.gz")
sha256sums=('c2f099a3e8d5ecfc22745766e7cc664a48db64b6b89d986dff270491d8683149')

prepare() {
	cd "eliot-$pkgver"
	## remove tests from final package
	sed -i "/packages=/c\packages=['eliot']," setup.py
}

build() {
	cd "eliot-$pkgver"
	python -m build --wheel --no-isolation
	( cd docs; make man )
}

check() {
	cd "eliot-$pkgver"
	## test_prettyprint requires python-eliot installed at runtime; exclude it
	pytest -x --ignore eliot/tests/test_prettyprint.py --disable-warnings
}

package(){
	export PYTHONHASHSEED=0
	cd "eliot-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/build/man/eliot.1 -t "$pkgdir/usr/share/man/man1/"
}
