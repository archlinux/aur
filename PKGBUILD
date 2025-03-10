# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: BrinkerVII <brinkervii@gmail.com>

pkgname=luau-git
_pkgname=${pkgname%-git}
pkgver=0.664.r1.gb0c3f40
pkgrel=1
pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=(x86_64)
url="https://github.com/luau-lang/$_pkgname"
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cmake
             git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 HEAD |
		sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
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
	cd "$_pkgname"
	./build/Luau.Conformance
	./build/Luau.UnitTest
}

package() {
	cd "$_pkgname"
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
