_name=pyjnius
pkgbase=python-$_name
pkgname=(python2-$_name python-$_name)
pkgver=1.2.0
pkgrel=1
pkgdesc='Python module to access Java class as Python class, using JNI.'
arch=(any)
url="https://github.com/kivy/$_name"
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9ff35438d6f6774d7d6fb0632587e45d5dd3d4ecb1d3a3bef31a3e31de1709d0')
makedepends=(
    cython  python-setuptools
    cython2 python2-setuptools
)

prepare() {
	rm -rf "$srcdir"/python{,2}-"$_name-$pkgver"
	mv "$srcdir/$_name-$pkgver" "$srcdir/python-$_name-$pkgver"
	cp -a "$srcdir"/python{,2}-"$_name-$pkgver"
}

build_() {
	local python=$1
	cd "$srcdir/$python-$_name-$pkgver"
	
	$python setup.py build_ext --inplace -f
	$python setup.py build
}
build() {
	build_ python
	build_ python2
}


check_() {
	local python=$1
	cd "$srcdir/$python-$_name-$pkgver"
	$python setup.py test
}
check_python-pyjnius() {
	check_ python
}
check_python2-pyjnius() {
	check_ python2
}

package_() {
	local python=$1
	cd "$srcdir/$python-$_name-$pkgver"
	
	depends=($python 'java-environment')
	$python setup.py install --root="$pkgdir" --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
package_python-pyjnius() {
	package_ python
}
package_python2-pyjnius() {
	package_ python2
}
