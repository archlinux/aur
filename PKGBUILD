pkgname=libdnf
pkgver=0.24.1
pkgrel=1
pkgdesc="Library providing simplified C and Python API to libsolv"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('LGPL2.1')
depends=('glib2' 'gpgme' 'json-c' 'libmodulemd>=1.6.1' 'librepo' 'libsolv'
         'libutil-linux' 'openssl' 'rpm-org' 'sqlite' 'zlib')
makedepends=('cmake' 'gtk-doc' 'python' 'python-sphinx' 'swig')
checkdepends=('check' 'cppunit' 'python-nose')
optdepends=('python: for python bindings')
provides=( 'hawkey')
conflicts=('hawkey')
replaces=( 'hawkey')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('743b1f29d93bd8a3a6902a473b31ce4e')

prepare() {
	cd "$pkgname-$pkgver"
	rm -rf build
	mkdir build

	# sphinx-build-3 does not exist on Arch Linux,
	# use sphinx-build instead
	sed -e 's/sphinx-build-3/sphinx-build/' \
	    -i docs/hawkey/CMakeLists.txt

	cp -p /usr/share/cmake/Modules/FindLibSolv.cmake cmake/modules/
}

build() {
	cd "$pkgname-$pkgver"/build

	cmake -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_C_FLAGS="$CFLAGS $CPPFLAGS" \
	      -DCMAKE_CXX_FLAGS="$CXXFLAGS $CPPFLAGS" \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPYTHON_DESIRED=3 \
	      ..

	make
}

# As CMake looks for check dependencies, the function check() must be
# defined or else makepkg will not install them and the build will fail.
check() {
	cd "$pkgname-$pkgver"/build
	# Fails because Arch Linux's /etc/os-release does not have a
	# VERSION_ID field
	#make ARGS="-V" test
}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install
	if [[ "$CARCH" == "x86_64" ]]; then
		mv "$pkgdir/"usr/lib64/* "$pkgdir/"usr/lib
		rmdir "$pkgdir/"usr/lib64
	fi

	install -Dp -m644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
