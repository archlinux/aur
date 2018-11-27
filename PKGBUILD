_name=pyjnius
pkgbase=python-$_name
pkgname=(python2-$_name python-$_name)
pkgver=1.1.3
pkgrel=1
pkgdesc='Python module to access Java class as Python class, using JNI.'
arch=(any)
url="https://github.com/kivy/$_name"
license=(MIT)
source=("$_name-$pkgver.tar.gz::https://github.com/kivy/$_name/tarball/$pkgver")
sha256sums=('f497c1f48bbf57ab1cad5c63cfabbd30585d471d87a7307f35b3a3e4fc0b99df')
makedepends=(
    cython  python-setuptools
    cython2 python2-setuptools
)

prepare() {
	rm -rf "$srcdir"/python{,2}-"$_name-$pkgver"
	# root directory of tar is (e.g.) kivy-pyjnius-a7e791a
	mv kivy-pyjnius-* "$srcdir/python-$_name-$pkgver"
	# They want to install their setup script, wtf?
	sed -i "s/, 'setup'//" "$srcdir/python-$_name-$pkgver/setup_sdist.py"
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
