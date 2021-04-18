pkgname=libdnf
pkgver=0.61.1
pkgrel=1
pkgdesc="Library providing simplified C and Python API to libsolv"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('LGPL2.1')
depends=('glib2' 'gpgme' 'json-c' 'libmodulemd>=2.11.2' 'librepo>=1.13.1' 'libsolv>=0.7.17'
         'libutil-linux' 'openssl' 'rpm-tools>=4.11.0' 'sqlite' 'zlib')
makedepends=('cmake>=3.13' 'gtk-doc' 'python' 'python-sphinx' 'swig' 'zchunk>=0.9.11')
checkdepends=('check' 'cppunit')
optdepends=('python: for python bindings')
provides=( 'hawkey')
conflicts=('hawkey')
replaces=( 'hawkey')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('514f0ca9a334008ce7c19a62cddd88be')

prepare() {
	cd "$pkgname-$pkgver"

	cp -p /usr/share/cmake/Modules/FindLibSolv.cmake cmake/modules/
}

build() {
	cd "$pkgname-$pkgver"

	cmake -B build \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_C_FLAGS_RELEASE='-DNDEBUG' \
	      -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DPYTHON_DESIRED=3 \
	      -DWITH_ZCHUNK=ON \
	      -Wno-dev

	make -C build VERBOSE=1
}

# As CMake looks for check dependencies, the function check() must be
# defined or else makepkg will not install them and the build will fail.
check() {
	cd "$pkgname-$pkgver"

	# Fails because Arch Linux's /etc/os-release does not have a
	# VERSION_ID field
	make -n -C build ARGS="--output-on-failure" test
}

package() {
	cd "$pkgname-$pkgver"

	make -C build DESTDIR="$pkgdir/" install

	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
