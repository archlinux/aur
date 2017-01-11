# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Dan Serban
# Contributor: Fabio Volpe

pkgbase='python-pymunk'
_libname=${pkgbase/python-/}
pkgname=('python-pymunk' 'python2-pymunk')
pkgver=5.1.0
pkgrel=1
pkgdesc="A wrapper around the 2d physics library Chipmunk"
arch=('any')
url='http://www.pymunk.org/en/latest/'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.zip")

prepare() {
	cd "$srcdir"/pymunk-$pkgver
	sed -r "/^\s*(cmdclass|ext_modules) =/d" -i setup.py
	sed -r "s#^    libfn = .*#    libfn = '/usr/lib/libchipmunk.so'#" -i pymunk/_libload.py

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
	ln -s ../../../libchipmunk.so "$pkgdir$_site_packages"/pymunk/libchipmunk64.so
	ln -s ../../../libchipmunk.so "$pkgdir$_site_packages"/pymunk/libchipmunk.so

	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-pymunk() {
	depends=(python2 chipmunk)
	provides=(pymunk)
	replaces=(pymunk)
	conflicts=(pymunk)

	cd "$srcdir"/pymunk-$pkgver-py2
	python2 setup.py install -O1 --skip-build --root="$pkgdir"

	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

sha256sums=('83b3c6db9b556af215d5cb858b88745924afab53f0025f20e89491e65f606424')
