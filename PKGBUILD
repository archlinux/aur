# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: j605

pkgname=python-pyperf
_pkg="${pkgname#python-}"
pkgver=2.4.1
pkgrel=1
pkgdesc='Toolkit to run Python benchmarks'
url='https://github.com/vstinner/pyperf'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-sphinx' 'python-wheel')
checkdepends=('python-psutil')
changelog=changelog.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        '001-setup.py.patch')
sha256sums=('9b18558bfb55ea1e752c221439e842ec837763b7a52dba794d11ca9baf172f73'
            '925fb3cc19ca60295ebfdccdb55d805a3f372f9597ef151f77609b520171c23e')

prepare() {
	## remove tests from package
	patch -p1 -d "$_pkg-$pkgver" < 001-setup.py.patch
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	make -C doc man
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD" python -m unittest discover pyperf/tests
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 doc/build/man/pyperf.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
