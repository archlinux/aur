# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: hexchain <i@hexchain.org>

pkgbase=python-json-delta
_name=json_delta
pkgname=('python-json-delta' 'python2-json-delta')
pkgver=2.0.2
pkgrel=1
pkgdesc="Diff/patch pair for JSON-serialized data structures"
license=('BSD')
arch=("any")
url="https://pypi.python.org/pypi/json-delta/"
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('95ea3ff9908fc7d634c27ffec11db8fd8d935aa3e895d7302915d394b10e0321')

prepare() {
	cp -a "$_name-$pkgver"{,-py2}
}

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build

	cd "$srcdir/$_name-$pkgver-py2"
	python2 setup.py build
}

check() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py test

	cd "$srcdir/$_name-$pkgver-py2"
	python2 setup.py test
}

package_python-json-delta() {
	depends=('python')

	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python2-json-delta() {
	depends=('python2')

	cd "$_name-$pkgver-py2"
	PYTHONHASHSEED=0 python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

	cd "$pkgdir/usr/bin"
	for f in *; do
		mv "$f" "${f}2"
	done
}

