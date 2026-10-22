# Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Co-Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=cemu
_major=2
_minor=6
_patch=0
pkgver=$_major.$_minor
cemu_tag="v$pkgver"
pkgrel=6
pkgdesc='Software to emulate Wii U games and applications on PC'
arch=(x86_64)
url=https://cemu.info
license=(MPL-2.0)
options+=(!strip)
depends=(
	'boost-libs' 'fmt<13' 'libzip' 'pugixml' 'sdl2' 'wxwidgets-gtk3' 'wayland'
	'bluez-libs' 'cubeb' 'glslang' 'libx11' 'openssl' 'curl' 'glibc' 'hicolor-icon-theme'
	'zstd' 'glib2' 'gtk3' 'wxwidgets-common' 'hidapi' 'zlib' 'libgcc' 'libusb' 'libstdc++'
	'zarchive'
)
makedepends=(
	'git' 'cmake>=3.21.1' 'clang' 'llvm' 'ninja' 'lld' 'wayland-protocols'
	'boost' 'glslang' 'glm' 'rapidjson' 'nasm' 'vulkan-headers'
	'glu'
)
optdepends=(
	'alsa-lib: Audio output'
	'vulkan-driver: Vulkan graphics'
)
install=cemu.install
source=(
	"${pkgname}::git+https://github.com/cemu-project/Cemu#tag=${cemu_tag}"
	# Cemu submodules
	git+https://github.com/ocornut/imgui.git#commit=f65bcf481ab34cd07d3909aab1479f409fa79f2f
)
sha512sums=('cb65ab941f213a66f816fbb4ae160ae4c3370ab55a5e6489519c7edbf9c32b6ecdd959294bb9d995015b9aad90fe5f87f28834d86221216174288ba3d0cebb6a'
            'c7afdacbbb714e2e770955d5b7f9306a1b952a278c9e48f13d2bd1fb21d45e0c7d08a7e6af66a562bd585b21c10c7f486cbf8d302aaa32c91722b50246c2e125')

prepare() {
	cd "$srcdir/$pkgname"

	git config --file=.gitmodules submodule.dependencies/imgui.url "$srcdir/imgui"
	git -c protocol.file.allow=always submodule update --init "dependencies/imgui"

	# unbundled fmt
	sed -i '/FMT_HEADER_ONLY/d' src/Common/precompiled.h

	# glm fix
	sed -i 's/glm::glm/glm/' src/Common/CMakeLists.txt src/input/CMakeLists.txt
}

build() {
	# Upstream prefers a build with clang+llvm and Ninja.

	cd "$srcdir"
	local cmake_args=(
		-S "$pkgname"
		-B build
		-G Ninja
		-Wno-author
		-DCMAKE_POLICY_VERSION_MINIMUM=3.21.1
		-DCMAKE_BUILD_TYPE=Release
		-DCMAKE_C_COMPILER=clang
		-DCMAKE_CXX_COMPILER=clang++
		-DCMAKE_CXX_FLAGS="$CXXFLAGS -w -flto=thin"
		-DCMAKE_C_FLAGS="$CFLAGS -flto=thin"
		-DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS -fuse-ld=lld"
		-DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS -fuse-ld=lld"
		-DENABLE_VCPKG=OFF
		-DEMULATOR_VERSION_MAJOR="$_major"
		-DEMULATOR_VERSION_MINOR="$_minor"
		-DEMULATOR_VERSION_PATCH="$_patch"
	)
	cmake "${cmake_args[@]}"
	cmake --build build
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm755 bin/Cemu_release "$pkgdir/usr/bin/Cemu"

	install -dm755 "$pkgdir/usr/share/Cemu"

	GLOBIGNORE=bin/Cemu_release
	cp -ar bin/* "$pkgdir/usr/share/Cemu"
	unset GLOBIGNORE

	install -Dm644 src/resource/logo_icon.png -T "$pkgdir/usr/share/icons/hicolor/128x128/apps/info.cemu.Cemu.png"
	install -Dm644 dist/linux/info.cemu.Cemu.desktop -T "$pkgdir/usr/share/applications/info.cemu.Cemu.desktop"
}
