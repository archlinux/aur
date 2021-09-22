# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: shieldwed <shieldwed [at] outlook [dot] com>

pkgbase=python-iptools
pkgname=(python-iptools python2-iptools)
pkgver=0.7.0
pkgrel=2
pkgdesc="Collection of utilities for dealing with IP addresses"
url="https://python-iptools.readthedocs.org/"
license=('BSD')
arch=('any')
makedepends=('python-setuptools' 'python-sphinx' 'python2-setuptools')
checkdepends=('python-nose' 'python2-nose')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/bd808/$pkgbase/archive/v$pkgver.tar.gz")
sha256sums=('5ea59c0867e72d8243305ff1297fc5b2d8feaca650369a29985453ce4f39ca97')

prepare() {
	cp -a "$pkgbase-$pkgver" "$pkgbase-$pkgver-py2"
}

build() {
	pushd "$pkgbase-$pkgver"
	python setup.py build
	cd docs
	make man BUILDDIR="$srcdir"
	popd

	pushd "$pkgbase-$pkgver-py2"
	python2 setup.py build
}

check() {
	pushd "$pkgbase-$pkgver"
	nosetests
	popd

	pushd "$pkgbase-$pkgver-py2"
	nosetests2
}

package_python-iptools() {
	depends=('python')

	install -Dm 644 man/iptools.1 -t "$pkgdir/usr/share/man/man1/"
	cd "$pkgbase-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python2-iptools() {
	depends=('python2')

	install -Dm 644 man/iptools.1 "$pkgdir/usr/share/man/man1/iptools.py2.1"
	cd "$srcdir/$pkgbase-$pkgver"
	PYTHONHASHSEED=0 python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
