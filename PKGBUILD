pkgname=hawkey
pkgver=0.5.9
pkgrel=1
pkgdesc="High-level API for the libsolv library"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('LGPL2.1')
depends=('libsolv' 'zlib')
makedepends=('cmake' 'python' 'python-sphinx' 'rpm-org')
checkdepends=('check' 'python-nose')
optdepends=('python: for python bindings')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver-1.tar.gz")
md5sums=('3203a823f517df6b7f39b5cb6a8a4e54')

prepare() {
	cd "$pkgname-$pkgname-$pkgver-1"
	rm -rf build
	mkdir build

	sed -e 's/sphinx-build-3/sphinx-build/' \
	    -i doc/CMakeLists.txt
}

build() {
	cd "$pkgname-$pkgname-$pkgver-1"/build
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
	cd "$pkgname-$pkgname-$pkgver-1"/build
	# TODO: Find out why tests fail and fill a bug report upstream if
	#       needed
	#make ARGS="-V" test
}

package() {
	cd "$pkgname-$pkgname-$pkgver-1"/build
	make DESTDIR="$pkgdir/" install
	if [[ "$CARCH" == "x86_64" ]]; then
		mv "$pkgdir/"usr/lib64/* "$pkgdir/"usr/lib
		rmdir "$pkgdir/"usr/lib64
	fi

	install -D -m644 ../README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ft=sh ts=4 sw=4 noet:
