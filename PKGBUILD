# Maintainer: Severin Kaderli <severin@kaderli.dev>
# Contributor: aimileus < $(echo YWltaWxpdXNAcHJvdG9ubWFpbC5jb20K | base64 -d)
_pkgname=vita3k
pkgname=${_pkgname}-git
pkgver=r1293.164267bb
pkgrel=1
pkgdesc="Experimental PlayStation Vita emulator"
arch=('x86_64')
url="https://vita3k.org/"
license=('GPL2')
makedepends=(
	'clang'
	'cmake'
	'git'
	'python'
	'vulkan-headers'
	'glslang'
	'gtest'
)
depends=(
	'sdl2'
	'capstone'
	'spdlog'
	'unicorn'
	'yaml-cpp'
	'pugixml'
	'ffmpeg'
	'vulkan-icd-loader'
	'elfio'
	'stb'
	'discord-rpc-api'
	'spirv-cross'
)
provides=('vita3k')
conflicts=('vita3k')
source=(
	"git+https://github.com/vita3k/vita3k.git"
	"git+https://github.com/serge1/ELFIO.git"
	"git+https://github.com/aquynh/capstone.git"
	"git+https://github.com/vitasdk/vita-headers.git"
	"git+https://github.com/jbeder/yaml-cpp.git"
	"git+https://github.com/Vita3K/vita-toolchain.git"
	"git+https://github.com/jonasmr/microprofile.git"
	"git+https://github.com/tcbrindle/sdl2-cmake-scripts.git"
	"git+https://github.com/gabime/spdlog.git"
	"git+https://github.com/nothings/stb.git"
	"git+https://github.com/tronkko/dirent.git"
	"git+https://github.com/B-Con/crypto-algorithms.git"
	"git+https://github.com/ocornut/imgui.git"
	"git+https://github.com/google/googletest.git"
	"git+https://github.com/Vita3K/shaders-db.git"
	"git+https://github.com/KhronosGroup/glslang.git"
	"git+https://github.com/vita3k/SPIRV-Cross.git"
	"git+https://github.com/Vita3K/ext-boost.git"
	"git+https://github.com/Vita3K/dlmalloc.git"
	"git+https://github.com/vita3k/printf.git"
	"git+https://github.com/ocornut/imgui_club.git"
	"git+https://github.com/unicorn-engine/unicorn.git"
	"git+https://github.com/discordapp/discord-rpc.git"
	"git+https://github.com/zeux/pugixml.git"
	"git+https://github.com/aantron/better-enums.git"
	"git+https://github.com/illusionman1212/nativefiledialog-cmake.git"
	"git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
	"git+https://github.com/Vita3K/sdl.git"
	"git+https://github.com/Vita3K/libfat16.git"
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
)

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	git submodule init
	git config submodule.src/external/elfio.url "${srcdir}/ELFIO"
	git config submodule.src/external/capstone.url "${srcdir}/capstone"
	git config submodule.src/external/vita-headers.url "${srcdir}/vita-headers"
	git config submodule.src/external/yaml-cpp.url "${srcdir}/yaml-cpp"
	git config submodule.src/external/vita-toolchain.url "${srcdir}/vita-toolchain"
	git config submodule.src/external/microprofile.url "${srcdir}/microprofile"
	git config submodule.src/external/sdl2-cmake-scripts.url "${srcdir}/sdl2-cmake-scripts"
	git config submodule.src/external/spdlogs.url "${srcdir}/spdlog"
	git config submodule.src/external/stb.url "${srcdir}/stb"
	git config submodule.src/external/dirent.url "${srcdir}/dirent"
	git config submodule.src/external/crypto-algorithms.url "${srcdir}/crypto-algorithms"
	git config submodule.src/external/imgui.url "${srcdir}/imgui"
	git config submodule.src/external/googletest.url "${srcdir}/googletest"
	git config submodule.src/external/shaders-db.url "${srcdir}/shaders-db"
	git config submodule.src/external/glslang.url "${srcdir}/glslang"
	git config submodule.src/external/SPIRV-Cross.url "${srcdir}/SPIRV-Cross"
	git config submodule.src/external/boost.url "${srcdir}/ext-boost"
	git config submodule.src/external/dlmalloc.url "${srcdir}/dlmalloc"
	git config submodule.src/external/printf.url "${srcdir}/printf"
	git config submodule.src/external/imgui_club.url "${srcdir}/imgui_club"
	git config submodule.src/external/unicorn-src.url "${srcdir}/unicorn"
	git config submodule.src/external/discord-rpc.url "${srcdir}/discord-rpc"
	git config submodule.src/external/pugixml.url "${srcdir}/pugixml"
	git config submodule.src/external/better-enums.url "${srcdir}/better-enums"
	git config submodule.src/external/nativefiledialog-cmake.url "${srcdir}/nativefiledialog-cmake"
	git config submodule.src/external/VulkanMemoryAllocator.url "${srcdir}/VulkanMemoryAllocator"
	git config submodule.src/external/libfat16.url "${srcdir}/libfat16"
	git submodule update
}

build() {
	cd "${_pkgname}"

	# Clang is needed for the build to work for now
	export CC="/usr/bin/clang"
	export CXX="/usr/bin/clang++"

	# Set the python
	PYTHON_INCLUDE_PATH="$(python -c "from sysconfig import get_paths as gp; print(gp()['include'])")"
	export CPATH="${PYTHON_INCLUDE_PATH}"
	./gen-linux.sh

	# Workaround for linking problem with discord-rpc
	rm -rf build-linux
	mkdir -p build-linux
	cd build-linux
	cmake .. -DUSE_DISCORD_RICH_PRESENCE=OFF

	make UNICORN_QEMU_FLAGS="--python=/usr/bin/python2"
}

package() {
	cd "${_pkgname}"

	install -d -m 755 "${pkgdir}/usr/bin/"
	install -d -m 755 "${pkgdir}/opt/vita3k/"

	cp -r "build-linux/bin/"* "${pkgdir}/opt/vita3k/"
	ln -s "/opt/vita3k/Vita3K" "${pkgdir}/usr/bin/vita3k"

	# This folder needs 777 permissions because vita3k creates a log file
	chmod 777 "${pkgdir}/opt/vita3k/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
