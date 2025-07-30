# Maintainer: Joe Davison <joe@davison.tech>
# Maintainer: Kirill Tikhomirov <kirill2980440@gmail.com>

pkgname=openenroth-git
pkgver=r7177.92bd1e2
pkgrel=1
pkgdesc="Open source engine reimplementation of Might & Magic 6, 7, and 8"
arch=('x86_64')
url="https://github.com/OpenEnroth/OpenEnroth"
license=('LGPL-3.0')
depends=('sdl2' 'openal' 'zlib' 'ffmpeg')
makedepends=('git' 'cmake' 'python' 'lld')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "OpenEnroth::git+https://github.com/OpenEnroth/OpenEnroth.git"
    "luajit::git+https://github.com/LuaJIT/LuaJIT.git#branch=v2.1"
    "glm::git+https://github.com/g-truc/glm"
    "googletest::git+https://github.com/google/googletest.git"
    "cli11::git+https://github.com/CLIUtils/CLI11.git"
    "fmt::git+https://github.com/fmtlib/fmt.git"
    "nlohmann_json::git+https://github.com/nlohmann/json.git"
    "magic_enum::git+https://github.com/Neargye/magic_enum.git"
    "fast_float::git+https://github.com/fastfloat/fast_float.git"
    "mio::git+https://github.com/mandreyel/mio"
    "spdlog::git+https://github.com/gabime/spdlog.git"
    "cpplint::git+https://github.com/cpplint/cpplint.git"
    "sol2::git+https://github.com/ThePhD/sol2.git"
    "imgui::git+https://github.com/ocornut/imgui.git#branch=docking"
    "inifile-cpp::git+https://github.com/Rookfighter/inifile-cpp.git"
    "backward-cpp::git+https://github.com/OpenEnroth/backward-cpp.git"
    "small_vector::git+https://github.com/gharveymn/small_vector.git"
    "cmrc::git+https://github.com/vector-of-bool/cmrc.git"
    "gtest-parallel::git+https://github.com/google/gtest-parallel.git"
    "generator::git+https://github.com/TartanLlama/generator.git"
    "luajit-cmake::git+https://github.com/zhaozg/luajit-cmake.git"
    "lambda2::git+https://github.com/boostorg/lambda2.git"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
options=('!buildflags')


prepare() {
    cd "$srcdir/OpenEnroth"
    
    git submodule init
    
    git config submodule.thirdparty/luajit.url "$srcdir/luajit"
    git config submodule.thirdparty/glm.url "$srcdir/glm"
    git config submodule.thirdparty/googletest.url "$srcdir/googletest"
    git config submodule.thirdparty/cli11.url "$srcdir/cli11"
    git config submodule.thirdparty/fmt.url "$srcdir/fmt"
    git config submodule.thirdparty/nlohmann_json.url "$srcdir/nlohmann_json"
    git config submodule.thirdparty/magic_enum.url "$srcdir/magic_enum"
    git config submodule.thirdparty/fast_float.url "$srcdir/fast_float"
    git config submodule.thirdparty/mio.url "$srcdir/mio"
    git config submodule.thirdparty/spdlog.url "$srcdir/spdlog"
    git config submodule.thirdparty/cpplint.url "$srcdir/cpplint"
    git config submodule.thirdparty/sol2.url "$srcdir/sol2"
    git config submodule.thirdparty/imgui/imgui.url "$srcdir/imgui"
    git config submodule.thirdparty/inifile_cpp.url "$srcdir/inifile-cpp"
    git config submodule.thirdparty/backward_cpp.url "$srcdir/backward-cpp"
    git config submodule.thirdparty/small_vector.url "$srcdir/small_vector"
    git config submodule.thirdparty/cmrc.url "$srcdir/cmrc"
    git config submodule.thirdparty/gtest_parallel.url "$srcdir/gtest-parallel"
    git config submodule.thirdparty/generator.url "$srcdir/generator"
    git config submodule.thirdparty/luajit-cmake.url "$srcdir/luajit-cmake"
    git config submodule.thirdparty/lambda2.url "$srcdir/lambda2"
    
    git -c protocol.file.allow=always submodule update
}

pkgver() {
	cd "$srcdir/OpenEnroth"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/OpenEnroth"
	cmake -B build -S . -DCMAKE_BUILD_TYPE=Debug
	cmake --build build
}

package() {
	cd "$srcdir/OpenEnroth"
# Right now, the cmake installer for OE is broken and so installing with cmake --install doesn't work.
# We'll manually move the executable for now
#	DESTDIR="$pkgdir" cmake --install build

	install -d "${pkgdir}/usr/share/games/mm7/shaders"

	install -m 644 resources/shaders/* "${pkgdir}/usr/share/games/mm7/shaders"

	install -D -m 755 "build/src/Bin/OpenEnroth/OpenEnroth" \
		"$pkgdir/usr/bin/openenroth"
}
