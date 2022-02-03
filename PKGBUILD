# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: j605

pkgname=python-pyperf
pkgver=2.3.1
pkgrel=1
pkgdesc='Toolkit to run Python benchmarks'
url='https://github.com/vstinner/pyperf'
arch=('any')
license=('MIT')
depends=('python')
makedepends=(
	'python-build'
	'python-install'
	'python-setuptools'
	'python-sphinx'
	'python-wheel')
checkdepends=('python-psutil')
changelog=changelog.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        '001-setup.py.patch')
sha256sums=('82c67986f06b14de040608847546131056177a6cc39be21540c87a3c0fc3e009'
            '925fb3cc19ca60295ebfdccdb55d805a3f372f9597ef151f77609b520171c23e')

prepare() {
	## remove tests from package
	patch -p1 -d "pyperf-$pkgver" < 001-setup.py.patch
}

build() {
	cd "pyperf-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
	cd doc
	make man
}

check() {
	cd "pyperf-$pkgver"
	PYTHONPATH=./ python -m unittest discover pyperf/tests
}

package() {
	export PYTHONHASHSEED=0
	cd "pyperf-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 doc/build/man/pyperf.1 -t "$pkgdir/usr/share/man/man1/"
}
