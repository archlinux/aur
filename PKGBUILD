# Maintainer: meow <sosdjolfkhgsldjkfh@gmail.com>
# based off of https://aur.archlinux.org/packages/maretf-git
pkgname=pulsemodel-git
pkgver=0.25.1.r1.r49.g17cf09b2
pkgrel=2
pkgdesc="a model compiler and decompiler for MDL v49, with support for HL2, TF2, L4D2, GMod, CS:S, and SFM. git version."
arch=('x86_64')
url="https://github.com/ToppiOfficial/PulseModel"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cmake' 'git')
_base_name="${pkgname::-4}"
_repo_name="PulseModel"
provides=("$_base_name")
conflicts=("$_base_name")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_repo_name"
	git describe --tags --long --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	echo "prepare!! prepare to DIE !!!!"
	#cd "$srcdir/$_base_name"
	#git submodule init
	#git submodule update
	#cd "$srcdir/$_base_name/ext/sourcepp"
	#git submodule init
	#git submodule update
}

build() {
	cd "$srcdir/$_repo_name"
	cmake -S . -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DZLIBNG_ENABLE_TESTS=OFF \
		-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
		-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
		-DCPACK_GENERATOR="DEB"

	cmake --build build
}

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/$_repo_name/build/$_repo_name/mdlcompiler" "$pkgdir/usr/bin/mdlcompiler"
	install -Dm755 "$srcdir/$_repo_name/build/$_repo_name/mdldecompiler" "$pkgdir/usr/bin/mdldecompiler"
	for _pulse_tool in "$srcdir/$_repo_name/build/$_repo_name/subtools/"*; do
		_tool_name="$(basename -- "$_pulse_tool")"
		install -Dm755 "$_pulse_tool" "$pkgdir/usr/bin/$_tool_name"
	done

	install -Dm644 "$srcdir/$_repo_name/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$_repo_name/build/$_repo_name/licenses/ValveResourceFormat.txt" "$pkgdir/usr/share/licenses/$pkgname/ValveResourceFormat.txt"
	install -Dm644 "$srcdir/$_repo_name/build/$_repo_name/licenses/zstd.txt" "$pkgdir/usr/share/licenses/$pkgname/zstd.txt"
}
