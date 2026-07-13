# Maintainer: thebu <thebudman6@proton.me>
pkgname=slang-verilog-git
_pkgname=slang
pkgver=11.0.414.g6001e362f
pkgrel=1
pkgdesc="SystemVerilog compiler and language services (MikePopoloski slang): the slang driver, hierarchy printer, linter, and reflection tools"
arch=('x86_64')
url="https://github.com/MikePopoloski/slang"
license=('MIT')
# Runtime: driver/tools link system fmt and mimalloc (shared). boost and
# tomlplusplus are used header-only, so they are makedepends only.
depends=('fmt' 'mimalloc' 'gcc-libs' 'glibc')
# Built with clang: GCC 16.x ICEs on slang's C++20 template code. clang is
# slang's primary/CI compiler. !lto drops makepkg's -flto=auto (clang rejects
# that GCC-style spelling, and slang links its own deps statically anyway).
makedepends=('cmake' 'ninja' 'git' 'clang' 'boost' 'tomlplusplus' 'python')
# staticlibs: keep libsvlang.a so the installed cmake package + headers are usable
# by downstream consumers. !lto: drop makepkg's clang-incompatible -flto=auto.
options=('staticlibs' '!lto')
provides=('slang-verilog' 'slang-driver')
conflicts=('slang-verilog')
# NOTE: no conflict with community/extra 'slang' (that is S-Lang: /usr/bin/slsh,
# /usr/lib/libslang.so, /usr/include/slang.h). This package ships /usr/bin/slang,
# /usr/lib/libsvlang.a, and /usr/include/slang/ (a directory) - all distinct paths.
source=("${_pkgname}::git+https://github.com/MikePopoloski/slang.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	# Mirror slang's own version (what `slang --version` prints): MAJOR.MINOR come
	# from CMakeLists.txt, PATCH is the commit count since the last tag. slang
	# ignores the tag's own version, so raw `git describe` (e.g. v10.0-...) is
	# misleading -- parse the macros instead so pkgver auto-tracks upstream bumps.
	local major minor patch hash desc
	major=$(grep -oP 'set\(SLANG_VERSION_MAJOR \K[0-9]+' CMakeLists.txt)
	minor=$(grep -oP 'set\(SLANG_VERSION_MINOR \K[0-9]+' CMakeLists.txt)
	desc=$(git describe --tags --long 2>/dev/null)
	if [[ $desc =~ -([0-9]+)-g([0-9a-f]+)$ ]]; then
		patch=${BASH_REMATCH[1]}
		hash=${BASH_REMATCH[2]}
	else
		patch=$(git rev-list --count HEAD)
		hash=$(git rev-parse --short HEAD)
	fi
	printf '%s.%s.%s.g%s' "$major" "$minor" "$patch" "$hash"
}

build() {
	# All third-party deps satisfied from system packages (fmt>=12.2, boost>=1.87,
	# mimalloc>=3.3, tomlplusplus>=3.4), so nothing is fetched during the build.
	cmake -S "$_pkgname" -B build -G Ninja \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_CXX_SCAN_FOR_MODULES=OFF \
		-DSLANG_USE_SYSTEM_FMT=ON \
		-DSLANG_USE_SYSTEM_BOOST=ON \
		-DSLANG_USE_MIMALLOC=ON \
		-DSLANG_INCLUDE_TOOLS=ON \
		-DSLANG_INCLUDE_TESTS=OFF \
		-DSLANG_INCLUDE_INSTALL=ON
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
