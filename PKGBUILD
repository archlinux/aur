pkgname=pypy3-numpy
pkgver=1.24.1
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=('x86_64')
license=('custom')
url="https://www.numpy.org/"
depends=('cblas' 'lapack' 'pypy3')
optdepends=('openblas: faster linear algebra')
makedepends=('pypy3-setuptools' 'gcc-fortran' 'pypy3-cython')
options=('staticlibs')
source=("https://github.com/numpy/numpy/releases/download/v$pkgver/numpy-$pkgver.tar.gz")
sha256sums=('2386da9a471cc00a1f47845e27d916d5ec5346ae9696e01a8a34760858fe9dd2')

build() {
	cd numpy-$pkgver
	pypy3 setup.py build
}

package() {
	cd numpy-$pkgver
	pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/pypy3-numpy/

	install -d "$pkgdir"/usr/bin
	cd "$pkgdir/opt/pypy3/bin"
	for i in f2py f2py3 f2py3.f2py3.$(pypy3 -V | head -1 | cut -d. -f2); do
		mv $i "$pkgdir"/usr/bin/$i-pypy3
	done
}
