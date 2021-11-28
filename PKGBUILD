# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>

pkgbase=justext
pkgname=(python-justext python2-justext)
pkgver=3.0.0
pkgrel=1
pkgdesc="Heuristic based boilerplate removal tool"
url="https://github.com/miso-belica/justext"
arch=('any')
license=('BSD')
changelog=CHANGELOG.rst
makedepends=('python-setuptools' 'python2-setuptools' 'python-docutils')
source=("$pkgbase-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/j/jusText/jusText-$pkgver.tar.gz")
sha256sums=('7640e248218795f6be65f6c35fe697325a3280fcb4675d1525bcdff2b86faadf')

prepare() {
	cp -a "jusText-$pkgver" "jusText-$pkgver-py2"
}

build() {
	(
		cd "jusText-$pkgver"
		python setup.py build
		rst2man README.rst "$srcdir/justext.7"
	)
	(
		cd "jusText-$pkgver-py2"
		python2 setup.py build
	)
}

package_python-justext() {
	depends=('python-lxml')
	provides=('justext')
	replaces=('justext')

	cd "jusText-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$srcdir/justext.7" -t "$pkgdir/usr/share/man/man7/"
}

package_python2-justext() {
	depends=('python2-lxml')
	provides=('justext')
	replaces=('justext')

	cd "jusText-$pkgver-py2"
	PYTHONHASHSEED=0 python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$srcdir/justext.7" -t "$pkgdir/usr/share/man/man7/"
}
