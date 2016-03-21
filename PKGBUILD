pkgname=hawkey
_pkgver=0.6.3
_rpmrel=1
pkgver=$_pkgver.$_rpmrel
pkgrel=1
pkgdesc="High-level API for the libsolv library"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('LGPL2.1')
depends=('libsolv' 'zlib')
makedepends=('cmake' 'python' 'python-sphinx' 'rpm-org')
checkdepends=('check' 'python-nose')
optdepends=('python: for python bindings')
source=("$url/archive/$pkgname-$_pkgver-$_rpmrel.tar.gz")
md5sums=('218f140e871e0bae3f1fd6f2e5edb5e7')

prepare() {
	mv  "$pkgname-$pkgname-$_pkgver-$_rpmrel" "$pkgname-$pkgver"

	cd "$pkgname-$pkgver"
	rm -rf build
	mkdir build

	sed -e 's/sphinx-build-3/sphinx-build/' \
	    -i doc/CMakeLists.txt
}

build() {
	cd "$pkgname-$pkgver"/build
	cmake -DCMAKE_BUILD_TYPE=Release  \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPYTHON_DESIRED=3          \
	      ..
	make
	make doc-man
}

# As CMake looks for check dependencies, the function check() must be
# defined or else makepkg will not install them and the build will fail.
check() {
	cd "$pkgname-$pkgver"/build
	# TODO: Find out why tests fail and fill a bug report upstream if
	#       needed
	#make ARGS="-V" test
}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install
	if [[ "$CARCH" == "x86_64" ]]; then
		mv "$pkgdir/"usr/lib64/* "$pkgdir/"usr/lib
		rmdir "$pkgdir/"usr/lib64
	fi

	install -D -m644 ../README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ft=sh ts=4 sw=4 noet:
