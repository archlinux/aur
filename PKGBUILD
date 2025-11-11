# Maintainer: Robin Degen <mail@ruadeil.lgbt>

# Upstream luau package:
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: BrinkerVII <brinkervii@gmail.com>

pkgname=luau-static
pkgver=0.699
pkgrel=2
epoch=1
pkgdesc='Static development libraries for the fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=(x86_64)
url="https://github.com/luau-lang/luau"
license=(MIT)
depends=(
	gcc-libs
	glibc
)
makedepends=(cmake ninja)
source=("$url/archive/$pkgver/luau-$pkgver.tar.gz")
sha256sums=('d5b323aadfe0cd9b44330047bd5b755c26f0bc25b6137fec1cbd389aa5b02525')

prepare() {
	cd luau-$pkgver
	[ ${pkgver:0:2} = "0." ] || {
		echo "Possibly misstagged version, please verify"
		return 1
	}
}

build() {
	cd luau-$pkgver
	local cmake_options=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_CXX_FLAGS='-Wstringop-overread'
		-D LUAU_BUILD_TESTS=On
		-W no-dev
		-G Ninja
	)
	cmake -S . -B build "${cmake_options[@]}"
	cmake --build build
}

check() {
	cd luau-$pkgver
	./build/Luau.Conformance
	./build/Luau.UnitTest
}

package() {
	cd luau-$pkgver
	# DESTDIR="$pkgdir" cmake --install build
	local libraries=(
		libisocline.a
		libLuau.Analysis.a
		libLuau.Ast.a
		libLuau.CLI.lib.a
		libLuau.CodeGen.a
		libLuau.Common.a
		libLuau.Compiler.a
		libLuau.Config.a
		libLuau.EqSat.a
		libLuau.Require.a
		libLuau.VM.a
	)
	install -vDm0755 -t "$pkgdir/usr/lib/" "${libraries[@]/#/build/}"

	local component_headers=(
		Analysis
		Ast
		CLI
		CodeGen
		Common
		Compiler
		Config
		EqSat
		Require
		VM
	)

	for component in "${component_headers[@]}"; do
		find "$component/include/" -name "*.h" -exec \
			install -vDm0644 -t "$pkgdir/usr/include/Luau/" {} +
	done

	install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
	install -vDm0644 extern/isocline/LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/isocline-LICENSE.txt"
}

# vim: noet
