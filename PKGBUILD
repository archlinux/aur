# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: BrinkerVII <brinkervii@gmail.com>

pkgname=luau
pkgver=0.666
pkgrel=1
pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=(x86_64)
url="https://github.com/luau-lang/$pkgname"
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cmake)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('de22ccb3f76bdf4875e70c36a99ebf0cd2ec7409d9d2a5d61cf68493e59eedba')

build() {
	cd "$_archive"
	local cmake_options=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_CXX_FLAGS='-Wstringop-overread'
		-D LUAU_BUILD_TESTS=On
		-W no-dev
	)
	cmake -S . -B build "${cmake_options[@]}"
	cmake --build build
}

check() {
	cd "$_archive"
	./build/Luau.Conformance
	./build/Luau.UnitTest
}

package() {
	cd "$_archive"
	# DESTDIR="$pkgdir" cmake --install build
	local executables=(
		luau
		luau-analyze
		luau-ast
		luau-bytecode
		luau-compile
		luau-reduce
	)
	install -Dm0755 -t "$pkgdir/usr/bin/" "${executables[@]/#/build/}"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
	install -Dm0644 extern/isocline/LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/isocline-LICENSE.txt"
}
