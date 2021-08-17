# Maintainer: Severin Kaderli <severin@kaderli.dev>
# Contributor: aimileus < $(echo YWltaWxpdXNAcHJvdG9ubWFpbC5jb20K | base64 -d)
pkgname="vita3k-git"
pkgver=r2260.c88796dd
pkgrel=1
pkgdesc="Experimental PlayStation Vita emulator"
arch=('x86_64')
url="https://vita3k.org/"
license=('GPL2')
makedepends=(
	'boost'
	'cmake'
	'git'
	'vulkan-headers'
	'clang'
	'ninja'
)
depends=(
	'gtk3'
	'sdl2'
)
provides=('vita3k')
conflicts=('vita3k')
source=(
	"${pkgname}::git+https://github.com/vita3k/vita3k.git"
	"${pkgname}-better-enums::git+https://github.com/aantron/better-enums.git"
	"${pkgname}-boost::git+https://github.com/Vita3K/ext-boost.git"
	"${pkgname}-capstone::git+https://github.com/aquynh/capstone.git"
	"${pkgname}-crypto-algorithms::git+https://github.com/KorewaWatchful/crypto-algorithms.git"
	"${pkgname}-dirent::git+https://github.com/tronkko/dirent.git"
	"${pkgname}-dlmalloc::git+https://github.com/Vita3K/dlmalloc.git"
	"${pkgname}-elfio::git+https://github.com/serge1/ELFIO.git"
	"${pkgname}-ffmpeg::git+https://github.com/Vita3K/ffmpeg-core.git"
	"${pkgname}-glslang::git+https://github.com/KhronosGroup/glslang.git"
	"${pkgname}-googletest::git+https://github.com/google/googletest.git"
	"${pkgname}-imgui::git+https://github.com/ocornut/imgui.git"
	"${pkgname}-imgui_club::git+https://github.com/ocornut/imgui_club.git"
	"${pkgname}-libfat16::git+https://github.com/Vita3K/libfat16.git"
	"${pkgname}-microprofile::git+https://github.com/jonasmr/microprofile.git"
	"${pkgname}-nativefiledialog-cmake::git+https://github.com/Vita3K/nativefiledialog-cmake.git"
	"${pkgname}-printf::git+https://github.com/Vita3K/printf.git"
	"${pkgname}-pugixml::git+https://github.com/zeux/pugixml.git"
	"${pkgname}-sdl::git+https://github.com/Vita3K/sdl.git"
	"${pkgname}-sdl2-cmake-scripts::git+https://github.com/tcbrindle/sdl2-cmake-scripts.git"
	"${pkgname}-spdlog::git+https://github.com/gabime/spdlog.git"
	"${pkgname}-SPIRV-Cross::git+https://github.com/KhronosGroup/SPIRV-Cross.git"
	"${pkgname}-stb::git+https://github.com/nothings/stb.git"
	"${pkgname}-unicorn::git+https://github.com/Vita3K/unicorn.git"
	"${pkgname}-vita-toolchain::git+https://github.com/vitasdk/vita-toolchain.git"
	"${pkgname}-VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
	"${pkgname}-yaml-cpp::git+https://github.com/jbeder/yaml-cpp.git"
	"${pkgname}-psvpfstools::git+https://github.com/Vita3K/psvpfstools.git"
	"${pkgname}-xxHash::git+https://github.com/Cyan4973/xxHash.git"
	"${pkgname}-dynarmic::git+https://github.com/Vita3K/dynarmic.git"
	"${pkgname}-fmt::git+https://github.com/fmtlib/fmt.git"
)
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname}"

	git submodule init
	# Use the submodules declared in the sources array
	git submodule foreach 'git config submodule.${name}.url ${srcdir}/${pkgname}-$(cut -d "/" -f 2 <<< "${name}")'
	git submodule update --recursive --init
}

build() {
	cd "${pkgname}"

	export CC="/usr/bin/clang"
	export CXX="/usr/bin/clang++"

	cmake -S . -B build-linux -G Ninja -DCMAKE_TOOLCHAIN_FILE=./cmake/toolchain/linux-x64.cmake -DCMAKE_BUILD_TYPE=Release -DUSE_VULKAN=ON -DUSE_DISCORD_RICH_PRESENCE=OFF
	cmake --build build-linux
}

package() {
	cd "${pkgname}"

	mkdir -p "${pkgdir}/usr/bin/" "${pkgdir}/opt/vita3k/"

	cp -r "build-linux/bin/"* "${pkgdir}/opt/vita3k/"
	ln -s "/opt/vita3k/Vita3K" "${pkgdir}/usr/bin/vita3k"

	# These folders needs 777 permissions because vita3k creates files in them
	chmod 777 "${pkgdir}/opt/vita3k/"
	chmod 777 "${pkgdir}/opt/vita3k/data"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
