# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=kaitai-struct-cpp-stl-runtime
pkgver=0.11
pkgrel=2
pkgdesc='Kaitai Struct API for C++ using STL'
arch=(x86_64)
url="https://github.com/kaitai-io/${pkgname//-/_}"
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cmake)
_archive="${pkgname//-/_}-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('55f62b0d97e9f8df6db4e4577c6343d6ad95705a4ce6437bf25bf184c06840d2')

prepare() {
	# https://github.com/kaitai-io/kaitai_struct_cpp_stl_runtime/issues/82
	cat > "$pkgname.pc" <<- EOF
		prefix=/usr
		includedir=${prefix}/include
		libdir=${prefix}/lib

		Name: $pkgname
		Description: $pkgdesc
		Version: $pkgver
		Cflags: -I${includedir}/kaitai
		Libs: -L${libdir} -l$pkgname
	EOF
}

build() {
	cd "$_archive"
	local cmake_options=(
		-D CMAKE_BUILD_TYPE=Release
		-D STRING_ENCODING_TYPE=ICONV
		-D CMAKE_INSTALL_PREFIX=/usr
		-D BUILD_TESTS=Off
	)
	cmake -W no-dev -B build "${cmake_options[@]}"
	cmake --build build
}

package() {
	cd "$_archive"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/lib/pkgconfig/" "../$pkgname.pc"
}
