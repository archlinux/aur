# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Dan Serban
# Contributor: Fabio Volpe

pkgbase=python-pymunk
pkgname=(python-pymunk python2-pymunk)
pkgver=4.0.0
pkgrel=1
pkgdesc="A wrapper around the 2d physics library Chipmunk"
arch=(any)
url=http://www.pymunk.org/en/latest/
license=MIT
makedepends=(python python2)
source=("http://pymunk.googlecode.com/files/pymunk-$pkgver.zip")

prepare() {
	cd "$srcdir"/pymunk-$pkgver
	rm pymunk/*.{so,dll}
	sed '/print poly.radius/d' -i pymunk/pygame_util.py

	cd ..
	cp -r pymunk-$pkgver pymunk-$pkgver-py2
}

build() {
	cd "$srcdir"/pymunk-$pkgver
	python setup.py build

	cd "$srcdir"/pymunk-$pkgver-py2
	python2 setup.py build
}

package_python-pymunk() {
	depends=(python chipmunk)

	cd "$srcdir"/pymunk-$pkgver
	python setup.py install -O1 --skip-build --root="$pkgdir"
	_site_packages=$(python -sSc 'import site; print(site.getsitepackages()[0])')
	ln -s "/usr/lib/libchipmunk.so" "$pkgdir$_site_packages/pymunk/libchipmunk64.so"
	ln -s "/usr/lib/libchipmunk.so" "$pkgdir$_site_packages/pymunk/libchipmunk.so"
}

package_python2-pymunk() {
	depends=(python2 chipmunk)
	provides=(pymunk)
	replaces=(pymunk)
	conflicts=(pymunk)

	cd "$srcdir"/pymunk-$pkgver-py2
	python2 setup.py install -O1 --skip-build --root="$pkgdir"
	_site_packages=$(python2 -sSc 'import site; print site.getsitepackages()[0]')
	ln -s "/usr/lib/libchipmunk.so" "$pkgdir$_site_packages/pymunk/libchipmunk64.so"
	ln -s "/usr/lib/libchipmunk.so" "$pkgdir$_site_packages/pymunk/libchipmunk.so"
}

sha256sums=('7102b1a63d4eeb9eb459d4733663bc0af4ea59f664e3fac2228c704ec6768937')
