pkgname=libdnf_fixed
pkgver=0.54.2
pkgrel=1
pkgdesc="Library providing simplified C and Python API to libsolv"
arch=('i686' 'x86_64')
url="https://github.com/kokkiemouse/libdnf"
license=('LGPL2.1')
depends=('glib2' 'gpgme' 'json-c' 'libmodulemd>=2.5.0' 'librepo>=1.12.0' 'libsolv>=0.7.7'
         'libutil-linux' 'openssl' 'rpm-tools>=4.11.0' 'sqlite' 'zlib')
makedepends=('cmake' 'gtk-doc' 'python' 'python-sphinx' 'swig' 'zchunk>=0.9.11' 'clang')
checkdepends=('check' 'cppunit' 'python-nose')
optdepends=('python: for python bindings')
provides=( 'hawkey' 'libdnf=0.54.2')
conflicts=('hawkey' 'libdnf')
replaces=( 'hawkey' 'libdnf')
source=("$url/archive/$pkgver/libdnf-$pkgver.tar.gz")
md5sums=('1ea0b8ed69650e6effa93d1f760bc14a')

prepare() {
	cd "libdnf-$pkgver"
	rm -rf build
	mkdir build

	cp -p /usr/share/cmake/Modules/FindLibSolv.cmake cmake/modules/
}

build() {
	cd "libdnf-$pkgver"/build

	cmake -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_C_FLAGS="$CFLAGS $CPPFLAGS" \
	      -DCMAKE_CXX_FLAGS="$CXXFLAGS $CPPFLAGS" \
		  -DCMAKE_C_COMPILER=clang \
		  -DCMAKE_CXX_COMPILER=clang++ \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DPYTHON_DESIRED=3 \
	      -DWITH_ZCHUNK=ON \
	      ..

	make
}

# As CMake looks for check dependencies, the function check() must be
# defined or else makepkg will not install them and the build will fail.
check() {
	cd "libdnf-$pkgver"/build
	# Fails because Arch Linux's /etc/os-release does not have a
	# VERSION_ID field
	#make ARGS="-V" test
}

package() {
	cd "libdnf-$pkgver"/build

	make DESTDIR="$pkgdir/" install

	install -Dp -m644 ../README.md "$pkgdir/usr/share/doc/libdnf/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
