# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=('python-xmlformatter' 'python2-xmlformatter')
pkgver=0.2.4
pkgrel=2
pkgdesc="Provides formatting of XML documents"
arch=('any')
url="https://github.com/pamoller/xmlformatter"
license=('MIT')
makedepends=('python2-setuptools' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://pypi.python.org/packages/source/x/xmlformatter/xmlformatter-$pkgver.tar.gz")
sha256sums=('6d93c4bc04cffb1d4cf6eb9d9034018e9b264e4554269e7da67539ba4bff03f5')

build() {
	cd "xmlformatter-$pkgver"
	python -m build --wheel --no-isolation
	python2 -m setuptools.launch setup.py build
}

# package for python 3
package_python-xmlformatter() {
	depends=('python')

	cd "xmlformatter-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/xmlformatter-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# package for python 2
package_python2-xmlformatter() {
	depends=('python2')

	cd "xmlformatter-$pkgver"
	PYTHONHASHSEED=0 python2 -m setuptools.launch setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"

	# non-conflicting executable name
	mv "$pkgdir"/usr/bin/xmlformat "$pkgdir"/usr/bin/xmlformat2
}
