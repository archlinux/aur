pkgname=hawkey
_pkgver=0.5.9
_rpmrel=3
_pkgtag=$pkgname-$_pkgver-$_rpmrel
pkgver=$_pkgver.$_rpmrel
pkgrel=1
pkgdesc="High-level API for the libsolv library"
arch=('x86_64' 'i686')
url="https://github.com/rpm-software-management/$pkgname"
license=('LGPL2.1')
depends=('libsolv' 'zlib')
makedepends=('cmake' 'python' 'python-sphinx' 'rpm-org')
checkdepends=('check' 'python-nose')
optdepends=('python: for python bindings')
source=("$url/archive/$_pkgtag.tar.gz")
sha256sums=('b5122259a10d6ac53b6b547a1526e480b1918acb2e0f93a3ed45625a332cf009')

prepare() {
	mv "$pkgname-$_pkgtag" "$pkgname-$pkgver"

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
