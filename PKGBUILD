# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: BrinkerVII <brinkervii@gmail.com>

pkgname=luau
pkgver=0.683
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
sha256sums=('a2c7aaf906d625e43ca468792acf8e47a9cbd1d4352623b5e62d2a4011faa15c')

build() {
	cd "$_archive"
	local cmake_options=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_CXX_FLAGS='-Wstringop-overread'
		-D LUAU_BUILD_TESTS=On
		-W no-dev
		-D CMAKE_POLICY_VERSION_MINIMUM=3.5
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
