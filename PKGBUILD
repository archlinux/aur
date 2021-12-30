# Maintainer: Florian Loitsch <florian@toit.io>
pkgname=toit-git
pkgver=VERSION
pkgrel=4
pkgdesc="Toit programming language SDK"
arch=('x86_64')
url="https://toitlang.org"
license=('LGPL')
depends=('gcc-libs')
makedepends=(
	'git'
	'cmake'
	'ninja'
	'go'
)
provides=('toit')
conflicts=('toit')
source=('git+https://github.com/toitlang/toit')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	echo "include(tools/gitversion.cmake)" > print_version.cmake
	echo "compute_git_version(TOIT_GIT_VERSION)" >> print_version.cmake
	echo "execute_process(COMMAND \${CMAKE_COMMAND} -E echo \${TOIT_GIT_VERSION})" >> print_version.cmake
	cmake -P print_version.cmake
	rm print_version.cmake
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	cd third_party/esp-idf
	git submodule update --init .
	# We only need the mbedtls to build the host tools.
	# Don't bother initializing all the other components.
	git submodule update --init components/mbedtls
}

build() {
	cd "$srcdir/${pkgname%-git}"
	IDF_PATH=third_party/esp-idf make -j1 tools
}

package() {
	cd "$srcdir/${pkgname%-git}"
	IDF_PATH=third_party/esp-idf make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/toit-sdk/bin/toitvm" "$pkgdir/usr/bin"
	ln -s "/opt/toit-sdk/bin/toitc" "$pkgdir/usr/bin"
	ln -s "/opt/toit-sdk/bin/toitpkg" "$pkgdir/usr/bin"
	ln -s "/opt/toit-sdk/bin/toitlsp" "$pkgdir/usr/bin"
}
