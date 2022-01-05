# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: jerry73204 <jerry73204 at google gmail>

pkgname=('python-asn1' 'python2-asn1')
pkgver=2.4.2
pkgrel=1
pkgdesc='ASN.1 encoder/decoder'
arch=('any')
url='https://github.com/andrivet/python-asn1'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme')
checkdepends=('python-pytest' 'python2-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a4bd0172f87d4161d649d0e924145a99de00bb1985ab4488ce58098893bc25c3')

prepare() {
	cp -a "$pkgname-$pkgver" "python2-asn1-$pkgver"
}

build() {
	( cd "$pkgname-$pkgver"
	  python setup.py build
		cd docs
		PYTHONPATH=../src/ sphinx-build -b man ./ _build/man)
	( cd "python2-asn1-$pkgver"
	  python2 setup.py build )
}

package_python-asn1() {
	depends=('python-future')

	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "docs/_build/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
}

package_python2-asn1() {
	depends=('python2-future' 'python2-enum34')

	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README* -t "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm644 "$srcdir/python-asn1-$pkgver/docs/_build/man/python-asn1.1" \
		"$pkgdir/usr/share/man/man1/$pkgname.1"
}
