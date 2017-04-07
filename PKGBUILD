_name=pyjnius
pkgbase=python-$_name
pkgname=(python2-$_name python-$_name)
pkgver=1.1.1
pkgrel=1
pkgdesc='Python module to access Java class as Python class, using JNI.'
arch=(any)
url="https://github.com/kivy/$_name"
license=(LGPL3)
source=("$_name-$pkgver.tar.gz::https://github.com/kivy/$_name/tarball/$pkgver")
md5sums=(2d457e4761b27e6760cf54efb6201f17)

prepare() {
	[[ ! -d "python-$_name-$pkgver"  ]] && mv "kivy-$_name-"* "python-$_name-$pkgver" || true
	[[ ! -d "python2-$_name-$pkgver" ]] && cp -r python{,2}-"$_name-$pkgver" || true
}

build() {
	local python=${pkgname%%-*}
	cd "$pkgname-$pkgver"
	
	$python setup.py build_ext --inplace -f
	$python setup.py build
}

package_python2-pyjnius() {
	depends=(java-environment python2)
	makedepends=(cython2)
	package_ python2
}

package_python-pyjnius() {
	depends=(java-environment python)
	makedepends=(cython)
	package_ python
}

package_() {
	local python=$1
	local pyver=$($python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
	export PYTHONPATH="$pkgdir/usr/lib/python$pyver/site-packages"
	mkdir -p "$PYTHONPATH"
	
	cd "$srcdir/$pkgname-$pkgver"
	$python setup.py install --prefix="$pkgdir/usr" --optimize=1
}
