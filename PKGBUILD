# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=rapidobj
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A fast, header-only, C++17 library for parsing Wavefront .obj files."
arch=('any')
url="https://github.com/guybrush77/rapidobj"
license=('MIT')
groups=()
depends=()
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6b1fd3c2d3b75c997cc0da5561c7b580e0726fecfdb5463876182e13edd18aa5')

prepare() {
	cd "$pkgname-$pkgver"

	mkdir -p build

	# https://github.com/guybrush77/rapidobj/pull/1
	cat > include/RapidObj.pc.in <<-EOF
	prefix=@CMAKE_INSTALL_PREFIX@
	includedir=\${prefix}/@CMAKE_INSTALL_INCLUDEDIR@

	Name: @PROJECT_NAME@
	Version: @PROJECT_VERSION@

	Requires:
	Libs: -pthread -aio
	Cflags: -I\${includedir}
	EOF

	cat >> include/CMakeLists.txt <<-EOF
	# pkg-config file
	configure_file(\${PROJECT_NAME}.pc.in
		\${CMAKE_BINARY_DIR}/\${PROJECT_NAME}.pc
		@ONLY
	)
	install(FILES
		\${CMAKE_BINARY_DIR}/\${PROJECT_NAME}.pc
		DESTINATION \${CMAKE_INSTALL_DATAROOTDIR}/pkgconfig
	)
	EOF
}

build() {
	cd "$pkgname-$pkgver/build"

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		..
	make
}

package() {
	cd "$pkgname-$pkgver/build"

	make DESTDIR="$pkgdir/" install

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
